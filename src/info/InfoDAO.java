package info;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import info.Info;

public class InfoDAO {
	
		private Connection conn;
		private ResultSet rs;
		
		public InfoDAO() {
			try {
				String dbURL = "jdbc:mysql://localhost:3306/AAA";
				String dbID = "root";
				String dbPassword = "root12345";
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public Info getPhoto() {
			String SQL= "SELECT personalPhoto from info where userSchoolSerialNumber='J100005416' and Year='2014' and userSchoolNumber like '301%'"; 
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Info info = new Info();
					info.setUserSchoolSerialNumber(rs.getString(1));
					info.setUserSchoolNumber(rs.getString(2));
					info.setUserName(rs.getString(3));
					info.setYear(rs.getString(4));
					info.setPersonalPhoto(rs.getString(5));
					return info;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
}
