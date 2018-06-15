package profile;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;

public class ProfileDAO {


	private Connection conn;
	private ResultSet rs;

	public ProfileDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return ""; 
	}
	
	public int getNext() {
		String SQL = "SELECT profileID from profile ORDER BY profileID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return -1; 
	}
	
	public int write(String userID, String job, String userPhone, String sns, String contents) {
		String SQL = "INSERT INTO profile VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, getDate());
			pstmt.setString(4, job);
			pstmt.setString(5, userPhone);
			pstmt.setString(6, sns);
			pstmt.setString(7, contents);
			pstmt.setInt(8, 1);
			return pstmt.executeUpdate();
		}catch (Exception e){
			e.printStackTrace();
		}
		return -1; 
	}
	
	public ArrayList<Profile> getList(int pageNumber){
		String SQL = "SELECT * FROM profile WHERE profileID < ? AND profileAvailable = 1 ORDER BY profileID DESC LIMIT 10";
		ArrayList<Profile> list = new ArrayList<Profile>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Profile profile = new Profile();
				profile.setProfileID(rs.getInt(1));
				profile.setUserID(rs.getString(2));
				profile.setDay(rs.getString(3));
				profile.setJob(rs.getString(4));
				profile.setUserPhone(rs.getString(5));
				profile.setSns(rs.getString(6));
				profile.setContents(rs.getString(7));
				profile.setProfileAvailable(rs.getInt(8));
				list.add(profile);
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * from profile WHERE profileID < ? AND profileAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return false; 
	}
}
