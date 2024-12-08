
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DAOPRODUCTOS {
      public List<productos> obtenerProductos() {
        List<productos> productos = new ArrayList<>();
       
        String sql = "SELECT * FROM productos";
             try (Connection conn = conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                productos producto = new productos(
                    rs.getInt("id"), 
                    rs.getString("nombre"),
                    rs.getDouble("precio"),
                    rs.getString("descripcion"),
                    rs.getBytes("imagen")
                       
                );
                productos.add(producto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return productos;
    }
}

