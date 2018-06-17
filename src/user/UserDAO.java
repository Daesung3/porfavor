package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;
import info2.Info;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
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

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword From USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 틀림
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터 베이스 오류
	}

	public int signIn(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(6, user.getUserPhone());
			pstmt.setString(5, user.getUserSchoolSerialNumber());
			pstmt.setString(7, user.getUserSchoolNumber());
			pstmt.setString(8, user.getYear());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터 베이스 오류
	}
	
	public ArrayList<User> getList(String userID){
		String SQL = "SELECT * from user WHERE userID = ?'";
		ArrayList<User> list = new ArrayList<User>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserEmail(rs.getString(4));
				user.setUserSchoolSerialNumber(rs.getString(5));
				user.setUserPhone(rs.getString(6));
				user.setUserSchoolNumber(rs.getString(7));
				user.setYear(rs.getString(8));
				list.add(user);
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return list; 
	}
	
	public User getUser(String userID) {
		String SQL= "SELECT * FROM USER WHERE userID = ?" ; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserEmail(rs.getString(4));
				user.setUserSchoolSerialNumber(rs.getString(5));
				user.setUserPhone(rs.getString(6));
				user.setUserSchoolNumber(rs.getString(7));
				user.setYear(rs.getString(8));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;  
	}
}
