package trieu.dev.data.drive;
import static trieu.dev.util.Constants.*;

import java.sql.Connection;
import java.sql.DriverManager;
public class MySQLDriver {
	private static MySQLDriver instance;
	private MySQLDriver() {
		
	}
	
	public static MySQLDriver getInstance() {
		if(instance == null) instance = new MySQLDriver();
		return instance;
	}
	
	public Connection getConnection() {
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}

}
