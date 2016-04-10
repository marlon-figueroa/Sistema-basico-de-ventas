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
import org.punto.negocio.MarcaFacade;
import org.puntos.modelo.Marca;

/**
 *
 * @author marlon
 */
@WebServlet(name = "MarcaBean", urlPatterns = {"/MarcaBean"})
public class MarcaBean extends HttpServlet {

    @EJB
    private MarcaFacade dao;

    private String pagina = "marcas.jsp";
    private String actualizar = "marca.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        Marca marca;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            Integer idmarca = Integer.parseInt(request.getParameter("idmarca"));
            marca = new Marca();
            marca = dao.findById(idmarca);
            dao.remove(marca);
            forward = pagina;
            request.setAttribute("mensaje", "eliminado");
            request.setAttribute("marcas", dao.findAll());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = actualizar;
            Integer idmarca = Integer.parseInt(request.getParameter("idmarca"));
            marca = new Marca();
            marca = dao.findById(idmarca);
            request.setAttribute("elemento", marca);
        } else if (action.equalsIgnoreCase("listar")) {
            forward = pagina;
            request.setAttribute("marcas", dao.findAll());
        } else {
            forward = pagina;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Marca marca = new Marca();
        marca.setNombre(request.getParameter("txtnombre"));
        String idmarca = request.getParameter("idmarca");
        if (idmarca == null || idmarca.isEmpty()) {
            dao.create(marca);
            request.setAttribute("mensaje", "guardado");
        } else {
            marca.setIdmarca(Integer.parseInt(idmarca));
            dao.edit(marca);
            request.setAttribute("mensaje", "modificado");
        }
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        request.setAttribute("marcas", dao.findAll());
        view.forward(request, response);
    }
}
