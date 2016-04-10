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
import org.puntos.modelo.Cuenta;

/**
 *
 * @author marlon
 */
@Stateless
public class CuentaFacade extends AbstractFacade<Cuenta> {
    @PersistenceContext(unitName = "WebStorePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CuentaFacade() {
        super(Cuenta.class);
    }
    
    public Cuenta findById(int id) {
        Cuenta cuenta = null;
        Query q = em.createNamedQuery("Cuenta.findByIdcuenta").setParameter("idcuenta", id);
        cuenta = (Cuenta) q.getSingleResult();
        return cuenta;
    }

    public boolean validar(String user, String pass) {
        try {
            Cuenta aux = null;
            Query q = em.createNamedQuery("Cuenta.findByUsernameAndPassword").setParameter("username", user).setParameter("password", pass);
            aux = (Cuenta) q.getSingleResult();
            return aux.getUsername().equalsIgnoreCase(user) && aux.getPassword().equalsIgnoreCase(pass);
        } catch (Exception e) {
            return false;
        }
    }
    
    public Cuenta findByUserAndPwd(String user, String pass){
        Query q = em.createNamedQuery("Cuenta.findByUsernameAndPassword").setParameter("username", user).setParameter("password", pass);
        return (Cuenta) q.getSingleResult();
    }
}
