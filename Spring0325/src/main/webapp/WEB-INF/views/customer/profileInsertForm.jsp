<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[프로필 등록]</title>
</head>
<body>
<h1>[프로필 등록]</h1>

	<form action="/customer/profileInsert" method = "post">
		<table>
			<tr>
				<td>이미지선택</td>
				<td>
					<img alt = "프로필1" src = "/resources/images/profile1.png">
					<input type = "radio" name ="profile_image" value ="1">
					
					<img alt = "프로필2" src = "/resources/images/profile2.png">
					<input type = "radio" name ="profile_image" value ="2">
					
					<img alt = "프로필3" src = "/resources/images/profile3.png">
					<input type = "radio" name ="profile_image" value ="3">
					
					<img alt = "프로필4" src = "/resources/images/profile4.png">
	 				<input type = "radio" name ="profile_image" value ="4">
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>자기소개</td>
	 			<td>
	 				<textarea rows ="10" cols = "20" name = "profile_pr"></textarea>
	 			</td>
	 		</tr>
	 		     <tr>
            <td colspan="2">
               <input type="submit" value="등록">
            </td>
         </tr>
      
      </table>
	
	</form>
</body>
</html>