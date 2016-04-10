package org.puntos.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.puntos.modelo.Cuenta;
import org.puntos.modelo.Venta;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-09T16:39:10")
@StaticMetamodel(Cliente.class)
public class Cliente_ { 

    public static volatile ListAttribute<Cliente, Venta> ventaList;
    public static volatile SingularAttribute<Cliente, Cuenta> cuentaIdcuenta;
    public static volatile SingularAttribute<Cliente, String> nit;
    public static volatile SingularAttribute<Cliente, String> dui;
    public static volatile SingularAttribute<Cliente, Integer> telefono;
    public static volatile SingularAttribute<Cliente, Integer> idcliente;
    public static volatile SingularAttribute<Cliente, String> nombre;
    public static volatile SingularAttribute<Cliente, String> email;

}