/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaBeans;

/**
 *
 * @author edicz
 */
public class AlbergueBean {
    private int idAlbergue;
    private int telefono;
    String passwordAlbergue; 
    String nombreAlbergue;
    String correoAlbergue;
    String direccionAlbergue;
    String longitud;
    String latitud;

    public int getIdAlbergue() {
        return idAlbergue;
    }

    public void setIdAlbergue(int idAlbergue) {
        this.idAlbergue = idAlbergue;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getPasswordAlbergue() {
        return passwordAlbergue;
    }

    public void setPasswordAlbergue(String passwordAlbergue) {
        this.passwordAlbergue = passwordAlbergue;
    }

    public String getNombreAlbergue() {
        return nombreAlbergue;
    }

    public void setNombreAlbergue(String nombreAlbergue) {
        this.nombreAlbergue = nombreAlbergue;
    }

    public String getCorreoAlbergue() {
        return correoAlbergue;
    }

    public void setCorreoAlbergue(String correoAlbergue) {
        this.correoAlbergue = correoAlbergue;
    }

    public String getDireccionAlbergue() {
        return direccionAlbergue;
    }

    public void setDireccionAlbergue(String direccionAlbergue) {
        this.direccionAlbergue = direccionAlbergue;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }
    
    
}
