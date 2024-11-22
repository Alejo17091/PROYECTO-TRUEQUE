
package Modelo;


public class comprobar {
    
    public static  void main (String[] args){
        conexion c= new conexion();
        if(c.conectar()!=null){
            System.err.println("conexión exitosa");
        }else{
            System.err.println("conexion incorecta");
        }
    }
    
    
    
}
