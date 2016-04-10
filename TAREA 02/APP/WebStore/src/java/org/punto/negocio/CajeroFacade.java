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
import org.puntos.modelo.Cajero;

/**
 *
 * @author marlon
 */
@Stateless
public class CajeroFacade extends AbstractFacade<Cajero> {

    @PersistenceContext(unitName = "WebStorePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CajeroFacade() {
        super(Cajero.class);
    }

    public Cajero findById(int id) {
        Query q = em.createNamedQuery("Cajero.findByIdcajero").setParameter("idcajero", id);
        return (Cajero) q.getSingleResult();
    }
}
