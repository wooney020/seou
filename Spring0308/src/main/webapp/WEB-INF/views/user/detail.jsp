<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function moveToUpdateForm(user_no){
location.href = "/user/updateForm?user_no="+user_no;
}



</script>
</head>
<body>
NO: ${userDetail.user_no }<br>
ID: ${userDetail.user_id }<br>
PW: ${userDetail.user_pw }<br>
NM: ${userDetail.user_nm }<br>
INDATE: ${userDetail.user_indate }<br>

<input type = "button" value = "수정폼 이동" onclick = "moveToUpdateForm(${userDetail.user_no })">
</body>
</html>