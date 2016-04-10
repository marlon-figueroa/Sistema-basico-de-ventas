package org.puntos.modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import org.puntos.modelo.Categoria;
import org.puntos.modelo.Detalleventa;
import org.puntos.modelo.Marca;
import org.puntos.modelo.Proveedor;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-04-09T16:39:10")
@StaticMetamodel(Producto.class)
public class Producto_ { 

    public static volatile ListAttribute<Producto, Detalleventa> detalleventaList;
    public static volatile SingularAttribute<Producto, Categoria> categoriaIdcategoria;
    public static volatile SingularAttribute<Producto, Marca> marcaIdmarca;
    public static volatile SingularAttribute<Producto, Proveedor> proveedorIdproveedor;
    public static volatile SingularAttribute<Producto, Date> fechaVenci;
    public static volatile SingularAttribute<Producto, Integer> stock;
    public static volatile SingularAttribute<Producto, Integer> idproducto;
    public static volatile SingularAttribute<Producto, String> nombre;
    public static volatile SingularAttribute<Producto, Double> precioUni;

}