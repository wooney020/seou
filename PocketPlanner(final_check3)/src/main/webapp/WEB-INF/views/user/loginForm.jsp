<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

function loginCheck(){
	
	//데이터 가져오기
	var user_id = document.getElementById("user_id").value;
	var user_pw = document.getElementById("user_pw").value;



	//ID검사
	if(user_id == "" || user_id.length == "0"){
		alert("아이디를 입력해주세요.");
		return false;
	}
	
	//PW검사
	if(user_pw == "" || user_pw.length == "0"){
		alert("비밀번호를 입력해주세요.");
		return false;
	}


		
	return true;


	
}




</script>
<head>
    <title>POCKET PLANNER - Sign in </title>
    
   
      
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    <!-- Favicon icon -->
    <link rel="icon" href="/resources/assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
</head>

<body class="fix-menu">
    <!-- Pre-loader start -->
    <div class="theme-loader">
    <div class="ball-scale">
        <div class='contain'>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
        </div>
    </div>
</div>
    <!-- Pre-loader end -->

    <section>
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                
                	<!-- 로그인 폼  -->
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body mr-auto ml-auto">
                    
                        <form  action="/user/login" method = "post" class="md-float-material" onsubmit = "return loginCheck();">
                            <div class="text-center">
                                <img src="/resources/assets/images/auth/logo-dark1.png" alt="logo.png">
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-left txt-primary">Sign In</h3>
                                    </div>
                                </div>
                                
                                
                                <hr/>
                                <div class="input-group">
                                    <input type="text" id = "user_id" name= "user_id" class="form-control" placeholder="ID">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="password" id = "user_pw" name= "user_pw" class="form-control" placeholder="Password">
                                    <span class="md-line"></span>
                                </div>
                                
                                <c:choose>
                                	<c:when test="${empty sessionScope.loginCheck }">
                                	</c:when>
                                	<c:otherwise>
                                	<p class = "text-danger"> ID 혹은 비밀번호가 틀렸습니다</p>
                                	</c:otherwise>
                                </c:choose>
                                
                                <!--  로그인 API 들어갈 곳 -->
								                                
								<!-- 네이버아이디로로그인 버튼 노출 영역 -->
								 <div id="naver_id_login" align="right"></div>
								 
								<!-- //네이버아이디로로그인 버튼 노출 영역 -->
								 <script type="text/javascript">
								  	var naver_id_login = new naver_id_login("WmC4JRYvaYkX4kMflUt2", "http://localhost:8882/user/collback");
								  	var state = naver_id_login.getUniqState();
								  	naver_id_login.setButton("white", 2,40);
								  	naver_id_login.setDomain("http://localhost:8882/user/loginForm");
								  	naver_id_login.setState(state);
								  	//naver_id_login.setPopup();
								  	naver_id_login.init_naver_id_login();
								 </script>
                                
                                
                                                           
                             
                                <!-- Sign 버튼 -->
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <input type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20" value = "Sign in">
                                    </div>
                                </div>
                                
                                
                                
                                <div class="row m-t-30">
                                	<div class="col-md-12">
                                	                                  	
                                	</div>
                                </div>
                                
                                
                                
                                <hr/>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left m-b-0">Thank you and enjoy our website.</p>
                                        <p class="text-inverse text-left"><b>Your Authentication Team</b></p>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="/resources/assets/images/auth/Logo-small-bottom1.png" alt="small-logo.png">
                                    </div>
                                </div>

                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
   
    <!-- Warning Section Ends -->
    <!-- Required Jquery -->
    <script type="text/javascript" src="/resources/assets/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/resources/assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="/resources/assets/js/bootstrap/js/bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="/resources/assets/js/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="/resources/assets/js/modernizr/css-scrollbars.js"></script>
    <script type="text/javascript" src="/resources/assets/js/common-pages.js"></script>
</body>

</html>
