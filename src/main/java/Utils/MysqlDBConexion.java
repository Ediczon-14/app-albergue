package Utils;
import java.sql.Connection;
import java.sql.DriverManager;

public class MysqlDBConexion 
{
    public static Connection getConexion()
    {
        Connection cn = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://sql10.freesqldatabase.com/sql10529740","sql10529740","9C9FKGZcBU");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return cn;
    }
}