package org.puntos.modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.puntos.modelo.Cajero;
import org.puntos.modelo.Cliente;
import org.puntos.modelo.Detalleventa;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-09T16:39:10")
@StaticMetamodel(Venta.class)
public class Venta_ { 

    public static volatile SingularAttribute<Venta, Integer> idventa;
    public static volatile ListAttribute<Venta, Detalleventa> detalleventaList;
    public static volatile SingularAttribute<Venta, Cliente> clienteIdcliente;
    public static volatile SingularAttribute<Venta, Cajero> cajeroIdcajero;
    public static volatile SingularAttribute<Venta, Date> fechaVenta;

}