/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.punto.controladores;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.punto.negocio.CategoriaFacade;
import org.punto.negocio.MarcaFacade;
import org.punto.negocio.ProductoFacade;
import org.punto.negocio.ProveedorFacade;
import org.puntos.modelo.Categoria;
import org.puntos.modelo.Marca;
import org.puntos.modelo.Producto;
import org.puntos.modelo.Proveedor;

/**
 *
 * @author marlon
 */
@WebServlet(name = "ProductoBean", urlPatterns = {"/ProductoBean"})
public class ProductoBean extends HttpServlet {

    @EJB
    private ProductoFacade productoFacade;
    @EJB
    private MarcaFacade marcaFacade;
    @EJB
    private CategoriaFacade categoriaFacade;
    @EJB
    private ProveedorFacade proveedorFacade;

    private String pagina = "catalogo-productos.jsp";
    private String actualizar = "producto.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        Producto producto;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            Integer idproducto = Integer.parseInt(request.getParameter("idproducto"));
            producto = new Producto();
            producto = productoFacade.findById(idproducto);
            productoFacade.remove(producto);
            forward = pagina;
            request.setAttribute("mensaje", "eliminado");
            request.setAttribute("productos", productoFacade.findAll());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = actualizar;
            Integer idproducto = Integer.parseInt(request.getParameter("idproducto"));
            producto = new Producto();
            producto = productoFacade.findById(idproducto);
            request.setAttribute("elemento", producto);
        } else if (action.equalsIgnoreCase("listar")) {
            forward = pagina;
            request.setAttribute("productos", productoFacade.findAll());
        } else {
            forward = pagina;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //1. Crear instacias.
            Producto producto = new Producto();
            Categoria categoria = null;
            Proveedor proveedor = null;
            Marca marca = null;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            //2. Obtener la informacion de la jsp.
            String idproducto = request.getParameter("idproducto");
            String nombre = request.getParameter("txtnombre");
            
            Double precioUni = Double.parseDouble(request.getParameter("txtpreciouni"));
            Date fechaVenci = null;
            int stock = Integer.parseInt(request.getParameter("txtstock"));
            int idmarca = Integer.parseInt(request.getParameter("idmarca"));
            int idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
            int idproveedor = Integer.parseInt(request.getParameter("idproveedor"));

            //3. Obtener los objetos.
            categoria = (Categoria) categoriaFacade.findById(idcategoria);
            marca = (Marca) marcaFacade.findById(idmarca);
            proveedor = (Proveedor) proveedorFacade.findById(idproveedor);

            //4. Establecer producto.
            producto.setNombre(nombre);
            producto.setPrecioUni(precioUni);
            producto.setStock(stock);
            fechaVenci = sdf.parse(request.getParameter("txtfechavenci"));
            producto.setFechaVenci(fechaVenci);
            producto.setMarcaIdmarca(marca);
            producto.setCategoriaIdcategoria(categoria);
            producto.setProveedorIdproveedor(proveedor);

            //5. Ejecutar operacion.
            if (idproducto == null || idproducto.isEmpty()) {
                productoFacade.create(producto);
                request.setAttribute("mensaje", "guardado");
            } else {
                producto.setIdproducto(Integer.parseInt(idproducto));
                productoFacade.edit(producto);
                request.setAttribute("mensaje", "modificado");
            }
            RequestDispatcher view = request.getRequestDispatcher(pagina);
            request.setAttribute("productos", productoFacade.findAll());
            view.forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ProductoBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
