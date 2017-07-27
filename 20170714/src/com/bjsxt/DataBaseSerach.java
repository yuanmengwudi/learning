package com.bjsxt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DataBaseSerach {
	public static void main(String[] args) {
      Scanner scanner = new Scanner(System.in);
      int i = scanner.nextInt();
      if(i==1){
    	  m();
      }
      if(i==2){
    	  m1();
      }
      if(i==3){
    	  m2();
      }
      if(i==4){
    	  m();
      }
	}

	public static void m() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "root";
		Connection con = null;
		String sql = "insert into stu values(seq_b.nextval,'С��',20,'��',2);";
		PreparedStatement ps = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			ps = con.prepareStatement(sql);
			ps.addBatch();
			ps.executeQuery();
			con.commit();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}

		}
	}

	public static void m1() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "root";
		Connection con = null;
		String sql = "delete from stu where stu_name='С��'";
		PreparedStatement ps = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			ps = con.prepareStatement(sql);
			ps.addBatch();
			con.commit();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void m2() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "root";
		Connection con = null;
		String sql = "update from stu set stu_name='Сx' where stu_id=3";
		PreparedStatement ps = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			ps = con.prepareStatement(sql);
			ps.addBatch();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void m3(){
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "root";
		Connection con = null;
		String sql = "select stu_name from stu where stu_id=3";
		Statement ps = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			ps = con.createStatement();
			rs=ps.executeQuery(sql);
			while(rs.next()){
				System.out.println(rs.getString("stu_name"));
			}
	       
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
