
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class conexion {
    
    private static final String baseDatos ="bdsys";
    private static final String servidor="jdbc:mysql://localhost:8000/"+baseDatos;
    private static final String usuario="root";
     private static final String clave ="";
    
    public Connection conectar(){
        Connection cn =null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(servidor, usuario, clave);
        }catch (Exception e){
            System.err.println("Error al conectar"+ e.getMessage());
        }
        return cn;
    }
    
     public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(servidor, usuario, clave);
    }
    
}
