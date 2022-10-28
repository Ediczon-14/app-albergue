/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Entidad.Albergue;
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
public class ModeloAlbergue {
    public Albergue iniciarSesionAlbergue(String log,String pas)
    {
        Albergue obj=null;
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {
            String sql="select * from albergue where Correo=? and Password=?";
            cn=MysqlDBConexion.getConexion();
            pstm=cn.prepareStatement(sql);
            pstm.setString(1, log);
            pstm.setString(2, pas);
            rs=pstm.executeQuery();
            if(rs.next())
            {
                obj=new Albergue();
                obj.setIdAlbergue(rs.getInt(1));
                obj.setPasswordAlbergue(rs.getString(2));
                obj.setNombreAlbergue(rs.getString(3));
                obj.setTelefono(rs.getInt(4));
                obj.setCorreoAlbergue(rs.getString(5));
                obj.setDireccionAlbergue(rs.getString(6));
                obj.setLongitud(rs.getString(7));
                obj.setLatitud(rs.getString(8));
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
    public int insertaAlbergue(Albergue obj)
    {
	int salida = -1;
		
	Connection conn= null;
	PreparedStatement pstm = null;
	try 
        {
            conn = MysqlDBConexion.getConexion();
            String sql ="insert into albergue values(null,?,?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getPasswordAlbergue());
            pstm.setString(2, obj.getNombreAlbergue());			
            pstm.setInt(3, obj.getTelefono());
            pstm.setString(4, obj.getCorreoAlbergue());
            pstm.setString(5, obj.getDireccionAlbergue());
            pstm.setString(6, obj.getLongitud());
            pstm.setString(7, obj.getLatitud());
                        
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
    public Albergue buscaAlbergue(int idAlbergue)
    {
        Connection conn= null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Albergue obj = null;
        try {
            conn = MysqlDBConexion.getConexion();
            String sql ="select * from albergue where idAlbergue=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idAlbergue);
            rs = pstm.executeQuery();
            if(rs.next()){
                obj = new Albergue();
                obj.setIdAlbergue(rs.getInt("idAlbergue"));
                obj.setNombreAlbergue(rs.getString("Nombre"));
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
    public List<Albergue> listarAlbergue()
    {   Albergue alu=null;
        List<Albergue> data=new ArrayList<Albergue>();
        Connection cn=null;
        ResultSet rs=null;
        PreparedStatement pstm=null;
        try 
        {   cn=MysqlDBConexion.getConexion();
            String sql="select * from albergue";
            pstm=cn.prepareStatement(sql);
            rs=pstm.executeQuery();
            while(rs.next())
            {   alu=new Albergue();
                alu.setIdAlbergue(rs.getInt("idAlbergue"));
                alu.setPasswordAlbergue(rs.getString("Password"));
                alu.setNombreAlbergue(rs.getString("Nombre"));
                alu.setTelefono(rs.getInt("Telefono"));
                alu.setCorreoAlbergue(rs.getString("Correo"));
                alu.setDireccionAlbergue(rs.getString("Direccion"));
                alu.setLongitud(rs.getString("Longitud"));
                alu.setLatitud(rs.getString("Latitud"));
                                
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
}
