<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 </title>
<link rel="stylesheet" href="/resources/css/style.css">
<script type="text/javascript">


	function formCheck(){

		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		var pwCheck = document.getElementById("pwCheck").value;
		var name = document.getElementById("name").value;
		var age = document.getElementById("age").value;
		var hobby = document.getElementsByName("hobby"); //자료형이 배열.
		var introduce = document.getElementByID("introduce").value;

		if(id == "" || id.length == 0){
			alert("아이디를 입력해 주세요");
			return false;
		}else if(id.length<3 || id.length>8){
			alert("아이디는 3~8글자 사이로 입력해 주세요");
			return false;}

		if(pw == "" || pw.length == 0){
			alert("비밀번호를 입력해 주세요");
			return false;
		}else if(pw.length<3 || pw.length>8){
			alert("비밀번호는 3~8글자 사이로 입력해주세요.");
			return false;}

		if(pwCheck == "" || pwCheck.length == 0){
			alert("비밀번호 확인을 입력해주세요");
			return false;
		}else if(pw != pwCheck){
			alert("동일한 비밀번호를 입력해주세요");
			return false;}

		if(name == "" || name.length == 0){
			alert("이름을 입력해주세요");
			return false;}

		if(age == "" || age.length == 0){
			alert("나이를 입력해주세요");
			return false;
		}else if(isNaN(age)){
			alret("나이는 숫자로만 입력해주세요")
			return false;}


		var count = 0; //체크 된 것을 세주는 변수
		for(var i=0; i<hobby.length;i++){

			if(hobby[i].checked){
				count++;
			}

		}
		
		if(count < 2){
			alert("스트레스 해소법은 두 개 이상 체크해주세요");
			return false;
		}

		if(introduce == "" || introduce.length == 0){
			alert("자기소개를 입력해주세요");
			return false;
			}
		
		return true;
		}
</script>
</head>
<body>
	<h1>[회원 가입 폼]</h1>

	<form action="/member/join" method = "post" onsubmit = "return formCheck();">
		<table>
			<thead>
				<tr>
					<th colspan="2">
						<label class="header">
							<span>SW DO</span>회원 가입
						</label>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<label>아이디</label>
					</td>
					<td>
						<input type="text" id = "id" name = "id">
					</td>
				</tr>
				<tr>
					<td>
						<label>비밀번호</label>
					</td>
					<td>
						<input type="password" id = "pw" name ="pw">
					</td>
				</tr>
				<tr>
					<td>
						<label>비밀번호 확인</label>
					</td>
					<td>
						<input type="password" id = "pwCheck" name = "pwCheck">
					</td>
				</tr>
				<tr>
					<td>
						<label>이름</label>
					</td>
					<td>
						<input type="text" id = "name" name = "name">
					</td>
				</tr>
				<tr>
					<td>
						<label>나이</label>
					</td>
					<td>
						<input type="number" id = "age" name = "age">
					</td>
				</tr>
				<tr>
					<td>
						<label>성별</label>
					</td>
					<td>
						<label>남성</label><input type="radio" name="gender" value="male" checked="checked">
						<label>여성</label><input type="radio" name="gender" value="female">
					</td>
				</tr>
				<tr>
					<td>
						<label>스트레스<br>해소법(2개이상)</label>
					</td>
					<td>
						<div>
							<label>영화감상</label><input type="checkbox" name="hobby" value="movie">
							<label>게임</label><input type="checkbox" name="hobby" value="game">
							<label>TV시청</label><input type="checkbox" name="hobby" value="tv">
							<label>코인노래방</label><input type="checkbox" name="hobby" value="music">
						</div>
						<div>
							<label>맛집투어</label><input type="checkbox" name="hobby" value="food">
							<label>스포츠</label><input type="checkbox" name="hobby" value="sport">
							<label>잠자기</label><input type="checkbox" name="hobby" value="sleep">
							<label>코딩</label><input type="checkbox" name="hobby" value="coding">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label>자기소개</label>
					</td>
					<td>
						<textarea id = "introduce" name = "introduce"></textarea> 
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="submit" value="가입">
						<input type="reset" value="취소">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>

</body>
</html>