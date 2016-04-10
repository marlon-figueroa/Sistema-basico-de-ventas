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
import org.puntos.modelo.Administrador;

/**
 *
 * @author marlon
 */
@Stateless
public class AdministradorFacade extends AbstractFacade<Administrador> {

    @PersistenceContext(unitName = "WebStorePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdministradorFacade() {
        super(Administrador.class);
    }

    public Administrador findById(int id) {
        Query q = em.createNamedQuery("Administrador.findByIdadministrador").setParameter("idadministrador", id);
        return (Administrador) q.getSingleResult();
    }

}
