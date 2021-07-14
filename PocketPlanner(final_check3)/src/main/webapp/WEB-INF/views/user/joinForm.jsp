<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

var id_check = 0;

function joinCheck(){
	
	//데이터 가져오기
	var user_id = document.getElementById("user_id").value;
	var user_pw = document.getElementById("user_pw").value;
	var user_nm = document.getElementById("user_nm").value;
	var pw_check = document.getElementById("pw_check").value;
	var agree_check = $("#agree").is(":checked");


	//이름검사
	if(user_nm == "" || user_nm.length == "0"){
		alert("이름을 입력해주세요.");
		return false;
	}else if( user_nm.length<2 ||  user_nm.length>4){
		alert("이름은 2~5글자 사이로 입력해주세요.");
		return false;
	}
	
	//ID검사
	if(user_id == "" || user_id.length == "0"){
		alert("아이디를 입력해주세요.");
		return false;
	}else if(user_id.length<3 || user_id.length>10){
		alert("아이디는 3~10글자 사이로 입력해주세요.");
		return false;
	}

	 if(id_check == 0){
         alert('아이디 중복체크를 해주세요');
         return false;
     }
	
	//PW검사
	if(user_pw == "" || user_pw.length == "0"){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else if(user_pw.length<3 || user_pw.length>10){
		alert("비밀번호는 3~10글자 사이로 입력해주세요.");
		return false;
	}

	//pwCheck
	
	if(pw_check == "" || pw_check.length == "0"){
		alert("동일한 비밀번호를 입력해주세요.");
		return false;
	}else if( pw_check != user_pw ){
		alert("동일한 비밀번호를 입력해주세요.");
		return false;
	}

	if(!agree_check){
		alert("회원가입 동의를 체크해주세요.");
		return false;
		}

     
      

		
	return true;
	
}

function id_ck(){
	  
      
      //userid 를 param.
      var user_id =  $("#user_id").val(); 
      //alert(user_id);
      
      $.ajax({
          async: true,
          type : 'POST',
          data : {user_id : user_id},
          url : "/user/idCheck",
          dataType : "json",
          success : function(data) {
              console.log(data);
              if (data > 0) {
            	  alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				  $("#user_id").focus();
              
              } else {
            	  alert("사용가능한 아이디입니다.");
                  $("#user_pw").focus();
                  id_check = 1;
                  
              }
          },
          error : function(error) {
              console.log(error)
          }
      });
	  
  }
    

</script>

<head>
    <title>POCKET PLANNER - Sign Up </title>
    
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    <!-- Favicon icon -->
    <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font--><link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
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
    
    
    <!-- 배경  -->
    <section >
        <!-- Container-fluid starts -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                
                	<!-- 회원가입 폼   -->
                    <!-- Authentication card start -->
                    <div class="signup-card card-block auth-body mr-auto ml-auto">
                        <form class="md-float-material" action="/user/join" method = "post"  onsubmit = "return joinCheck();" >
                            <div class="text-center">
                                <img src="/resources/assets/images/auth/logo-dark1.png" alt="logo.png">
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-center txt-primary">Sign up. It is fast and easy.</h3>
                                    </div>
                                </div>
                                <hr/>
                                
                                <!-- 입력 창  -->
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Choose Username" id = "user_nm" name = "user_nm">
                                    <span class="md-line"></span>
                                </div>
                                

                                <div class="input-group">
                                    <input type="text" class="form-control user_id_input" placeholder="Choose ID" id = "user_id" 
                                    name = "user_id"  check_result = "fail">
                                    <input type = "button" id = "id_check" value= "Check" class="btn btn-primary text-center"
                                    onclick = "id_ck()">
                                    <img id="id_check_sucess" style="display: none;">
                                    <span class="md-line"></span>
                                </div>
                                
                                
                                <div class="input-group">
                                    <input type="password" class="form-control" placeholder="Choose Password" id = "user_pw" name = "user_pw">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="password" class="form-control" placeholder="Confirm Password" id = "pw_check">
                                    <span class="md-line"></span>
                                </div>
                                
                                
                                <div class="row m-t-25 text-left">
                                    <div class="col-md-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input type="checkbox" value="" id = "agree">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">I agree</span>
                                            </label>
                                        </div>
                                    </div>
                                    
                                    
                                </div>
                                
                                
                                <!--  로그인 API 들어갈 곳 -->
								                                
								<!-- 네이버아이디로로그인 버튼 노출 영역 -->
								 <div id="naver_id_login" align = "right"></div>
								 
								<!-- //네이버아이디로로그인 버튼 노출 영역 -->
								 <script type="text/javascript">
								  	var naver_id_login = new naver_id_login("WmC4JRYvaYkX4kMflUt2", "http://localhost:8882/user/collbackJoin");
								  	var state = naver_id_login.getUniqState();
								  	naver_id_login.setButton("white", 4,40);
								  	//naver_id_login.setDomain("http://localhost:8882/user/loginForm");
								  	naver_id_login.setState(state);
								  	//naver_id_login.setPopup();
								  	naver_id_login.init_naver_id_login();
								 </script>
                                
                                
                                <div class="row m-t-30">
                                	<div>
  
	  
                                	</div>
                                	
                                	<!-- 회원가입 버튼  -->
                                    <div class="col-md-12">
                                        <input type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20" value = "Sign up now.">
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
	

   
	<!-- [endif] -->
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
