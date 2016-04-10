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
import org.puntos.modelo.ConfigPrecios;

/**
 *
 * @author marlon
 */
@Stateless
public class ConfigPreciosFacade extends AbstractFacade<ConfigPrecios> {

    @PersistenceContext(unitName = "WebStorePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ConfigPreciosFacade() {
        super(ConfigPrecios.class);
    }

    public ConfigPrecios getConfigPreciosById(int id) {
        Query q = em.createNamedQuery("Cajero.findByIdcajero").setParameter("idcajero", id);
        return (ConfigPrecios) q.getSingleResult();
    }
}
