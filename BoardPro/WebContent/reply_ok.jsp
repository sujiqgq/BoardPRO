<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionString = "jdbc:sqlserver://222.222.1.1:1433;"+
	"databaseName=MDMS_backup;user=sa;password=kmi5659";

	String cod_insert = request.getParameter("cod_insert");
	String passwrd = request.getParameter("passwrd");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int idx = Integer.parseInt(request.getParameter("idx"));
	int total = 0;
	
	try {
		int ref = 0;
		int indent = 0;
		int step = 0;

		Connection conn = DriverManager.getConnection(connectionString);
		Statement stmt = conn.createStatement();
		
		String sqlCount = "SELECT COUNT(*) FROM board_test";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		
		
		String sql = "SELECT REF, INDENT, STEP FROM board_test WHERE idx=" + idx;
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			ref = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
		}
		
		sql = "UPDATE board_test SET STEP=STEP+1 where REF="+ref+" and STEP>" +step;
		stmt.executeUpdate(sql);
		
		sql = "INSERT INTO board_test(cod_insert, PASSWRD, TITLE, MEMO, REF, INDENT, STEP, idx, DAT_INSERT) values(?,?,?,?,?,?,?,?,getDate())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cod_insert);
		pstmt.setString(2, passwrd);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, ref);
		pstmt.setInt(6, indent+1);
		pstmt.setInt(7, step+1);
		pstmt.setInt(8, total+1);
		
		pstmt.execute(); 
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();
		
	}catch(Exception e) {
		
	}
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp";
  </script>
