package testJ.com;

import java.sql.*;

public class Test {
	
	static Connection con = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static ResultSetMetaData rsmd = null;

	public Test() {
		System.out.println("Data Start");
	}
	
	public static void main(String[] args) {

		try {
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost/taskdata2?useSSL=false",
					"root",
					"ignitex"
					);
			ps = con.prepareStatement("select * from type");
			rs = ps.executeQuery();
			rsmd = rs.getMetaData();

			while(rs.next()) {
				for(int i = 0 ; i < rsmd.getColumnCount() ; i++) {
					System.out.println(rs.getObject(i));
				}
			}
		} catch(SQLException e1) {
			e1.printStackTrace();
		} catch(Exception e2) {
			e2.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		System.out.println("data end");
	}

}
