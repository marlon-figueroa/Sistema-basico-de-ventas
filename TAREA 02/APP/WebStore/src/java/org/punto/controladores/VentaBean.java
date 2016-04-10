/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.punto.controladores;

import java.io.IOException;
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
import org.punto.negocio.CajeroFacade;
import org.punto.negocio.ClienteFacade;
import org.punto.negocio.VentaFacade;
import org.puntos.modelo.Cajero;
import org.puntos.modelo.Cliente;
import org.puntos.modelo.Venta;

/**
 *
 * @author marlon
 */
@WebServlet(name = "VentaBean", urlPatterns = {"/VentaBean"})
public class VentaBean extends HttpServlet {

    @EJB
    private VentaFacade ventaFacade;
    @EJB
    private CajeroFacade cajeroFacade;
    @EJB
    private ClienteFacade clienteFacade;

    private String pagina = "ventas.jsp";
    private String actualizar = "venta.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        Venta venta;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            Integer idventa = Integer.parseInt(request.getParameter("idventa"));
            venta = new Venta();
            venta = ventaFacade.findById(idventa);
            ventaFacade.remove(venta);
            forward = pagina;
            request.setAttribute("mensaje", "eliminado");
            request.setAttribute("ventas", ventaFacade.findAll());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = actualizar;
            Integer idventa = Integer.parseInt(request.getParameter("idventa"));
            venta = new Venta();
            venta = ventaFacade.findById(idventa);
            request.setAttribute("elemento", venta);
        } else if (action.equalsIgnoreCase("listar")) {
            forward = pagina;
            request.setAttribute("ventas", ventaFacade.findAll());
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
            Venta venta = new Venta();
            Cajero cajero = new Cajero();
            Cliente cliente = new Cliente();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaVenta = null;
            fechaVenta = sdf.parse(request.getParameter("fechaVenta"));

            String idventa = request.getParameter("idventa");
            venta.setFechaVenta(fechaVenta);

            Integer idcajero = Integer.parseInt(request.getParameter("idcajero"));
            cajero = (Cajero) cajeroFacade.findById(idcajero);
            venta.setCajeroIdcajero(cajero);

            Integer idcliente = Integer.parseInt(request.getParameter("idcliente"));
            cliente = (Cliente) clienteFacade.findById(idcliente);
            venta.setClienteIdcliente(cliente);

            if (idventa == null || idventa.isEmpty()) {
                ventaFacade.create(venta);
                request.setAttribute("mensaje", "guardado");
            } else {
                venta.setIdventa(Integer.parseInt(idventa));
                ventaFacade.edit(venta);
                request.setAttribute("mensaje", "modificado");
            }
            RequestDispatcher view = request.getRequestDispatcher(pagina);
            request.setAttribute("ventas", ventaFacade.findAll());
            view.forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(VentaBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
