package com.emergentes.controlador;

import com.emergentes.modelo.GestionarProductos;
import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto objprod = new Producto();
        int id;
        int pos;
        String op = request.getParameter("op");

        if (op.equals("nuevo")) {
            HttpSession ses = request.getSession();
            GestionarProductos producto = (GestionarProductos) ses.getAttribute("producto");
            objprod.setId(producto.obtenerId());
            request.setAttribute("op", op);
            request.setAttribute("miprod", objprod);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }

        if (op.equals("modificar")) {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            GestionarProductos producto = (GestionarProductos) ses.getAttribute("producto");
            pos = producto.ubicarProducto(id);
            objprod = producto.getLista().get(pos);
            request.setAttribute("op", op);
            request.setAttribute("miprod", objprod);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        if (op.equals("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            GestionarProductos producto = (GestionarProductos) ses.getAttribute("producto");
            pos = producto.ubicarProducto(id);
            producto.eliminarProducto(pos);
            ses.setAttribute("producto", producto);
            response.sendRedirect("index.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto objProd = new Producto();
        int pos;
        String op = request.getParameter("op");
        if (op.equals("grabar")) {
            objProd.setId(Integer.parseInt(request.getParameter("id")));
            objProd.setProducto(request.getParameter("producto"));
            objProd.setPrecio(Double.parseDouble(request.getParameter("precio")));
            objProd.setCantidad(Integer.parseInt(request.getParameter("cantidad")));

            HttpSession ses = request.getSession();
            GestionarProductos producto = (GestionarProductos) ses.getAttribute("producto");

            String opg = request.getParameter("opg");
            if (opg.equals("nuevo")) {
                producto.insertarPoducto(objProd);
            }
            else    {
                pos=producto.ubicarProducto(objProd.getId());
                producto.modificarProducto(pos, objProd);
                
            }
            ses.setAttribute("producto", producto);
            response.sendRedirect("index.jsp");
        }

    }

}
