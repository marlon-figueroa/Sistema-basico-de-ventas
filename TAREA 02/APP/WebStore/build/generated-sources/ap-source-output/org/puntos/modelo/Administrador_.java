package org.puntos.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.puntos.modelo.ConfigPrecios;
import org.puntos.modelo.Cuenta;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-09T16:39:10")
@StaticMetamodel(Administrador.class)
public class Administrador_ { 

    public static volatile SingularAttribute<Administrador, Integer> idadministrador;
    public static volatile ListAttribute<Administrador, ConfigPrecios> configPreciosList;
    public static volatile SingularAttribute<Administrador, Cuenta> cuentaIdcuenta;
    public static volatile SingularAttribute<Administrador, String> nit;
    public static volatile SingularAttribute<Administrador, String> dui;
    public static volatile SingularAttribute<Administrador, Integer> telefono;
    public static volatile SingularAttribute<Administrador, String> nombre;
    public static volatile SingularAttribute<Administrador, String> email;

}