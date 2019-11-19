<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>  
			
<%
	request.setCharacterEncoding("euc-kr");
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionString = "jdbc:sqlserver://222.222.1.1:1433;"+
	"databaseName=MDMS_backup;user=sa;password=kmi5659";

	int idx = Integer.parseInt(request.getParameter("idx"));
	String passwrd = request.getParameter("passwrd");
	
	try{
				
		Connection conn = DriverManager.getConnection(connectionString);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT PASSWRD FROM board_test WHERE idx=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				passwrd = rs.getString(1);
		 }
		 
		 if(passwrd.equals(passwrd)) {
			   			
			sql = "DELETE FROM board_test WHERE idx=" + idx;	
			stmt.executeUpdate(sql);	 
%>
  			<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="list.jsp";
  			</script>

<%
		rs.close();
		stmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>