<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[프로필 확인]</title>
</head>
<body>

	<hl>[프로필]</hl>
	<table border = "1">
		<tr>
			<td><img alt = "프로필사진" src = "/resources/images/profile${profile.profile_image }.png">
			<td>자기소개<br>
				${profile.profile_pr }
			</td>
		</tr>
			
	
	</table>

</body>
</html>