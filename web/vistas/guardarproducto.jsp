<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="java.sql.*" %>
<%@ page import="Modelo.conexion" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Guardar Producto</title>
</head>
<body>
    <h2>Guardando Producto...</h2>
    <%
        // Ruta donde se guardarán las imágenes
        String uploadPath = application.getRealPath("/") + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String resultado = guardarProducto(uploadPath);
    %>
    <p><%= resultado %></p>
    <a href="insertarproducto.jsp">Insertar otro producto</a>
</body>
</html>

<%! 
    public String guardarProducto(String uploadPath) {
        String nombre = "";
        String precio = "";
        String descripcion = "";
        String imagenRuta = "";

        try {
            // Configurar el analizador para solicitudes multipart
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Procesar datos del formulario
            List<FileItem> formItems = upload.parseRequest((HttpServletRequest) pageContext.getRequest());

            for (FileItem item : formItems) {
                if (item.isFormField()) {
                    // Procesar campos normales del formulario
                    if (item.getFieldName().equals("nombre")) {
                        nombre = item.getString("UTF-8");
                    } else if (item.getFieldName().equals("precio")) {
                        precio = item.getString("UTF-8");
                    } else if (item.getFieldName().equals("descripcion")) {
                        descripcion = item.getString("UTF-8");
                    }
                } else {
                    // Procesar archivo de imagen
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadPath + File.separator + fileName;
                    File storeFile = new File(filePath);
                    item.write(storeFile); // Guardar el archivo en la carpeta
                    imagenRuta = "uploads/" + fileName; // Ruta relativa para la base de datos
                }
            }

            // Guardar los datos en la base de datos
            Connection con = conexion.getConnection();
            String query = "INSERT INTO productos (nombre, precio, descripcion, imagen) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, nombre);
            pstmt.setDouble(2, Double.parseDouble(precio));
            pstmt.setString(3, descripcion);
            pstmt.setString(4, imagenRuta);

            int rows = pstmt.executeUpdate();
            con.close();

            if (rows > 0) {
                return "Producto guardado con éxito.<br>" +
                       "<b>Nombre:</b> " + nombre + "<br>" +
                       "<b>Precio:</b> $" + precio + "<br>" +
                       "<b>Descripción:</b> " + descripcion + "<br>" +
                       "<b>Imagen:</b><br>" +
                       "<img src='" + imagenRuta + "' alt='Imagen del producto' width='200'>";
            } else {
                return "Error al guardar el producto.";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "Ocurrió un error: " + e.getMessage();
        }
    }
%>
