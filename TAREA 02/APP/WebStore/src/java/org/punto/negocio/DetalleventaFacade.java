/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.punto.negocio;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.puntos.modelo.Detalleventa;

/**
 *
 * @author marlon
 */
@Stateless
public class DetalleventaFacade extends AbstractFacade<Detalleventa> {

    @PersistenceContext(unitName = "WebStorePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DetalleventaFacade() {
        super(Detalleventa.class);
    }

    public Detalleventa findById(String id) {
        Query q = em.createNamedQuery("Detalleventa.findByIddetalleventa").setParameter("iddetalleventa", id);
        return (Detalleventa) q.getSingleResult();
    }

    public boolean validarInsercion(String id) {
        Query q = em.createNamedQuery("Detalleventa.validarInsercion").setParameter("iddetalleventa", id);
        return q.getMaxResults() != 0;
    }
}
