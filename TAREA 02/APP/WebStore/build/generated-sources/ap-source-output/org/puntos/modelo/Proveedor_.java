package org.puntos.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.puntos.modelo.Producto;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-09T16:39:10")
@StaticMetamodel(Proveedor.class)
public class Proveedor_ { 

    public static volatile SingularAttribute<Proveedor, Integer> idproveedor;
    public static volatile ListAttribute<Proveedor, Producto> productoList;
    public static volatile SingularAttribute<Proveedor, String> nit;
    public static volatile SingularAttribute<Proveedor, String> dui;
    public static volatile SingularAttribute<Proveedor, Integer> telefono;
    public static volatile SingularAttribute<Proveedor, String> nombre;
    public static volatile SingularAttribute<Proveedor, String> email;

}