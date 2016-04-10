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
import org.punto.negocio.ProveedorFacade;
import org.puntos.modelo.Proveedor;

/**
 *
 * @author marlon
 */
@WebServlet(name = "ProveedorBean", urlPatterns = {"/ProveedorBean"})
public class ProveedorBean extends HttpServlet {

    @EJB
    private ProveedorFacade dao;
    private String pagina = "proveedores.jsp";
    private String actualizar = "proveedor.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        Proveedor proveedor;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            Integer idproveedor = Integer.parseInt(request.getParameter("idproveedor"));
            proveedor = new Proveedor();
            proveedor = dao.findById(idproveedor);
            dao.remove(proveedor);
            forward = pagina;
            request.setAttribute("mensaje", "eliminado");
            request.setAttribute("proveedores", dao.findAll());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = actualizar;
            Integer idproveedor = Integer.parseInt(request.getParameter("idproveedor"));
            proveedor = new Proveedor();
            proveedor = dao.findById(idproveedor);
            request.setAttribute("elemento", proveedor);
        } else if (action.equalsIgnoreCase("listar")) {
            forward = pagina;
            request.setAttribute("proveedores", dao.findAll());
        } else {
            forward = pagina;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Proveedor proveedor = new Proveedor();
        proveedor.setNombre(request.getParameter("txtnombre"));
        String idproveedor = request.getParameter("idproveedor");
        proveedor.setTelefono(Integer.parseInt(request.getParameter("txttelefono")));
        proveedor.setDui(request.getParameter("txtdui"));
        proveedor.setNit(request.getParameter("txtnit"));
        proveedor.setEmail(request.getParameter("txtemail"));
        if (idproveedor == null || idproveedor.isEmpty()) {
            dao.create(proveedor);
            request.setAttribute("mensaje", "guardado");
        } else {
            proveedor.setIdproveedor(Integer.parseInt(idproveedor));
            dao.edit(proveedor);
            request.setAttribute("mensaje", "modificado");
        }
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        request.setAttribute("proveedores", dao.findAll());
        view.forward(request, response);
    }
}
