/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.punto.controladores;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.punto.negocio.DetalleventaFacade;
import org.punto.negocio.ProductoFacade;
import org.punto.negocio.VentaFacade;
import org.puntos.modelo.Detalleventa;
import org.puntos.modelo.Producto;
import org.puntos.modelo.Venta;

/**
 *
 * @author marlon
 */
@WebServlet(name = "FacturaBean", urlPatterns = {"/FacturaBean"})
public class FacturaBean extends HttpServlet {

    @EJB
    private ProductoFacade productoFacade;
    @EJB
    private VentaFacade ventaFacade;
    @EJB
    private DetalleventaFacade detalleventaFacade;
    private final List<Detalleventa> listaDetalle = new ArrayList<>();
    private final String pagina = "/factura.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mensaje = request.getParameter("mensaje");
        switch (mensaje) {
            case "eliminar":
                String iddetalle = request.getParameter("iddetalleventa");
                Detalleventa detalle = null;
                detalle = BuscarProducto(iddetalle);
                if (eliminarProducto(detalle)) {
                    request.setAttribute("confirmacion", "eliminado");
                } else {
                    request.setAttribute("confirmacion", "fallo");
                }
                break;
            case "grabar":
                if (validarGrabacion()) {
                    if (grabarVenta()) {
                        request.setAttribute("confirmacion", "grabado");
                    }
                } else {
                    request.setAttribute("confirmacion", "fallo");
                }
                break;
            case "limpiar":
                limpiarLista();
                break;
        }
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        request.setAttribute("Total", getTotal());
        request.setAttribute("detalles", listaDetalle);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mensaje = request.getParameter("mensaje");
        switch (mensaje) {
            case "agregar":
                Detalleventa detalle = new Detalleventa();
                Venta venta = null;
                Producto producto = null;
                Integer cantidad = Integer.parseInt(request.getParameter("cantidad"));
                Integer idproducto = Integer.parseInt(request.getParameter("idproducto"));
                detalle.setIddetalleventa(request.getParameter("iddetalleventa"));
                detalle.setCantidad(cantidad);
                producto = (Producto) productoFacade.findById(idproducto);
                double precioUnitario = producto.getPrecioUni();
                double precioVenta = obtenerPrecioVenta(cantidad, precioUnitario);
                detalle.setPrecioVenta(precioVenta);
                Integer idventa = Integer.parseInt(request.getParameter("idventa"));
                venta = (Venta) ventaFacade.findById(idventa);
                detalle.setVentaIdventa(venta);

                detalle.setProductoIdproducto(producto);
                if (agregarProducto(detalle)) {
                    request.setAttribute("confirmacion", "agregado");
                } else {
                    request.setAttribute("confirmacion", "fallo");
                }
                break;
        }

        RequestDispatcher view = request.getRequestDispatcher(pagina);
        request.setAttribute("detalles", listaDetalle);
        request.setAttribute("Total", getTotal());
        view.forward(request, response);
    }

    public boolean agregarProducto(Detalleventa d) {
        if (d == null) {
            return false;
        } else {
            listaDetalle.add(d);
            return true;
        }
    }

    public boolean eliminarProducto(Detalleventa detalle) {
        if (!listaDetalle.isEmpty()) {
            Object d = detalle;
            listaDetalle.remove(detalle);
            return true;
        } else {
            return false;
        }
    }

    public boolean limpiarLista() {
        if (listaDetalle.isEmpty()) {
            return false;
        } else {
            listaDetalle.clear();
            return true;
        }
    }

    public boolean grabarVenta() {
        if (listaDetalle.isEmpty()) {
            return false;
        } else {
            listaDetalle.stream().forEach((d) -> {
                detalleventaFacade.create(d);
            });
            return true;
        }
    }

    public Double obtenerPrecioVenta(Integer x, Double y) {
        DecimalFormat df = new DecimalFormat("0.00");
        String resultado = df.format(x * y);
        return Double.parseDouble(resultado);
    }

    public Double getTotal() {
        DecimalFormat df = new DecimalFormat("0.00");
        Double var = 0.00;
        if (listaDetalle.isEmpty()) {
            return 0.00;
        } else {
            for (Detalleventa d : listaDetalle) {
                var = var + d.getPrecioVenta();
            }
            String resultado = df.format(var);
            return Double.parseDouble(resultado);
        }
    }

    public Detalleventa BuscarProducto(String codigo) {
        Detalleventa detalle = null;
        if (!listaDetalle.isEmpty()) {
            int i = 0;
            boolean encontrado = false;
            while (!encontrado && i < listaDetalle.size()) {
                detalle = listaDetalle.get(i);
                if (detalle.getIddetalleventa().equalsIgnoreCase(codigo)) {
                    encontrado = true;
                } else {
                    i++;
                }
            }
            if (encontrado) {
                return detalle;
            }
        }
        return null;
    }

    public boolean validarGrabacion() {
        if (!listaDetalle.isEmpty()) {
            for (Detalleventa detalle : listaDetalle) {
                if (detalleventaFacade.validarInsercion(detalle.getIddetalleventa())) {
                    return false;
                } else {
                    return true;
                }
            }
        }
        return false;
    }
}
