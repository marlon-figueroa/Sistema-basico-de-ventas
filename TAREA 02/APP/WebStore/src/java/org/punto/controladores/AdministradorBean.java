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
import org.punto.negocio.AdministradorFacade;
import org.punto.negocio.CuentaFacade;
import org.puntos.modelo.Administrador;
import org.puntos.modelo.Cuenta;

/**
 *
 * @author marlon
 */
@WebServlet(name = "AdministradorBean", urlPatterns = {"/AdministradorBean"})
public class AdministradorBean extends HttpServlet {

    @EJB
    private CuentaFacade cuentaFacade;
    @EJB
    private AdministradorFacade dao;

    private String pagina = "administradores.jsp";
    private String actualizar = "administrador.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        Administrador admin;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            Integer idadmin = Integer.parseInt(request.getParameter("idadmin"));
            admin = new Administrador();
            admin = dao.findById(idadmin);
            dao.remove(admin);
            forward = pagina;
            request.setAttribute("mensaje", "eliminado");
            request.setAttribute("admins", dao.findAll());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = actualizar;
            Integer idadmin = Integer.parseInt(request.getParameter("idadmin"));
            admin = new Administrador();
            admin = dao.findById(idadmin);
            request.setAttribute("elemento", admin);
        } else if (action.equalsIgnoreCase("listar")) {
            forward = pagina;
            request.setAttribute("admins", dao.findAll());
        } else {
            forward = pagina;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Administrador admin = new Administrador();
        Cuenta cuenta = null;
        admin.setNombre(request.getParameter("txtnombre"));
        String idadmin = request.getParameter("idadmin");
        admin.setTelefono(Integer.parseInt(request.getParameter("txttelefono")));
        admin.setDui(request.getParameter("txtdui"));
        admin.setNit(request.getParameter("txtnit"));
        admin.setEmail(request.getParameter("txtemail"));
        Integer idcuenta = Integer.parseInt(request.getParameter("idcuenta"));
        cuenta = cuentaFacade.findById(idcuenta);
        admin.setCuentaIdcuenta(cuenta);
        if (idadmin == null || idadmin.isEmpty()) {
            dao.create(admin);
            request.setAttribute("mensaje", "guardado");
        } else {
            admin.setIdadministrador(Integer.parseInt(idadmin));
            dao.edit(admin);
            request.setAttribute("mensaje", "modificado");
        }
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        request.setAttribute("admins", dao.findAll());
        view.forward(request, response);
    }
}
