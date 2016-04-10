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
import org.punto.negocio.CategoriaFacade;
import org.puntos.modelo.Categoria;

/**
 *
 * @author marlon
 */
@WebServlet(name = "CategoriaBean", urlPatterns = {"/CategoriaBean"})
public class CategoriaBean extends HttpServlet {

    @EJB
    private CategoriaFacade dao;
    private String pagina = "categorias.jsp";
    private String actualizar = "categoria.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        Categoria categoria;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            Integer idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
            categoria = new Categoria();
            categoria = dao.findById(idcategoria);
            dao.remove(categoria);
            forward = pagina;
            request.setAttribute("mensaje", "eliminado");
            request.setAttribute("categorias", dao.findAll());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = actualizar;
            Integer idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
            categoria = new Categoria();
            categoria = dao.findById(idcategoria);
            request.setAttribute("elemento", categoria);
        } else if (action.equalsIgnoreCase("listar")) {
            forward = pagina;
            request.setAttribute("categorias", dao.findAll());
        } else {
            forward = pagina;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Categoria cajero = new Categoria();
        cajero.setNombre(request.getParameter("txtnombre"));
        String idcategoria = request.getParameter("idcategoria");
        if (idcategoria == null || idcategoria.isEmpty()) {
            dao.create(cajero);
            request.setAttribute("mensaje", "guardado");
        } else {
            cajero.setIdcategoria(Integer.parseInt(idcategoria));
            dao.edit(cajero);
            request.setAttribute("mensaje", "modificado");
        }
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        request.setAttribute("categorias", dao.findAll());
        view.forward(request, response);
    }
}
