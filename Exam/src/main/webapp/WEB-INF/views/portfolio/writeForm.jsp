<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 포트폴리오 작성 ]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

function writeCheck(){

	//데이터 가져오기
	
	var portfolio_title = document.getElementById("portfolio_title").value;
	var portfolio_type = document.getElementById("portfolio_type").value;
	
	var portfolio_st = document.getElementById("portfolio_st").value;
	var portfolio_et = document.getElementById("portfolio_et").value;
	var portfolio_content = document.getElementById("portfolio_content").value;
	var portfolio_gb = document.getElementsByName("portfolio_gb");

//공개여부 체크값
	var gbCheck = "0";
	for(var i=0; i<portfolio_gb.length;i++){
		if(portfolio_gb[i].checked == true){
			portfolio_gb = portfolio_gb[i].value;	
			gbCheck++;
		}
	}
	
	

	//제목입력검사
	if(portfolio_title == "" || portfolio_title.length == "0"){
		alert("제목을 입력해주세요");
		return false;
	}
	
	//종류 선택검사
	if(portfolio_type == "0"){
		alert("종류를 선택해주세요");
		return false;
	}

	//시작일 입력 검사
	
	if(portfolio_st == "" || portfolio_st == "0"){
		alert("시작일을 입력해주세요");
		return false;
	}

	//종료일 입력 검사
	
	if(portfolio_et == "" || portfolio_et == "0"){
		alert("종료일을 입력해주세요");
		return false;
	}

	//내용 입력 검사
	
	if(portfolio_content == "" || portfolio_content == "0"){
		alert("내용을 입력해주세요");
		return false;
	}
		
	return true;
}

$(function(){
	$("#portfolioList").on("click", function(){

		location.href = "/portfolio/portfolioList";
		
		});

	
});
	


</script>
<body>


<form action="/portfolio/write" method = "post" onsubmit="return writeCheck();">
	<table>
		<tr>
			<td>제목</td>
			<td>
			<input type ="text" name = "portfolio_title" id = "portfolio_title">
			</td>
		</tr>
		<tr>
			<td>종류</td>
			<td>
			<select id = "portfolio_type" name = "portfolio_type">
					<option selected = "selected" value = "0">--선택하세요--</option>
					<option value = "1">학력정보</option>
					<option value = "2">경력정보</option>
					<option value = "3">프로젝트</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>시작일</td>
			<td>
			<input type ="text" name = "portfolio_st" id = "portfolio_st">
			</td>
		</tr>
		<tr>
			<td>종료일</td>
			<td>
			<input type ="text" name = "portfolio_et" id = "portfolio_et">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea rows="25" cols="40" name = "portfolio_content" id = "portfolio_content"></textarea>
			</td>
		</tr>
		<tr>
			<td>공개</td>
			<td>
				안한다<input type = "radio" name = "portfolio_gb" value = "0" checked = "checked" >
				한다<input type = "radio" name = "portfolio_gb" value = "1"  >
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type = "submit" value = "작성">
			<input type = "button" value = "리스트로" id = "portfolioList">	
			</td>
		</tr>
	</table>
	
</form>

</body>
</html>