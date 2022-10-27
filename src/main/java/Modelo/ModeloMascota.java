/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Entidad.Caracter;
import Entidad.Mascota;
import Entidad.Pelaje;
import Entidad.Sexo;
import Entidad.Solicitud;
import Entidad.Tamano;
import Utils.MysqlDBConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author edicz
 */
public class ModeloMascota {
    public int insertaMascota(Mascota obj)
    {
	int salida = -1;
		
	Connection conn= null;
	PreparedStatement pstm = null;
	try 
        {
            conn = MysqlDBConexion.getConexion();
            String sql ="insert into mascota values(null,?,?,?,?,?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getNombreMascota());
            pstm.setString(2, obj.getFoto());
            pstm.setInt(3, obj.getMeses());
            pstm.setString(4, obj.getColor());
            pstm.setInt(5, obj.getEstado());
            pstm.setInt(6, obj.getIdTamano());            
            pstm.setInt(7, obj.getIdCaracter());
            pstm.setInt(8, obj.getIdPelaje());
            pstm.setInt(9, obj.getIdSexo());
            pstm.setInt(10, obj.getIdAlbergue());
                        
            salida = pstm.executeUpdate();
			
        } catch (Exception e)
        {
            e.printStackTrace();
	}
        finally
        {
            try {
                    if(pstm!= null) pstm.close();
                    if(conn!= null) conn.close();
                } catch (Exception e2) 
                {}
        }
        return salida;
    }
    public List<Mascota> listarMascota(int idAlbergue)
    {   Mascota alu=null;
        List<Mascota> data=new ArrayList<Mascota>();
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   cn=MysqlDBConexion.getConexion();
            String sql="select * from mascota where idAlbergue=?";
            pstm=cn.prepareStatement(sql);
            pstm.setInt(1, idAlbergue);
            rs=pstm.executeQuery();
            while(rs.next())
            {   alu=new Mascota();
                alu.setIdMascota(rs.getInt("idMascota"));
                alu.setNombreMascota(rs.getString("Nombre"));
                alu.setFoto(rs.getString("Foto"));
                alu.setMeses(rs.getInt("Meses"));
                alu.setColor(rs.getString("color"));
                alu.setEstado(rs.getInt("estado"));
                alu.setIdTamano(rs.getInt("idTamano"));
                alu.setIdCaracter(rs.getInt("idCaracter"));
                alu.setIdPelaje(rs.getInt("idPelaje"));
                alu.setIdSexo(rs.getInt("idSexo"));        
                alu.setIdAlbergue(rs.getInt("idAlbergue"));
                data.add(alu);
            }
        } catch (Exception e) 
            {   e.printStackTrace();
            }
        finally
        {  try 
            {   if(rs!=null)rs.close();
                if(pstm!=null)pstm.close();
                if(cn!=null)cn.close();
            } catch (Exception e2) 
                {   e2.printStackTrace();
                }
        }
        return data;
    }
    public int eliminaMascota(int idMascota)
    {
        int salida = -1;
        Connection conn= null;
        PreparedStatement pstm = null;
        try 
        {
            conn = MysqlDBConexion.getConexion();
            String sql ="delete from mascota where idMascota=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idMascota);
            salida = pstm.executeUpdate();
			
        } catch (Exception e)
        {
            e.printStackTrace();
        } finally
        {
            try 
            {
                if(pstm!= null) pstm.close();
                if(conn!= null) conn.close();
            } catch (Exception e2) {
                }
        }
        return salida;
    }
    public Mascota buscaMascota(int idMascota)
    {
        Connection conn= null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Mascota obj = null;
        try {
            conn = MysqlDBConexion.getConexion();
            String sql ="select * from mascota where idMascota=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idMascota);
            rs = pstm.executeQuery();
            if(rs.next()){
                obj = new Mascota();
                obj.setIdMascota(rs.getInt("idMascota "));
                obj.setNombreMascota(rs.getString("Nombre"));
                obj.setFoto(rs.getString("Foto"));
                obj.setMeses(rs.getInt("Meses"));
                obj.setColor(rs.getString("color"));
                obj.setIdTamano(rs.getInt("idTamano"));
                obj.setIdCaracter(rs.getInt("idCaracter"));
                obj.setIdPelaje(rs.getInt("idPelaje"));
                obj.setIdSexo(rs.getInt("idSexo"));        
                obj.setIdAlbergue(rs.getInt("idAlbergue"));                
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            try {
                if(rs!= null) rs.close();
                if(pstm!= null) pstm.close();
                if(conn!= null) conn.close();
            } catch (Exception e2) {
            }
        }

        return obj;
    }
    public Mascota listarMascotaDetallado(int idMascota)
    {   Mascota obj = null;
        Connection conn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   conn=MysqlDBConexion.getConexion();
            String sql="select mascota.idAlbergue, mascota.idMascota, mascota.Nombre, mascota.Foto, mascota.Meses, mascota.Color, tamano.Tamano, caracter.Caracter, pelaje.Pelaje, sexo.Sexo from mascota INNER JOIN caracter INNER JOIN pelaje INNER JOIN sexo INNER JOIN tamano INNER JOIN albergue where mascota.idCaracter=caracter.idCaracter and mascota.idTamano=tamano.idTamano and mascota.idPelaje=pelaje.idPelaje and mascota.idSexo=sexo.idSexo and mascota.idAlbergue=albergue.idAlbergue and mascota.idMascota=?";
            pstm=conn.prepareStatement(sql);
            pstm.setInt(1, idMascota);
            rs=pstm.executeQuery();
            if(rs.next()){
                obj = new Mascota();
                obj.setIdAlbergue(rs.getInt("idAlbergue"));
                obj.setIdMascota(rs.getInt("idMascota"));
                obj.setNombreMascota(rs.getString("Nombre"));
                obj.setFoto(rs.getString("Foto"));
                obj.setMeses(rs.getInt("Meses"));
                obj.setColor(rs.getString("Color"));
                obj.setTamano(rs.getString("Tamano"));
                obj.setCaracter(rs.getString("Caracter"));
                obj.setPelaje(rs.getString("Pelaje"));
                obj.setSexo(rs.getString("Sexo"));                     
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            try {
                if(rs!= null) rs.close();
                if(pstm!= null) pstm.close();
                if(conn!= null) conn.close();
            } catch (Exception e2) {
            }
        }
        return obj;
    }
    public int actualizaMascota(Mascota obj)
    {
        int salida = -1;

        Connection conn= null;
        PreparedStatement pstm = null;
        try {
                conn = MysqlDBConexion.getConexion();
                String sql ="update mascota set Nombre=?, Foto=?, Meses=?, Color=?, idTamano=?, idCaracter=?, idPelaje=?, idSexo=?, idAlbergue=? where idMascota=?";     
                pstm = conn.prepareStatement(sql);
                
                pstm.setString(1, obj.getNombreMascota());
                pstm.setString(2, obj.getFoto());
                pstm.setInt(3, obj.getMeses());
                pstm.setString(4, obj.getColor());
                pstm.setInt(5, obj.getIdTamano());                
                pstm.setInt(6, obj.getIdCaracter());
                pstm.setInt(7, obj.getIdPelaje());
                pstm.setInt(8, obj.getIdSexo());
                pstm.setInt(9, obj.getIdAlbergue());
                
                salida = pstm.executeUpdate();

        } catch (Exception e) {
                e.printStackTrace();
        } finally{
                try {
                        if(pstm!= null) pstm.close();
                        if(conn!= null) conn.close();
                } catch (Exception e2) {
                }
        }
        return salida;
    }
    
    public List<Caracter> listarCaracter()
    {   Caracter alu=null;
        List<Caracter> data=new ArrayList<Caracter>();
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   cn=MysqlDBConexion.getConexion();
            String sql="select * from caracter";
            pstm=cn.prepareStatement(sql);
            rs=pstm.executeQuery();
            while(rs.next())
            {   alu=new Caracter();
                alu.setIdCaracter(rs.getInt("idCaracter"));
                alu.setCaracter(rs.getString("Caracter"));
                data.add(alu);
            }
        } catch (Exception e) 
            {   e.printStackTrace();
            }
        finally
        {  try 
            {   if(rs!=null)rs.close();
                if(pstm!=null)pstm.close();
                if(cn!=null)cn.close();
            } catch (Exception e2) 
                {   e2.printStackTrace();
                }
        }
        return data;
    }
    public List<Pelaje> listarPelaje()
    {   Pelaje alu=null;
        List<Pelaje> data=new ArrayList<Pelaje>();
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   cn=MysqlDBConexion.getConexion();
            String sql="select * from pelaje";
            pstm=cn.prepareStatement(sql);
            rs=pstm.executeQuery();
            while(rs.next())
            {   alu=new Pelaje();
                alu.setIdPelaje(rs.getInt("idPelaje"));
                alu.setPelaje(rs.getString("Pelaje"));
                data.add(alu);
            }
        } catch (Exception e) 
            {   e.printStackTrace();
            }
        finally
        {  try 
            {   if(rs!=null)rs.close();
                if(pstm!=null)pstm.close();
                if(cn!=null)cn.close();
            } catch (Exception e2) 
                {   e2.printStackTrace();
                }
        }
        return data;
    }
    public List<Sexo> listarSexo()
    {   Sexo alu=null;
        List<Sexo> data=new ArrayList<Sexo>();
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   cn=MysqlDBConexion.getConexion();
            String sql="select * from sexo";
            pstm=cn.prepareStatement(sql);
            rs=pstm.executeQuery();
            while(rs.next())
            {   alu=new Sexo();
                alu.setIdSexo(rs.getInt("idSexo"));
                alu.setSexo(rs.getString("Sexo"));
                data.add(alu);
            }
        } catch (Exception e) 
            {   e.printStackTrace();
            }
        finally
        {  try 
            {   if(rs!=null)rs.close();
                if(pstm!=null)pstm.close();
                if(cn!=null)cn.close();
            } catch (Exception e2) 
                {   e2.printStackTrace();
                }
        }
        return data;
    }
    public List<Tamano> listarTamano()
    {   Tamano alu=null;
        List<Tamano> data=new ArrayList<Tamano>();
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   cn=MysqlDBConexion.getConexion();
            String sql="select * from tamano";
            pstm=cn.prepareStatement(sql);
            rs=pstm.executeQuery();
            while(rs.next())
            {   alu=new Tamano();
                alu.setIdTamano(rs.getInt("idTamano"));
                alu.setTamano(rs.getString("Tamano"));
                data.add(alu);
            }
        } catch (Exception e) 
            {   e.printStackTrace();
            }
        finally
        {  try 
            {   if(rs!=null)rs.close();
                if(pstm!=null)pstm.close();
                if(cn!=null)cn.close();
            } catch (Exception e2) 
                {   e2.printStackTrace();
                }
        }
        return data;
    }
    
    public List<Mascota> BuscarMascotaIdeal(int idAlbergue,int idTamano,int idPelaje,int idCaracter)
    {   Mascota alu=null;
        List<Mascota> data=new ArrayList<Mascota>();
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   cn=MysqlDBConexion.getConexion();
            String sql="select * from mascota where idAlbergue=? and idTamano=? and idPelaje=? and idCaracter=?";
            pstm=cn.prepareStatement(sql);
            pstm.setInt(1, idAlbergue);
            pstm.setInt(2, idTamano);
            pstm.setInt(3, idPelaje);
            pstm.setInt(4, idCaracter);
            rs=pstm.executeQuery();
            while(rs.next())
            {   alu=new Mascota();
                alu.setIdMascota(rs.getInt("idMascota"));
                alu.setNombreMascota(rs.getString("Nombre"));
                alu.setFoto(rs.getString("Foto"));
                alu.setMeses(rs.getInt("Meses"));
                alu.setColor(rs.getString("color"));
                alu.setIdTamano(rs.getInt("idTamano"));
                alu.setIdCaracter(rs.getInt("idCaracter"));
                alu.setIdPelaje(rs.getInt("idPelaje"));
                alu.setIdSexo(rs.getInt("idSexo"));        
                alu.setIdAlbergue(rs.getInt("idAlbergue"));
                data.add(alu);
            }
        } catch (Exception e) 
            {   e.printStackTrace();
            }
        finally
        {  try 
            {   if(rs!=null)rs.close();
                if(pstm!=null)pstm.close();
                if(cn!=null)cn.close();
            } catch (Exception e2) 
                {   e2.printStackTrace();
                }
        }
        return data;
    }
    public int insertaSolicitud(Solicitud obj)
    {
	int salida = -1;
		
	Connection conn= null;
	PreparedStatement pstm = null;
	try 
        {
            conn = MysqlDBConexion.getConexion();
            String sql ="insert into solicitud values(null,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getFechaSolicitud());
            pstm.setString(2, obj.getFechaEntrega());
            pstm.setInt(3, obj.getIdMascota());
            pstm.setInt(4, obj.getIdEstado());
            pstm.setInt(5, obj.getIdUsuario()); 
                        
            salida = pstm.executeUpdate();
			
        } catch (Exception e)
        {
            e.printStackTrace();
	}
        finally
        {
            try {
                    if(pstm!= null) pstm.close();
                    if(conn!= null) conn.close();
                } catch (Exception e2) 
                {}
        }
        return salida;
    }
    public List<Solicitud> listarSolicitud(int idUsuario)
    {   Solicitud alu=null;
        List<Solicitud> data=new ArrayList<Solicitud>();
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   cn=MysqlDBConexion.getConexion();
            String sql="select solicitud.idSolicitud, solicitud.fechaSolicitud, solicitud.fechaEntrega, mascota.Foto, mascota.Nombre, estado.Estado, usuario.idUsuario from solicitud INNER JOIN mascota INNER JOIN estado INNER JOIN usuario INNER JOIN albergue where solicitud.idMascota=mascota.idMascota and solicitud.idEstado=estado.idEstado and solicitud.idUsuario=usuario.idUsuario and solicitud.idUsuario=?";
            pstm=cn.prepareStatement(sql);
            pstm.setInt(1, idUsuario);
            rs=pstm.executeQuery();
            while(rs.next())
            {   alu=new Solicitud();
                alu.setIdSolicitud(rs.getInt("idSolicitud"));
                alu.setFechaSolicitud(rs.getString("fechaSolicitud"));
                alu.setFechaEntrega(rs.getString("fechaEntrega"));
                alu.setFotoMascota(rs.getString("Foto"));
                alu.setNombreMascota(rs.getString("Nombre"));
                alu.setEstado(rs.getString("Estado"));
                alu.setIdUsuario(rs.getInt("idUsuario"));
                data.add(alu);
            }
        } catch (Exception e) 
            {   e.printStackTrace();
            }
        finally
        {  try 
            {   if(rs!=null)rs.close();
                if(pstm!=null)pstm.close();
                if(cn!=null)cn.close();
            } catch (Exception e2) 
                {   e2.printStackTrace();
                }
        }
        return data;
    }
    public List<Solicitud> listarSolicitudAlbergue(int idAlbergue)
    {   Solicitud alu=null;
        List<Solicitud> data=new ArrayList<Solicitud>();
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   cn=MysqlDBConexion.getConexion();
            String sql="select solicitud.idSolicitud, solicitud.fechaSolicitud, solicitud.fechaEntrega, mascota.Nombre, mascota.idTamano, mascota.idSexo, mascota.idPelaje, mascota.meses, estado.Estado, usuario.Nombre, usuario.Apellido, usuario.Telefono, usuario.DNI from solicitud INNER JOIN mascota INNER JOIN estado INNER JOIN usuario INNER JOIN albergue where solicitud.idMascota=mascota.idMascota and solicitud.idEstado=estado.idEstado and solicitud.idUsuario=usuario.idUsuario and mascota.idAlbergue=albergue.idAlbergue and albergue.idAlbergue=?";
            pstm=cn.prepareStatement(sql);
            pstm.setInt(1, idAlbergue);
            rs=pstm.executeQuery();
            while(rs.next())
            {   alu=new Solicitud();
                alu.setIdSolicitud(rs.getInt("idSolicitud"));
                alu.setFechaSolicitud(rs.getString("fechaSolicitud"));
                alu.setFechaEntrega(rs.getString("fechaEntrega"));
                alu.setNombreMascota(rs.getString("mascota.Nombre"));
                alu.setIdTamaño(rs.getInt("idTamano"));
                alu.setIdSexo(rs.getInt("idSexo"));
                alu.setIdPelaje(rs.getInt("idPelaje"));
                alu.setMeses(rs.getInt("meses"));
                alu.setEstado(rs.getString("Estado"));
                alu.setNombreUsuario(rs.getString("usuario.Nombre"));
                alu.setApellidoUsuario(rs.getString("usuario.Apellido"));
                alu.setTelefono(rs.getInt("Telefono"));
                alu.setDni(rs.getInt("DNI"));
                data.add(alu);
            }
        } catch (Exception e) 
            {   e.printStackTrace();
            }
        finally
        {  try 
            {   if(rs!=null)rs.close();
                if(pstm!=null)pstm.close();
                if(cn!=null)cn.close();
            } catch (Exception e2) 
                {   e2.printStackTrace();
                }
        }
        return data;
    }     
    public Solicitud buscaSolicitud(int idSolicitud)
    {   Solicitud obj = null;
        Connection conn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   conn=MysqlDBConexion.getConexion();
            String sql="select * from solicitud where solicitud.idSolicitud=?";
            pstm=conn.prepareStatement(sql);
            pstm.setInt(1, idSolicitud);
            rs=pstm.executeQuery();
            if(rs.next()){
                obj = new Solicitud();
                obj.setIdSolicitud(rs.getInt("idSolicitud"));
                obj.setFechaSolicitud(rs.getString("FechaSolicitud"));
                obj.setFechaSolicitud(rs.getString("FechaSolicitud"));
                obj.setIdMascota(rs.getInt("idMascota"));
                obj.setIdEstado(rs.getInt("idEstado"));
                obj.setIdUsuario(rs.getInt("idUsuario"));                  
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            try {
                if(rs!= null) rs.close();
                if(pstm!= null) pstm.close();
                if(conn!= null) conn.close();
            } catch (Exception e2) {
            }
        }
        return obj;
    }
    public int actualizaSolicitud(Solicitud obj)
    {
        int salida = -1;

        Connection conn= null;
        PreparedStatement pstm = null;
        try {
                conn = MysqlDBConexion.getConexion();
                String sql ="update solicitud set fechaSolicitud=?, fechaEntrega=?, idEstado=? where idSolicitud=?";     
                pstm = conn.prepareStatement(sql);
                
                pstm.setString(1, obj.getFechaSolicitud());
                pstm.setString(2, obj.getFechaEntrega());
                pstm.setInt(3, obj.getIdEstado());
                pstm.setInt(4, obj.getIdSolicitud());
                
                salida = pstm.executeUpdate();

        } catch (Exception e) {
                e.printStackTrace();
        } finally{
                try {
                        if(pstm!= null) pstm.close();
                        if(conn!= null) conn.close();
                } catch (Exception e2) {
                }
        }
        return salida;
    }
    public int modificarMascota(Mascota obj)
    {
        int salida = -1;

        Connection conn= null;
        PreparedStatement pstm = null;
        try {
                conn = MysqlDBConexion.getConexion();
                String sql ="update mascota set estado=? where idMascota=?";     
                pstm = conn.prepareStatement(sql);
                
                pstm.setInt(1, obj.getEstado());
                pstm.setInt(2, obj.getIdMascota());
                
                salida = pstm.executeUpdate();

        } catch (Exception e) {
                e.printStackTrace();
        } finally{
                try {
                        if(pstm!= null) pstm.close();
                        if(conn!= null) conn.close();
                } catch (Exception e2) {
                }
        }
        return salida;
    }
}
