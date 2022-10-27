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
            cn = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-06.cleardb.net/heroku_2a13a133c536770","ba1cf108737a7e","28cb0529");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return cn;
    }
}