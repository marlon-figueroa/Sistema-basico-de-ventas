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
@WebServlet(name = "RegistrarCliente", urlPatterns = {"/RegistrarCliente"})
public class RegistrarCliente extends HttpServlet {

    @EJB
    private CuentaFacade cuentaFacade;

    @EJB
    private ClienteFacade clienteFacade;
    private static String ERROR = "/error.jsp";
    private static String EXITO = "/index.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("clave");
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String dui = request.getParameter("txtdui");
        String nit = request.getParameter("txtnit");
        String email = request.getParameter("email");
        RequestDispatcher view;

        if (email == null && user == null && pass == null && nombre == null && telefono == null && user.isEmpty() && pass.isEmpty() && nombre.isEmpty() && telefono.isEmpty() && email.isEmpty()) {
            view = request.getRequestDispatcher(ERROR);
            view.forward(request, response);
        } else {
            try {
                Cuenta item = new Cuenta();
                item.setUsername(user);
                item.setPassword(pass);
                cuentaFacade.create(item);
                Cuenta dos = cuentaFacade.findByUserAndPwd(user, pass);
                Cliente cliente = new Cliente();
                cliente.setNombre(nombre);
                cliente.setTelefono(Integer.parseInt(telefono));
                cliente.setDui(dui);
                cliente.setNit(nit);
                cliente.setEmail(email);
                cliente.setCuentaIdcuenta(dos);
                clienteFacade.create(cliente);
                request.setAttribute("padre", "guardado");
                view = request.getRequestDispatcher(EXITO);
                view.forward(request, response);
            } catch (NumberFormatException | ServletException | IOException e) {
                System.out.println("Error: " + e.getMessage());
            }
        }
    }
}
