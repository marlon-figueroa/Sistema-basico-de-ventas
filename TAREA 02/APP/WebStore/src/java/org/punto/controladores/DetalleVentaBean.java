/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.punto.controladores;

import java.io.IOException;
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
@WebServlet(name = "DetalleVentaBean", urlPatterns = {"/DetalleVentaBean"})
public class DetalleVentaBean extends HttpServlet {

    @EJB
    private VentaFacade ventaFacade;
    @EJB
    private DetalleventaFacade detalleventaFacade;
    @EJB
    private ProductoFacade productoFacade;

    private String pagina = "factura.jsp";
    private String actualizar = "factura.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        Detalleventa detalle;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            String iddetalle = request.getParameter("iddetalleventa");
            detalle = new Detalleventa();
            detalle = detalleventaFacade.findById(iddetalle);
            detalleventaFacade.remove(detalle);
            forward = pagina;
            request.setAttribute("mensaje", "eliminado");
            request.setAttribute("detalles", detalleventaFacade.findAll());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = actualizar;
             String iddetalle = request.getParameter("iddetalleventa");
            detalle = new Detalleventa();
            detalle = detalleventaFacade.findById(iddetalle);
            request.setAttribute("elemento", detalle);
        } else if (action.equalsIgnoreCase("listar")) {
            forward = pagina;
            request.setAttribute("detalles", detalleventaFacade.findAll());
        } else {
            forward = pagina;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Detalleventa detalle = new Detalleventa();
        Venta venta = new Venta();
        Producto producto = new Producto();

        String iddetalle = request.getParameter("iddetalleventa");
        detalle.setCantidad(Integer.parseInt(request.getParameter("cantidad")));

        Double precioVenta = Double.parseDouble(request.getParameter("precioVenta"));
        detalle.setPrecioVenta(precioVenta);

        Integer idventa = Integer.parseInt(request.getParameter("idventa"));
        venta = (Venta) ventaFacade.findById(idventa);
        detalle.setVentaIdventa(venta);

        Integer idproducto = Integer.parseInt(request.getParameter("idproducto"));
        producto = (Producto) productoFacade.findById(idproducto);
        detalle.setProductoIdproducto(producto);

        if (iddetalle == null || iddetalle.isEmpty()) {
            detalleventaFacade.create(detalle);
            request.setAttribute("mensaje", "guardado");
        } else {
            detalle.setIddetalleventa(iddetalle);
            detalleventaFacade.edit(detalle);
            request.setAttribute("mensaje", "modificado");
        }
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        request.setAttribute("detalles", detalleventaFacade.findAll());
        view.forward(request, response);
    }
}
