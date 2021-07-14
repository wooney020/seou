<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>

<head>
<title>POCKET PLANNER - TIMER</title>

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

<!-- 타이머기능 -->
<script type="text/javascript"
	src="/resources/assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript">
	var time = 3000;
	var min = "";
	var sec = "";
	var saveTime = 0;
	var x;

	

	$(function() {

		//타이머 종료
		$("#timerStop").on("click", function() {
			clearInterval(x);
			if (saveTime > 0) {
				//비동기 통신으로 문자열의 값과 숫자의 값을 서버로 전송한다.
				$.ajax({
					url : "/timer/save", //요청주소
					type : "get", //전송방식
					data : {
						saveTime : saveTime
					},
					success : function(data) {
						console.log(data);

					},
					error : function(e) {
						console.log(e);
					}
				});
				saveTime = 0;
			}
		});

		//타이머 50분 설정

		$("#timer50").on("click", function() {
			clearInterval(x);
			if (saveTime > 0) {
				//비동기 통신으로 문자열의 값과 숫자의 값을 서버로 전송한다.
				$.ajax({
					url : "/timer/save", //요청주소
					type : "get", //전송방식
					data : {
						saveTime : saveTime
					},
					success : function(data) {
						//console.log(data);

					},
					error : function(e) {
						console.log(e);
					}
				});
				saveTime = 0;
			}

			document.getElementById("demo").innerHTML = "50분00초";
			time = 3000;
		});

		//타이머 25분 설정

		$("#timer25").on("click", function() {
			clearInterval(x);
			if (saveTime > 0) {
				//비동기 통신으로 문자열의 값과 숫자의 값을 서버로 전송한다.
				$.ajax({
					url : "/timer/save", //요청주소
					type : "get", //전송방식
					data : {
						saveTime : saveTime
					},
					success : function(data) {
						console.log(data);

					},
					error : function(e) {
						console.log(e);
					}
				});
				saveTime = 0;
			}

			document.getElementById("demo").innerHTML = "25분00초";
			time = 1500;
		});

	});

	

	//타이머 시작
	function timerStart() {

		x = setInterval(function() {

			min = parseInt(time / 60);
			sec = time % 60;

			document.getElementById("demo").innerHTML = min + "분" + sec + "초";
			time--;
			saveTime++;

			if (time < 0) {
				clearInterval(x);
				document.getElementById("demo").innerHTML = "00분00초";
				time = 3000;
			}

		}, 1000);
	}
</script>
<style type="text/css">
.btn {
	font-size: 20px;
	padding: 10px 40px;
	width: 250px;
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
						</a> <a href="/"> <!-- 로고 이미지 --> <img
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
										class="pcoded-micon"><i class="ti-layout-grid2-alt"></i><b>FC</b></span>
										<span class="pcoded-mtext"
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


					<!--  타이머   -->
					<div class="pcoded-content">
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">

									<div class="page-body">
										<!-- <div class="row">  -->
										<div style="text-align: center;">
											<h1>
												<div id="demo"
													style="font-size: 200px; font-weight: bolder;">00분00초</div>
											</h1>
											<div>
												<button class="btn btn-danger btn-round"
													onclick="timer50();" id="timer50">50분 타이머</button>
												<button class="btn btn-primary btn-round"
													onclick="timer25();" id="timer25">25분 타이머</button>
											</div>
											<br>
											<div>
												<button class="btn btn-primary btn-round"
													onclick="timerStart();">학습 시작</button>
												<button class="btn btn-danger btn-round"
													onclick="timerStop();" id="timerStop">학습 종료</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Required Jquery -->

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
/* 		var $window = $(window);
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
