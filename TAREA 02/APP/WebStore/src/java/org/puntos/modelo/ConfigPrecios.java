/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.puntos.modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author marlon
 */
@Entity
@Table(name = "config_precios")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ConfigPrecios.findAll", query = "SELECT c FROM ConfigPrecios c"),
    @NamedQuery(name = "ConfigPrecios.findByIdConfigPrecios", query = "SELECT c FROM ConfigPrecios c WHERE c.idConfigPrecios = :idConfigPrecios"),
    @NamedQuery(name = "ConfigPrecios.findByMargen", query = "SELECT c FROM ConfigPrecios c WHERE c.margen = :margen"),
    @NamedQuery(name = "ConfigPrecios.findByDescuento", query = "SELECT c FROM ConfigPrecios c WHERE c.descuento = :descuento")})
public class ConfigPrecios implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_config_precios")
    private Integer idConfigPrecios;
    @Basic(optional = false)
    @NotNull
    @Column(name = "margen")
    private double margen;
    @Basic(optional = false)
    @NotNull
    @Column(name = "descuento")
    private double descuento;
    @JoinColumn(name = "administrador_idadministrador", referencedColumnName = "idadministrador")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Administrador administradorIdadministrador;

    public ConfigPrecios() {
    }

    public ConfigPrecios(Integer idConfigPrecios) {
        this.idConfigPrecios = idConfigPrecios;
    }

    public ConfigPrecios(Integer idConfigPrecios, double margen, double descuento) {
        this.idConfigPrecios = idConfigPrecios;
        this.margen = margen;
        this.descuento = descuento;
    }

    public Integer getIdConfigPrecios() {
        return idConfigPrecios;
    }

    public void setIdConfigPrecios(Integer idConfigPrecios) {
        this.idConfigPrecios = idConfigPrecios;
    }

    public double getMargen() {
        return margen;
    }

    public void setMargen(double margen) {
        this.margen = margen;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public Administrador getAdministradorIdadministrador() {
        return administradorIdadministrador;
    }

    public void setAdministradorIdadministrador(Administrador administradorIdadministrador) {
        this.administradorIdadministrador = administradorIdadministrador;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idConfigPrecios != null ? idConfigPrecios.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ConfigPrecios)) {
            return false;
        }
        ConfigPrecios other = (ConfigPrecios) object;
        if ((this.idConfigPrecios == null && other.idConfigPrecios != null) || (this.idConfigPrecios != null && !this.idConfigPrecios.equals(other.idConfigPrecios))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.ConfigPrecios[ idConfigPrecios=" + idConfigPrecios + " ]";
    }
    
}
