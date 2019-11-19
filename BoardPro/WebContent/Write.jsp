<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<script language = "javascript"> // 자바 스크립트 시작
function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.cod_insert.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.cod_insert.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.passwrd.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.passwrd.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글쓰기</title>
</head>
<body>
<table>
<form name=writeform method=post action="write_ok.jsp">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td>글쓰기</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr height="2" bgcolor="#82B5Dd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>    
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="title" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    
     <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input name="cod_insert" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     
     <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input name="passwrd" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>    
     <tr height="2" bgcolor="#82B5Dd"><td colspan="4"></td></tr>
     
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2">
       <input type=button value="등록" OnClick="javascript:writeCheck();">
       <input type=button value="취소" onclick="window.location='list.jsp'">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</body> 
