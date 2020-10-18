package rentcar.ds;

import java.sql.Connection;
import java.sql.DriverManager;

public class JdbcUtil {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:orcl?useSSL=false";
			String user = "RENTCAR";
			String password = "rootroot";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return conn;
	}

}
