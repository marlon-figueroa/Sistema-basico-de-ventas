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
import org.punto.negocio.CajeroFacade;
import org.punto.negocio.CuentaFacade;
import org.puntos.modelo.Cajero;
import org.puntos.modelo.Cuenta;

/**
 *
 * @author marlon
 */
@WebServlet(name = "CajeroBean", urlPatterns = {"/CajeroBean"})
public class CajeroBean extends HttpServlet {

    @EJB
    private CajeroFacade dao;
    @EJB
    private CuentaFacade cuentaFacade;

    private String pagina = "cajeros.jsp";
    private String actualizar = "cajero.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        Cajero cajero;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            Integer idcajero = Integer.parseInt(request.getParameter("idcajero"));
            cajero = new Cajero();
            cajero = dao.findById(idcajero);
            dao.remove(cajero);
            forward = pagina;
            request.setAttribute("mensaje", "eliminado");
            request.setAttribute("cajeros", dao.findAll());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = actualizar;
            Integer idcajero = Integer.parseInt(request.getParameter("idcajero"));
            cajero = new Cajero();
            cajero = dao.findById(idcajero);
            request.setAttribute("elemento", cajero);
        } else if (action.equalsIgnoreCase("listar")) {
            forward = pagina;
            request.setAttribute("cajeros", dao.findAll());
        } else {
            forward = pagina;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cajero cajero = new Cajero();
        Cuenta cuenta = null;
        cajero.setNombre(request.getParameter("txtnombre"));
        String idcajero = request.getParameter("idcajero");
        cajero.setTelefono(Integer.parseInt(request.getParameter("txttelefono")));
        cajero.setDui(request.getParameter("txtdui"));
        cajero.setNit(request.getParameter("txtnit"));
        cajero.setEmail(request.getParameter("txtemail"));
        Integer idcuenta = Integer.parseInt(request.getParameter("idcuenta"));
        cuenta = cuentaFacade.findById(idcuenta);
        cajero.setCuentaIdcuenta(cuenta);
        if (idcajero == null || idcajero.isEmpty()) {
            dao.create(cajero);
            request.setAttribute("mensaje", "guardado");
        } else {
            cajero.setIdcajero(Integer.parseInt(idcajero));
            dao.edit(cajero);
            request.setAttribute("mensaje", "modificado");
        }
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        request.setAttribute("cajeros", dao.findAll());
        view.forward(request, response);
    }
}
