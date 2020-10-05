package rentcar .ds;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtil {
    public static Connection getConnection() {
        Connection conn = null;
        try {
        	String url = "jdbc:oracle:thin:@localhost:1521:orcl?useSSL=false";
			String user = "RENTCAR";
			String password = "rootroot";
			conn = DriverManager.getConnection(url, user, password);
        }catch (Exception e) {
        	System.out.println(e.getMessage());
        	e.printStackTrace();
        }
        return conn;
    }

}
