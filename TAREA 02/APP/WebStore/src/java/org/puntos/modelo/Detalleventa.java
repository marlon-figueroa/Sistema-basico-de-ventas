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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author marlon
 */
@Entity
@Table(name = "detalleventa")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Detalleventa.findAll", query = "SELECT d FROM Detalleventa d"),
    @NamedQuery(name = "Detalleventa.validarInsercion", query = "SELECT COUNT(d.iddetalleventa) FROM Detalleventa d WHERE d.iddetalleventa = :iddetalleventa"),
    @NamedQuery(name = "Detalleventa.findByIddetalleventa", query = "SELECT d FROM Detalleventa d WHERE d.iddetalleventa = :iddetalleventa"),
    @NamedQuery(name = "Detalleventa.findByCantidad", query = "SELECT d FROM Detalleventa d WHERE d.cantidad = :cantidad"),
    @NamedQuery(name = "Detalleventa.findByPrecioVenta", query = "SELECT d FROM Detalleventa d WHERE d.precioVenta = :precioVenta")})
public class Detalleventa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "iddetalleventa")
    private String iddetalleventa;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cantidad")
    private int cantidad;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precio_venta")
    private double precioVenta;
    @JoinColumn(name = "producto_idproducto", referencedColumnName = "idproducto")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Producto productoIdproducto;
    @JoinColumn(name = "venta_idventa", referencedColumnName = "idventa")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Venta ventaIdventa;

    public Detalleventa() {
    }

    public Detalleventa(String iddetalleventa) {
        this.iddetalleventa = iddetalleventa;
    }

    public Detalleventa(String iddetalleventa, int cantidad, double precioVenta) {
        this.iddetalleventa = iddetalleventa;
        this.cantidad = cantidad;
        this.precioVenta = precioVenta;
    }

    public String getIddetalleventa() {
        return iddetalleventa;
    }

    public void setIddetalleventa(String iddetalleventa) {
        this.iddetalleventa = iddetalleventa;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public Producto getProductoIdproducto() {
        return productoIdproducto;
    }

    public void setProductoIdproducto(Producto productoIdproducto) {
        this.productoIdproducto = productoIdproducto;
    }

    public Venta getVentaIdventa() {
        return ventaIdventa;
    }

    public void setVentaIdventa(Venta ventaIdventa) {
        this.ventaIdventa = ventaIdventa;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddetalleventa != null ? iddetalleventa.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Detalleventa)) {
            return false;
        }
        Detalleventa other = (Detalleventa) object;
        if ((this.iddetalleventa == null && other.iddetalleventa != null) || (this.iddetalleventa != null && !this.iddetalleventa.equals(other.iddetalleventa))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "" + iddetalleventa + "";
    }

}
