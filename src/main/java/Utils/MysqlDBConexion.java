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
            cn = DriverManager.getConnection("jdbc:mysql://bxjwrnc6fhhp4b0zreow-mysql.services.clever-cloud.com/bxjwrnc6fhhp4b0zreow","uixjygeln4zrip4n","tEWwL6CNBUlp2JWvFlXY");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return cn;
    }
}