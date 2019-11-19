<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
 <%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionString = "jdbc:sqlserver://222.222.1.1:1433;"+
			"databaseName=MDMS_backup;user=sa;password=kmi5659";
	int total = 0;
	int indent = 0;

	try {
		Connection conn = DriverManager.getConnection(connectionString);
		Statement stmt = conn.createStatement();
		Statement stmt1 = conn.createStatement();
		String sql = "";

		String sqlCount = "SELECT COUNT(*) FROM board_test";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");

		String sqlList = "SELECT indent,  idx, cod_insert, TITLE, dat_insert, view_count from board_test order by ref DESC ,step asc";
		rs = stmt.executeQuery(sqlList);
		
%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   <td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
  </tr>
<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rs.next()) {
			indent = rs.getInt(1);
			int idx = rs.getInt(2);
			String cod_insert = rs.getString(3);
			String title = rs.getString(4);
			String dat_insert = rs.getString(5);
			int view_count = rs.getInt(6);
			
			Date date = new Date(); 
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
			String year = (String)simpleDate.format(date); 
			String yea = dat_insert.substring(0,10);
	
%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=idx %></td>
	<td align="left">
	<% 
		
	for(int j=0;j<indent;j++){
%>		&nbsp;&nbsp;&nbsp;<%
	}
	if(indent!=0){
%>		<img src='img/reply.gif' />
<%
	}

%>
	<a href="view.jsp?idx=<%=idx%>"><%=title %></a>
<%
	if(year.equals(yea)){
%>
			<img src='img/new.jpg' />
<%
		}  
%>
	<td align="center"><%=cod_insert %></td>
	<td align="center"><%=dat_insert %></td>
	<td align="center"><%=view_count %></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="글쓰기" OnClick="window.location='Write.jsp'"></td>
  </tr>
</table>
</body> 
</html>
