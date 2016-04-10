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
import org.punto.negocio.CuentaFacade;
import org.puntos.modelo.Cuenta;

/**
 *
 * @author marlon
 */
@WebServlet(name = "CuentaBean", urlPatterns = {"/CuentaBean"})
public class CuentaBean extends HttpServlet {

    @EJB
    private CuentaFacade dao;
    private String pagina = "cuentas.jsp";
    private String actualizar = "cuenta.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        Cuenta cuenta;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            Integer idcuenta = Integer.parseInt(request.getParameter("idcuenta"));
            cuenta = new Cuenta();
            cuenta = dao.findById(idcuenta);
            dao.remove(cuenta);
            forward = pagina;
            request.setAttribute("mensaje", "eliminado");
            request.setAttribute("cuentas", dao.findAll());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = actualizar;
            Integer idcuenta = Integer.parseInt(request.getParameter("idcuenta"));
            cuenta = new Cuenta();
            cuenta = dao.findById(idcuenta);
            request.setAttribute("elemento", cuenta);
        } else if (action.equalsIgnoreCase("listar")) {
            forward = pagina;
            request.setAttribute("cuentas", dao.findAll());
        } else {
            forward = pagina;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cuenta cuenta = new Cuenta();
        String idcuenta = request.getParameter("idcuenta");
        cuenta.setUsername(request.getParameter("username"));
        cuenta.setPassword(request.getParameter("password"));
        if (idcuenta == null || idcuenta.isEmpty()) {
            dao.create(cuenta);
            request.setAttribute("mensaje", "guardado");
        } else {
            cuenta.setIdcuenta(Integer.parseInt(idcuenta));
            dao.edit(cuenta);
            request.setAttribute("mensaje", "modificado");
        }
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        request.setAttribute("cuentas", dao.findAll());
        view.forward(request, response);
    }
}
