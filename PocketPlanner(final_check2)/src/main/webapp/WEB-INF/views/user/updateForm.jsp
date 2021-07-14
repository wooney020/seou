<%@page import="com.swdo.test.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<title>POCKET PLANNER - Profile Update</title>

<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords"
	content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">

<!-- Favicon icon -->
<link rel="icon" href="/resources/assets/images/favicon.ico"
	type="image/x-icon">
<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600"
	rel="stylesheet">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/bootstrap/css/bootstrap.min.css">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/icon/themify-icons/themify-icons.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/icon/icofont/css/icofont.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/jquery.mCustomScrollbar.css">

<!--  alert css  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">


//총 학습시간 Reset
function timer_total_reset(){
	
	
	swal({
		  title : 'Check!',
		  text : '정말 Reset 하시겠습니까?',
		  //dangerMode: true,
		  //content: "show",
		  button: {
			  	text: "확인",
			    closeModal: false,
			    className: "btn btn-danger" }
				  	 
		  //customClass: 'swal-wide'
		})
		 .then(total_check => {
		  if (total_check == true){
			 
			 location.href = "/timer/timerReset?total_flag=true"
			  }
		})
		
		.catch(err => {
		  if (err) {
		    swal("ERROR", "다시 시도해주세요.", "error");
		  } else {
		    swal.stopLoading();
		    swal.close();
		  } 
		});

}
	
//오늘 학습시간 리셋
function timer_today_reset() {

	swal({
		  title : 'Check!',
		  text : '정말 Reset 하시겠습니까?',
		  //dangerMode: true,
		  //content: "show",
		  button: {
			  	text: "확인",
			    closeModal: false,
			    className: "btn btn-danger" }
				  	 
		  //customClass: 'swal-wide'
		})
		 .then(today_check => {
		  if (today_check == true){
			 
			 location.href = "/timer/timerReset?today_flag=true"
			  }
		})
		
		.catch(err => {
		  if (err) {
		    swal("ERROR", "다시 시도해주세요.", "error");
		  } else {
		    swal.stopLoading();
		    swal.close();
		  } 
		});
	

	}

	
	function updateCheck() {

		//데이터 가져오기
		var user_id = document.getElementById("user_id").value;
		var user_pw = document.getElementById("user_pw").value;
		var user_nm = document.getElementById("user_nm").value;
		var pw_check = document.getElementById("pw_check").value;
		var user_goal = document.getElementById("user_goal").value;
		

	
		//PW검사
			if(user_pw == "" || user_pw.length == "0"){
				alert("비밀번호를 입력해주세요.")
				return false;
			}else if ( user_pw.length<3 || user_pw.length>10) {
				alert("비밀번호는 3~10글자 사이로 입력해주세요.");
				return false;
			}
			
			

		//pwCheck
			
			if (pw_check == "" || pw_check.length == "0") {
				alert("동일한 비밀번호를 입력해주세요.");
				return false;
			} else if (pw_check != user_pw) {
				alert("동일한 비밀번호를 입력해주세요.");
				return false;
			}

		//이름검사
		
		if (user_nm != "" || user_nm.length != "0") {
			
			if (user_nm.length<2 ||  user_nm.length>4) {
				alert("이름은 2~5글자 사이로 입력해주세요.");
				return false;
			}
		}

		
	 

 		swal({
		 title : 'Check!',
		 text : '정말로 수정하시겠습니까?'
		 , buttons : {
			 	 cancel: {
			         visible: true,
			         text : '아니오',
			         className: 'btn btn-danger'
			     },
			     confirm: {
			         text : '예',
			         className : 'btn btn-primary'
			     }
		    }
		}).then((result) => {
			if (result) {
				$("#updateForm").submit();
			}
		}); 
		


	}


</script>
<style type="text/css">
.swal-wide {
	width: 100px;
}
</style>
</head>

