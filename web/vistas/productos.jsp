<%@page import="Controlador.srvproducto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.productos" %>
<%@ page import="Modelo.DAOPRODUCTOS" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Productos</title>
      <link rel="stylesheet" type="text/css" href="/sistema2/estilos/estilo1.css">
</head>
<body>
    <div class="container">
        <h1>Listado de Productos</h1>
         <!-- Caja de búsqueda -->
        <div style="margin-bottom: 20px; text-align: center;">
            <input type="text" id="filtroBusqueda" placeholder="Buscar productos de truque..." style="width: 50%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;">
        </div>
        <table>
            <thead>
                <tr>
                     <th>Seleccionar</th>
                    <th>Nombre</th>
                    <th>Valor subjetivo</th>
                    <th>Descripcion</th>
                    <th>Imagen</th>
                </tr>
            </thead>
            <tbody>
             <% 
    DAOPRODUCTOS productoDAO = new DAOPRODUCTOS();
    List<productos> productos = productoDAO.obtenerProductos();
    for (productos producto : productos) {
%>
    <tr>
         <!-- Columna de Checkbox -->
                        <td>
                            <input type="checkbox" name="productosSeleccionados" value="<%= producto.getId() %>">
                        </td>
        <td><%= producto.getNombre() %></td>
        <td><%= producto.getPrecio() %></td>
        <td><%= producto.getDescripcion() %></td>
        
    <td>
   <img src="/sistema2/imagenes/<%= producto.getDescripcion()+".jpg"%>"  width="100" height="100">
</td>
    <!--<img src="/sistema2/imagenes/colchon trueque.jpg" " width="100" height="100">-->
</td>
    </tr>
<%
    }
%>

            </tbody>
            <!-- Botón para procesar la selección -->
          <div style="margin-top: 20px;">
    <!-- Enlace a otro archivo JSP -->
    <a href="/sistema2/vistas/principal_new.jsp" style="text-decoration: none; padding: 10px 20px; background-color: #007bff; color: white; border-radius: 5px; font-size: 16px;">
        Procesar Selección
    </a>
</div>
            <!-- Botón "Hacer Trueque" -->
            <div style="margin-top: 20px;">
                <button type="button" onclick="hacerTrueque()">Hacer Trueque</button>
            </div>
        </form>
    </div>

    <script>
        // Función de ejemplo para manejar el botón "Hacer Trueque"
        function hacerTrueque() {
            alert('Trueque iniciado. Selecciona los productos para intercambiar.');
        }
    </script>
        </table>
    </div>
</body>
</html>
