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

/**
 *
 * @author marlon
 */
@WebServlet(name = "LoginBean", urlPatterns = {"/LoginBean"})
public class LoginBean extends HttpServlet {

    @EJB
    private CuentaFacade dao;
    private static String ERROR = "/error.jsp";
    private static String ADMINISTRADOR = "/main-administrador.jsp";
    private static String CAJERO = "/main-administrador.jsp";
    private static String CLIENTE = "/main-administrador.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rol = request.getParameter("rol");
        String user = request.getParameter("user");
        String pass = request.getParameter("password");
        RequestDispatcher view;
        if (pass == null && pass.isEmpty() && user == null && user.isEmpty()) {
            view = request.getRequestDispatcher(ERROR);
            view.forward(request, response);
        } else {
            switch (rol) {
                case "Administrador":
                    if (dao.validar(user, pass)) {
                        view = request.getRequestDispatcher(ADMINISTRADOR);
                        view.forward(request, response);
                    } else {
                        view = request.getRequestDispatcher(ERROR);
                        view.forward(request, response);
                    }
                    break;
                case "Cajero":
                    if (dao.validar(user, pass)) {
                        view = request.getRequestDispatcher(CAJERO);
                        view.forward(request, response);
                    } else {
                        view = request.getRequestDispatcher(ERROR);
                        view.forward(request, response);
                    }
                    break;
                case "Cliente":
                    if (dao.validar(user, pass)) {
                        view = request.getRequestDispatcher(CLIENTE);
                        view.forward(request, response);
                    } else {
                        view = request.getRequestDispatcher(ERROR);
                        view.forward(request, response);
                    }
                    break;
                default:
                    view = request.getRequestDispatcher(ERROR);
                    view.forward(request, response);
            }
        }
    }

}
