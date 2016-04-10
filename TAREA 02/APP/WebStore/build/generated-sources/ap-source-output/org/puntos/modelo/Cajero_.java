package org.puntos.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.puntos.modelo.Cuenta;
import org.puntos.modelo.Venta;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-09T16:39:10")
@StaticMetamodel(Cajero.class)
public class Cajero_ { 

    public static volatile SingularAttribute<Cajero, Integer> idcajero;
    public static volatile ListAttribute<Cajero, Venta> ventaList;
    public static volatile SingularAttribute<Cajero, Cuenta> cuentaIdcuenta;
    public static volatile SingularAttribute<Cajero, String> nit;
    public static volatile SingularAttribute<Cajero, String> dui;
    public static volatile SingularAttribute<Cajero, Integer> telefono;
    public static volatile SingularAttribute<Cajero, String> nombre;
    public static volatile SingularAttribute<Cajero, String> email;

}