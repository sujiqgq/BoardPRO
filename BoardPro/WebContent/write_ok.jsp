<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.

	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionString = "jdbc:sqlserver://222.222.1.1:1433;"+
			"databaseName=MDMS_backup;user=sa;password=kmi5659";

	String cod_insert = request.getParameter("cod_insert"); //write.jsp에서 name에 입력한 데이터값
	String passwrd = request.getParameter("passwrd");//write.jsp에서 password에 입력한 데이터값
	String title = request.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
	String memo = request.getParameter("memo"); //write.jsp에서 memo에 입력한 데이터값
	int total = 0;
	Connection conn = DriverManager.getConnection(connectionString);
 	Statement stmt = conn.createStatement();
	//인덱스 값 입력 부분
			String sqlCount = "SELECT MAX(IDX) FROM Board_test";
			ResultSet rs = stmt.executeQuery(sqlCount);
			if(rs.next()){
				total = rs.getInt(1)  ;
			}
			rs.close();
	 
			
	try {	
		String sql = "INSERT INTO board_test(idx,cod_insert,PASSWRD,TITLE,MEMO,DAT_INSERT,REF) VALUES(?,?,?,?,?,getdate(),?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		Integer idx = total ;	

		pstmt.setInt(1, idx+1);
		pstmt.setString(2, cod_insert);
		pstmt.setString(3, passwrd);
		pstmt.setString(4, title);
		pstmt.setString(5, memo);
		pstmt.setInt(6, idx+1);	
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	} 
	
%>
//완료 후, 리스트로 돌아가는 코드 추가 
	<script language=javascript>
		location.href="list.jsp";
	</script>
</body>
</html>