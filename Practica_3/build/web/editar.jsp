<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op=='nuevo'}" var="res" scope="request">
                Registro de
            </c:if>
            <c:if test="${requestScope.op=='modificar'}" var="res" scope="request">
                Modificar
            </c:if> 
            Producto
        </h1>
        <jsp:useBean id="miprod" scope="request" class="com.emergentes.modelo.Producto" />
            <form action="Controlador" method="post">
                <table>
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="id" value="<jsp:getProperty name="miprod" property="id" />"></td>
                    </tr>
                    <tr>
                        <td>Producto</td>
                        <td><input type="text" name="producto" value="<jsp:getProperty name="miprod" property="producto" />"></td>
                    </tr>
                    <tr>
                        <td>Precio</td>
                        <td><input type="text" name="precio" value="<jsp:getProperty name="miprod" property="precio" />"></td>
                    </tr>
                    <tr>
                        <td>Cantidad</td>
                        <td><input type="text" name="cantidad" value="<jsp:getProperty name="miprod" property="cantidad" />"></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="opg" value="${requestScope.op}" />
                            <input type="hidden" name="op" value="grabar" />
                        </td>
                        <td><input type="submit" value="Registrar"></td>
                    </tr>
                   
                             
                </table>
            </form>
      
          <a href="index.jsp"><input type="submit" value="Volver"></a>   
       
    </body>
</html>
