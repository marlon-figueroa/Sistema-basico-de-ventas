package org.puntos.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.puntos.modelo.Administrador;
import org.puntos.modelo.Cajero;
import org.puntos.modelo.Cliente;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-09T16:39:10")
@StaticMetamodel(Cuenta.class)
public class Cuenta_ { 

    public static volatile ListAttribute<Cuenta, Cliente> clienteList;
    public static volatile SingularAttribute<Cuenta, String> password;
    public static volatile ListAttribute<Cuenta, Administrador> administradorList;
    public static volatile SingularAttribute<Cuenta, Integer> idcuenta;
    public static volatile ListAttribute<Cuenta, Cajero> cajeroList;
    public static volatile SingularAttribute<Cuenta, String> username;

}