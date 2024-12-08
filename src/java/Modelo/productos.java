/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author aleja
 */
public class productos {
    private int id;
   private String nombre;
    private double precio;
    private String descripcion;
    private byte[] imagen;

      // Constructor
    public productos(Integer id,String nombre, double precio, String descripcion, byte[] imagen) {
      this.id = id;   
    this.nombre = nombre;
        this.precio = precio;
        this.descripcion = descripcion;
        this.imagen=imagen;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }
    
  public int getId() {
    return id; // Asegúrate de que "id" sea la clave primaria en la tabla productos.
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
