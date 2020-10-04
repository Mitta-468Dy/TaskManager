package mk468.me;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class TestingMySQL
 */
@WebServlet("/TestingMySQL")
public class TestingMySQL extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//doGet内で宣言しても問題なし？
	//↑doPost内でも利用する可能性を考慮して保留中
	static Connection con = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	static ResultSetMetaData rsmd = null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestingMySQL() {
        super();
        System.out.println("Data Start");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("Shift_JIS");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			//cjのない方が読まれてDeprecated Cautionを発生させるのを防ぐ
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e3) {
			e3.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost/taskdata2?useSSL=false",
					"root",
					null			//パスワード未設定なのでこの状態
					);
			ps = con.prepareStatement("select * from task");
			rs = ps.executeQuery();
			rsmd = rs.getMetaData();

			while(rs.next()) {
				//各行について全てのフィールドからデータを獲得する
				for(int i = 1 ; i <= rsmd.getColumnCount() ; i++) {
					//nullが設定される可能性もある「終了日」などはキャッチする必要アリ
					if (rs.getObject(i) == null) {
						response.getWriter().print("未設定");
						response.getWriter().print(" ");
					} else {
						if (i == rsmd.getColumnCount()) {
							//最後のフィールド
							/**
							 " "を与えず改行するためにifで実装
							 実際には<tr></tr>で対応
							 一時的にbrタグで対応(println等の改行はブラウザでは反映されない)
							 */
							response.getWriter().print(rs.getObject(i).toString());
							response.getWriter().println("<br>");
						} else {
							//最後ではないフィールド
							response.getWriter().print(rs.getObject(i).toString());
							response.getWriter().print(" ");
						}
					}
				}
			}
		} catch(SQLException e1) {
			//SQL例外
			e1.printStackTrace();
		} catch(Exception e2) {
			//それ以外の例外
			e2.printStackTrace();
		} finally {
			//リソースを閉じる
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//未実装
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
