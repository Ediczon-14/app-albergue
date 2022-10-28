/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Entidad.Usuario;
import Utils.MysqlDBConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author edicz
 */
public class ModeloUsuario {
    public Usuario iniciarSesionUsuario(String log,String pas)
    {
        Usuario obj=null;
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {
            String sql="select * from usuario where Correo=? and Password=?";
            cn=MysqlDBConexion.getConexion();
            pstm=cn.prepareStatement(sql);
            pstm.setString(1, log);
            pstm.setString(2, pas);
            rs=pstm.executeQuery();
            if(rs.next())
            {
                obj=new Usuario();
                obj.setIdUsuario(rs.getInt(1));
                obj.setPasswordUsuario(rs.getString(2));
                obj.setNombreUsuario(rs.getString(3));
                obj.setApellidoUsuario(rs.getString(4));
                obj.setEdad(rs.getInt(5));
                obj.setDireccionUsuario(rs.getString(6));
                obj.setTelefonoUsuario(rs.getInt(7));
                obj.setDni(rs.getInt(8));
                obj.setCorreoUsuario(rs.getString(9));
            }
        } catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
            try 
            {
                if(rs!=null)rs.close();
                if(pstm!=null)pstm.close();
                if(cn!=null)cn.close();
            } 
            catch (Exception e2) 
            {
                e2.printStackTrace();
            }
        }
        return obj;
    }
    public int insertaUsuario(Usuario obj)
    {
	int salida = -1;
		
	Connection conn= null;
	PreparedStatement pstm = null;
	try 
        {
            conn = MysqlDBConexion.getConexion();
            String sql ="insert into usuario values(null,?,?,?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getPasswordUsuario());
            pstm.setString(2, obj.getNombreUsuario());
            pstm.setString(3, obj.getApellidoUsuario());
            pstm.setInt(4, obj.getEdad());
            pstm.setString(5, obj.getDireccionUsuario());
            pstm.setInt(6, obj.getTelefonoUsuario());
            pstm.setInt(7, obj.getDni());
            pstm.setString(8, obj.getCorreoUsuario());
                        
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
    public Usuario buscaUsuario(int idUsuario)
    {
        Connection conn= null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Usuario obj = null;
        try {
            conn = MysqlDBConexion.getConexion();
            String sql ="select * from usuario where idUsuario=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idUsuario);
            rs = pstm.executeQuery();
            if(rs.next()){
                obj = new Usuario();
                obj.setIdUsuario(rs.getInt("idUsuario"));
                obj.setNombreUsuario(rs.getString("Nombre"));
                obj.setApellidoUsuario(rs.getString("Apellido"));
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
}
