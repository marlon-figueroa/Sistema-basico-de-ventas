package org.puntos.modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.puntos.modelo.Producto;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-09T16:39:10")
@StaticMetamodel(Marca.class)
public class Marca_ { 

    public static volatile SingularAttribute<Marca, Integer> idmarca;
    public static volatile ListAttribute<Marca, Producto> productoList;
    public static volatile SingularAttribute<Marca, String> nombre;

}