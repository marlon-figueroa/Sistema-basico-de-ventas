/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.puntos.modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author marlon
 */
@Entity
@Table(name = "cajero")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cajero.findAll", query = "SELECT c FROM Cajero c"),
    @NamedQuery(name = "Cajero.findByIdcajero", query = "SELECT c FROM Cajero c WHERE c.idcajero = :idcajero"),
    @NamedQuery(name = "Cajero.findByNombre", query = "SELECT c FROM Cajero c WHERE c.nombre = :nombre"),
    @NamedQuery(name = "Cajero.findByTelefono", query = "SELECT c FROM Cajero c WHERE c.telefono = :telefono"),
    @NamedQuery(name = "Cajero.findByDui", query = "SELECT c FROM Cajero c WHERE c.dui = :dui"),
    @NamedQuery(name = "Cajero.findByNit", query = "SELECT c FROM Cajero c WHERE c.nit = :nit"),
    @NamedQuery(name = "Cajero.findByEmail", query = "SELECT c FROM Cajero c WHERE c.email = :email")})
public class Cajero implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcajero")
    private Integer idcajero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "telefono")
    private int telefono;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "dui")
    private String dui;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "nit")
    private String nit;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "email")
    private String email;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cajeroIdcajero")
    private List<Venta> ventaList;
    @JoinColumn(name = "cuenta_idcuenta", referencedColumnName = "idcuenta")
    @ManyToOne(optional = false)
    private Cuenta cuentaIdcuenta;

    public Cajero() {
    }

    public Cajero(Integer idcajero) {
        this.idcajero = idcajero;
    }

    public Cajero(Integer idcajero, String nombre, int telefono, String dui, String nit, String email) {
        this.idcajero = idcajero;
        this.nombre = nombre;
        this.telefono = telefono;
        this.dui = dui;
        this.nit = nit;
        this.email = email;
    }

    public Integer getIdcajero() {
        return idcajero;
    }

    public void setIdcajero(Integer idcajero) {
        this.idcajero = idcajero;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @XmlTransient
    public List<Venta> getVentaList() {
        return ventaList;
    }

    public void setVentaList(List<Venta> ventaList) {
        this.ventaList = ventaList;
    }

    public Cuenta getCuentaIdcuenta() {
        return cuentaIdcuenta;
    }

    public void setCuentaIdcuenta(Cuenta cuentaIdcuenta) {
        this.cuentaIdcuenta = cuentaIdcuenta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcajero != null ? idcajero.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cajero)) {
            return false;
        }
        Cajero other = (Cajero) object;
        if ((this.idcajero == null && other.idcajero != null) || (this.idcajero != null && !this.idcajero.equals(other.idcajero))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "" + nombre + "";
    }

}
