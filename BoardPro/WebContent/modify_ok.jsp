<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionString = "jdbc:sqlserver://222.222.1.1:1433;"+
	"databaseName=MDMS_backup;user=sa;password=kmi5659";
	
		try{
			
			request.setCharacterEncoding("euc-kr");
			int idx = Integer.parseInt(request.getParameter("idx"));
			String title = request.getParameter("title");
			String memo = request.getParameter("memo");
			String passwrd = request.getParameter("passwrd");
		
			Connection conn = DriverManager.getConnection(connectionString);
			Statement stmt = conn.createStatement();
		
			String sql = "SELECT PASSWRD FROM board_test WHERE idx=" + idx;
			ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				passwrd = rs.getString(1);
		 }
		
		 if(passwrd.equals(passwrd)) {
				sql = "UPDATE board_test SET TITLE='" + title+ "' ,MEMO='"+ memo +"' WHERE idx=" + idx;				
				stmt.executeUpdate(sql);
				
%>
				  <script language=javascript>
				  	self.window.alert("글이 수정되었습니다.");
				  	location.href="view.jsp?idx=<%=idx%>";
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