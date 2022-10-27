/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidad;

/**
 *
 * @author edicz
 */
public class Mascota {
    int idMascota, meses, idTamano, idCaracter,idPelaje,idSexo,idAlbergue, estado;
    String NombreMascota, foto, color, tamano, caracter, pelaje, sexo;

    public Mascota() {
    }

    public int getIdMascota() {
        return idMascota;
    }

    public void setIdMascota(int idMascota) {
        this.idMascota = idMascota;
    }

    public int getMeses() {
        return meses;
    }

    public void setMeses(int meses) {
        this.meses = meses;
    }

    public int getIdTamano() {
        return idTamano;
    }

    public void setIdTamano(int idTamano) {
        this.idTamano = idTamano;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getIdCaracter() {
        return idCaracter;
    }

    public void setIdCaracter(int idCaracter) {
        this.idCaracter = idCaracter;
    }

    public int getIdPelaje() {
        return idPelaje;
    }

    public void setIdPelaje(int idPelaje) {
        this.idPelaje = idPelaje;
    }

    public int getIdSexo() {
        return idSexo;
    }

    public void setIdSexo(int idSexo) {
        this.idSexo = idSexo;
    }

    public int getIdAlbergue() {
        return idAlbergue;
    }

    public void setIdAlbergue(int idAlbergue) {
        this.idAlbergue = idAlbergue;
    }

    public String getNombreMascota() {
        return NombreMascota;
    }

    public void setNombreMascota(String NombreMascota) {
        this.NombreMascota = NombreMascota;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getTamano() {
        return tamano;
    }

    public void setTamano(String tamano) {
        this.tamano = tamano;
    }

    public String getCaracter() {
        return caracter;
    }

    public void setCaracter(String caracter) {
        this.caracter = caracter;
    }

    public String getPelaje() {
        return pelaje;
    }

    public void setPelaje(String pelaje) {
        this.pelaje = pelaje;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
}
