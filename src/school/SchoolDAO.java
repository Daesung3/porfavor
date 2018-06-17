package school;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import info2.Info;

public class SchoolDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public SchoolDAO() {
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

	public ArrayList<School> getList(String userID) {
		String SQL = "select * from info,user where userID = ? AND user.userSchoolSerialNumber = info.userSchoolSerialNumber AND user.Year = info.Year";
		ArrayList<School> list = new ArrayList<School>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Info info = new Info();
				info.setUserSchoolSerialNumber(rs.getString(1));
				info.setUserSchoolNumber(rs.getString(2));
				info.setUserName(rs.getString(3));
				info.setYear(rs.getString(4));
				info.setPersonalPhoto(rs.getString(5));
				list.add(list);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
