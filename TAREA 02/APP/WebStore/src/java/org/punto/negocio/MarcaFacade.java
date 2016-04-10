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
import org.puntos.modelo.Marca;

/**
 *
 * @author marlon
 */
@Stateless
public class MarcaFacade extends AbstractFacade<Marca> {

    @PersistenceContext(unitName = "WebStorePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MarcaFacade() {
        super(Marca.class);
    }

    public Marca findById(int id) {
        Query q = em.createNamedQuery("Marca.findByIdmarca").setParameter("idmarca", id);
        return (Marca) q.getSingleResult();
    }
}
