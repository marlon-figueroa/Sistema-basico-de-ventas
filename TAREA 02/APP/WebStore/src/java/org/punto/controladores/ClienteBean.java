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
import org.punto.negocio.ClienteFacade;
import org.punto.negocio.CuentaFacade;
import org.puntos.modelo.Cliente;
import org.puntos.modelo.Cuenta;

/**
 *
 * @author marlon
 */
@WebServlet(name = "ClienteBean", urlPatterns = {"/ClienteBean"})
public class ClienteBean extends HttpServlet {

    @EJB
    private CuentaFacade cuentaFacade;
    @EJB
    private ClienteFacade dao;
    private String pagina = "clientes.jsp";
    private String actualizar = "cliente.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        Cliente cliente;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            Integer idcliente = Integer.parseInt(request.getParameter("idcliente"));
            cliente = new Cliente();
            cliente = dao.findById(idcliente);
            dao.remove(cliente);
            forward = pagina;
            request.setAttribute("mensaje", "eliminado");
            request.setAttribute("clientes", dao.findAll());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = actualizar;
            Integer idcliente = Integer.parseInt(request.getParameter("idcliente"));
            cliente = new Cliente();
            cliente = dao.findById(idcliente);
            request.setAttribute("elemento", cliente);
        } else if (action.equalsIgnoreCase("listar")) {
            forward = pagina;
            request.setAttribute("clientes", dao.findAll());
        } else {
            forward = pagina;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cliente cliente = new Cliente();
        Cuenta cuenta = null;
        cliente.setNombre(request.getParameter("txtnombre"));
        String idcliente = request.getParameter("idcliente");
        cliente.setTelefono(Integer.parseInt(request.getParameter("txttelefono")));
        cliente.setDui(request.getParameter("txtdui"));
        cliente.setNit(request.getParameter("txtnit"));
        cliente.setEmail(request.getParameter("txtemail"));
        Integer idcuenta = Integer.parseInt(request.getParameter("idcuenta"));
        cuenta = cuentaFacade.findById(idcuenta);
        cliente.setCuentaIdcuenta(cuenta);
        if (idcliente == null || idcliente.isEmpty()) {
            dao.create(cliente);
            request.setAttribute("mensaje", "guardado");
        } else {
            cliente.setIdcliente(Integer.parseInt(idcliente));
            dao.edit(cliente);
            request.setAttribute("mensaje", "modificado");
        }
        RequestDispatcher view = request.getRequestDispatcher(pagina);
        request.setAttribute("clientes", dao.findAll());
        view.forward(request, response);
    }
}
