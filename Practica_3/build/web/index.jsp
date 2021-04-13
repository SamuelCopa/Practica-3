
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Producto"%>
<%@page import="com.emergentes.modelo.GestionarProductos"%>

<%
    if (session.getAttribute("producto") == null) {
        GestionarProductos o1 = new GestionarProductos();
        o1.insertarPoducto(new Producto(1, "Coca Cola", 8.5, 100));
        o1.insertarPoducto(new Producto(2, "Pepsi", 11, 50));
        
        session.setAttribute("producto", o1);

    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h1>Lista de productos</h1>
        <a href="Controlador?op=nuevo">NUEVO PRODUCTO</a>
        <br><br>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Producto</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th colspan="2">Opcion</th>                     
            </tr>

            <c:forEach var="item" items="${sessionScope.producto.getLista()}">
                <tr>
                    <td>${item.id}</td>  
                    <td>${item.producto}</td>  
                    <td>${item.precio}</td>  
                    <td>${item.cantidad}</td>  
                    <td><a href="Controlador?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="Controlador?op=eliminar&id=${item.id}"  onclick="return(confirm('Esta seguro de eliminar ?'))">Eliminar</a></td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
