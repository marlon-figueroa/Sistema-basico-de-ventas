package org.puntos.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.puntos.modelo.Producto;
import org.puntos.modelo.Venta;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-09T16:39:10")
@StaticMetamodel(Detalleventa.class)
public class Detalleventa_ { 

    public static volatile SingularAttribute<Detalleventa, String> iddetalleventa;
    public static volatile SingularAttribute<Detalleventa, Integer> cantidad;
    public static volatile SingularAttribute<Detalleventa, Double> precioVenta;
    public static volatile SingularAttribute<Detalleventa, Venta> ventaIdventa;
    public static volatile SingularAttribute<Detalleventa, Producto> productoIdproducto;

}