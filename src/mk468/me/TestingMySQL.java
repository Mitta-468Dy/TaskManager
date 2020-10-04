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
	
	//doGet���Ő錾���Ă����Ȃ��H
	//��doPost���ł����p����\�����l�����ĕۗ���
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
			//cj�̂Ȃ������ǂ܂��Deprecated Caution�𔭐�������̂�h��
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e3) {
			e3.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost/taskdata2?useSSL=false",
					"root",
					null			//�p�X���[�h���ݒ�Ȃ̂ł��̏��
					);
			ps = con.prepareStatement("select * from task");
			rs = ps.executeQuery();
			rsmd = rs.getMetaData();

			while(rs.next()) {
				//�e�s�ɂ��đS�Ẵt�B�[���h����f�[�^���l������
				for(int i = 1 ; i <= rsmd.getColumnCount() ; i++) {
					//null���ݒ肳���\��������u�I�����v�Ȃǂ̓L���b�`����K�v�A��
					if (rs.getObject(i) == null) {
						response.getWriter().print("���ݒ�");
						response.getWriter().print(" ");
					} else {
						if (i == rsmd.getColumnCount()) {
							//�Ō�̃t�B�[���h
							/**
							 " "��^�������s���邽�߂�if�Ŏ���
							 ���ۂɂ�<tr></tr>�őΉ�
							 �ꎞ�I��br�^�O�őΉ�(println���̉��s�̓u���E�U�ł͔��f����Ȃ�)
							 */
							response.getWriter().print(rs.getObject(i).toString());
							response.getWriter().println("<br>");
						} else {
							//�Ō�ł͂Ȃ��t�B�[���h
							response.getWriter().print(rs.getObject(i).toString());
							response.getWriter().print(" ");
						}
					}
				}
			}
		} catch(SQLException e1) {
			//SQL��O
			e1.printStackTrace();
		} catch(Exception e2) {
			//����ȊO�̗�O
			e2.printStackTrace();
		} finally {
			//���\�[�X�����
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
	//������
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