<body>
	<!-- Pre-loader start -->
	<div class="theme-loader">
		<div class="ball-scale">
			<div class='contain'>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">

					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Pre-loader end -->


	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<nav class="navbar header-navbar pcoded-header">
				<div class="navbar-wrapper">

					<div class="navbar-logo">
						<a class="mobile-menu" id="mobile-collapse" href="#!"> <i
							class="ti-menu"></i>
						</a> <a class="mobile-search morphsearch-search" href="#"> <i
							class="ti-search"></i>
						</a>
						<!-- <a href="/"> -->
						<a href="/"> <!-- 로고 이미지 --> <img
							src="/resources/assets/images/logo1.png" alt="Theme-Logo" />
						</a> <a class="mobile-options"> <i class="ti-more"></i>
						</a>
					</div>

					<div class="navbar-container container-fluid">
						<ul class="nav-left">
							<li>
								<div class="sidebar_toggle">
									<a href="javascript:void(0)"><i class="ti-menu"></i></a>
								</div>
							</li>

							<li><a href="#!" onclick="javascript:toggleFullScreen()">
									<i class="ti-fullscreen"></i>
							</a></li>
						</ul>

						<!-- 상단 프로필  -->
						<ul class="nav-right">

							<li class="user-profile header-notification"><a href="#!">
									<!-- 프로필 이미지 (고정) --> <img
									src="/resources/assets/images/userProfile.png"
									class="img-radius" alt="User-Profile-Image"> <!-- 로그인 여부에 따라 화면 변동 -->
									<!-- 유저 이름  --> <c:choose>
										<c:when test="${empty sessionScope.loginVO}">
											<span>로그인을 해주세요!</span>
										</c:when>
										<c:otherwise>
											<span>${sessionScope.loginVO.user_nm }</span>
										</c:otherwise>
									</c:choose> <i class="ti-angle-down"></i>
							</a> <!-- 프로필에 마우스를 올리면 생성되는 메뉴 --> <c:choose>
									<c:when test="${empty sessionScope.loginVO}">
										<!-- 로그인 안 했을 경우  -->
										<ul class="show-notification profile-notification">

											<li><a href="/user/loginForm"> <i
													class="ti-layout-sidebar-left"></i> Sign in
											</a></li>
											<li><a href="/user/joinForm"> <i
													class="ti-layout-sidebar-left"></i> Sign Up
											</a></li>
										</ul>
									</c:when>

									<c:otherwise>
										<!-- 로그인 했을 경우 -->
										<ul class="show-notification profile-notification">
											<li><a href="/user/updateForm"> <i class="ti-user"></i>
													Profile
											</a></li>
											<li><a href="/user/logout"> <i
													class="ti-layout-sidebar-left"></i> Logout
											</a></li>
										</ul>
									</c:otherwise>
								</c:choose></li>
						</ul>
					</div>
				</div>
			</nav>

			<!-- 오른 쪽 메뉴 칸 -->
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<nav class="pcoded-navbar">
						<div class="sidebar_toggle">
							<a href="#"><i class="icon-close icons"></i></a>
						</div>
						<div class="pcoded-inner-navbar main-menu">


							<div class="pcoded-navigatio-lavel"
								data-i18n="nav.category.navigation">MENU</div>
							<ul class="pcoded-item pcoded-left-item">
								<li class="active"><a href="/"> <span
										class="pcoded-micon"><i class="ti-home"></i><b>D</b></span> <span
										class="pcoded-mtext" data-i18n="nav.dash.main">HOME</span> <span
										class="pcoded-mcaret"></span>
								</a></li>


								<li><a href="/calendar/main"> <span
										class="pcoded-micon"> <i class="ti-layout-grid2-alt"></i>
											<b>FC</b></span> <span class="pcoded-mtext"
										data-i18n="nav.form-components.main">캘린더</span> <span
										class="pcoded-mcaret"></span>
								</a></li>
								<li><a href="/timer/main"> <span class="pcoded-micon"><i
											class="ti-timer"></i><b>FC</b></span> <span class="pcoded-mtext"
										data-i18n="nav.form-components.main">학습타이머</span> <span
										class="pcoded-mcaret"></span>
								</a></li>



							</ul>
					</nav>
					<div class="pcoded-content">
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">

									<div class="page-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="card">
													<div class="card-header">
														<h4>Profile</h4>
														<!-- <span>lorem ipsum dolor sit amet, consectetur
															adipisicing elit</span>  -->
														<span>Update your profile</span>
														<!-- 카드 오른쪽 상단 메뉴 -->
														<div class="card-header-right">
															<ul class="list-unstyled card-option"
																style="width: 35px;">
																<li class=""><i class="icofont icofont-simple-left"></i></li>
																<li><i class="icofont icofont-maximize full-card"></i></li>
																<!-- <li><i class="icofont icofont-minus minimize-card"></i></li> -->
																<li><i class="icofont icofont-refresh reload-card"></i></li>
																<!-- <li><i class="icofont icofont-error close-card"></i></li> -->
															</ul>
														</div>
													</div>
													<div class="card-block">
														<form action="/user/update" method="post" id="updateForm">
															<!-- onsubmit="return updateCheck();" -->
															<table class="table table-bordered">
																<tr>
																	<td><label for="user_id">ID</label></td>
																	<td><input class="form-control" type="text"
																		id="user_id"
																		placeholder="${sessionScope.loginVO.user_id }"
																		readonly> <input type="hidden"
																		value="${sessionScope.loginVO.user_id }"
																		name="user_id"></td>

																</tr>
																<tr>
																	<td><label for="user_pw">PASSWORD</label></td>
																	<td><input class="form-control" type="password"
																		placeholder="3~10글자 사이로 입력해주세요" id="user_pw"
																		name="user_pw"
																		value="${sessionScope.loginVO.user_pw }"></td>
																</tr>
																<tr>
																	<td><label for="pw_check">PASSWORD CHECK</label></td>
																	<td><input class="form-control" type="password"
																		placeholder="비밀번호와 동일하게 입력해주세요" id="pw_check"
																		value="${sessionScope.loginVO.user_pw }"></td>
																</tr>
																<tr>
																	<td><label for="user_nm">NAME</label></td>
																	<td><input class="form-control" type="text"
																		placeholder="${sessionScope.loginVO.user_nm }"
																		id="user_nm" name="user_nm"
																		value="${sessionScope.loginVO.user_nm }"></td>
																</tr>
																<tr>
																	<td><label for="timer_total">총 학습시간</label></td>
																	<td><input class="form-control" type="text"
																		placeholder="${sessionScope.TimeVO.total_hh}시간 ${sessionScope.TimeVO.total_mm}분 ${sessionScope.TimeVO.total_ss}초"
																		readonly></td>
																</tr>
																<tr>
																	<td><label for="timer_today">오늘 학습시간</label></td>
																	<td><input class="form-control" type="text"
																		placeholder="${sessionScope.TimeVO.today_hh}시간 ${sessionScope.TimeVO.today_mm}분 ${sessionScope.TimeVO.today_ss}초"
																		readonly></td>
																</tr>
																<tr>
																	<td><label for="user_goal">학습 목표</label></td>
																	<td><input class="form-control" type="text"
																		id="user_goal" name="user_goal"
																		value="${sessionScope.loginVO.user_goal }"></td>
																</tr>

															</table>
															<div style="text-align: center;">
																<button type="button" onclick = "updateCheck()" class="btn btn-primary"
																	>수정하기</button>
																<div class="dropdown-danger dropdown open">
																	<button
																		class="btn btn-danger dropdown-toggle waves-effect waves-light "
																		type="button" data-toggle="dropdown"
																		aria-haspopup="true" aria-expanded="true">Reset</button>
																	<div class="dropdown-menu" aria-labelledby="dropdown-6"
																		data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
																		<a class="dropdown-item waves-light waves-effect"
																			onclick="timer_total_reset()">총 학습시간 Reset</a> <a
																			class="dropdown-item waves-light waves-effect"
																			onclick="timer_today_reset()">오늘 학습시간 Reset</a>
																	</div>
																</div>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div id="styleSelector"></div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- Required Jquery -->
	<script type="text/javascript"
		src="/resources/assets/js/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="/resources/assets/js/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="/resources/assets/js/popper.js/popper.min.js"></script>
	<script type="text/javascript"
		src="/resources/assets/js/bootstrap/js/bootstrap.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript"
		src="/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
	<!-- modernizr js -->
	<script type="text/javascript"
		src="/resources/assets/js/modernizr/modernizr.js"></script>
	<!-- am chart -->
	<script src="/resources/assets/pages/widget/amchart/amcharts.min.js"></script>
	<script src="/resources/assets/pages/widget/amchart/serial.min.js"></script>
	<!-- Todo js -->
	<script type="text/javascript "
		src="/resources/assets/pages/todo/todo.js "></script>
	<!-- Custom js -->
	<script type="text/javascript"
		src="/resources/assets/pages/dashboard/custom-dashboard.js"></script>
	<script type="text/javascript" src="/resources/assets/js/script.js"></script>
	<script type="text/javascript "
		src="/resources/assets/js/SmoothScroll.js"></script>
	<script src="/resources/assets/js/pcoded.min.js"></script>
	<script src="/resources/assets/js/demo-12.js"></script>
	<script
		src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script>
		/* var $window = $(window);
		var nav = $('.fixed-button');
		$window.scroll(function() {
			if ($window.scrollTop() >= 200) {
				nav.addClass('active');
			} else {
				nav.removeClass('active');
			}
		}); */
	</script>
</body>

</html>
