package info2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import profile.Profile;

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
	
	public ArrayList<Info> getList(String userID){
		String SQL = "select * from info,user where userID = ? AND user.userSchoolSerialNumber = info.userSchoolSerialNumber AND user.Year = info.Year";
		ArrayList<Info> list = new ArrayList<Info>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Info info = new Info();
				info.setUserSchoolSerialNumber(rs.getString(1));
				info.setUserSchoolNumber(rs.getString(2));
				info.setUserName(rs.getString(3));
				info.setYear(rs.getString(4));
				info.setPersonalPhoto(rs.getString(5));
				list.add(info);
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return list; 
	}
}
