<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 상세 내용 페이지 ]</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
function boardDelete(board_no){
   //특정 글만 삭제
   location.href="/board/delete?board_no="+board_no;
}

function boardUpdateForm(board_no){
   //수정하면 그 목록을 다시 보여주고 수정하게 되니까 조회가 발생함
   location.href="/board/updateForm?board_no="+board_no;
}

function replyList(data){// 댓글창 다시 만들어주는 코드 
	
	var context='<table border="1">';

    $.each(data.replyList,function(index,item){
       context+='<tr>';
       context+='<td>'+(index+1)+'</td><td>'+item.reply_context+'</td><td>'+item.reply_indate+'</td><td>'+item.customer_id+'</td>';
       if(data.customer_id == item.customer_id){//로그인 사람의 아이디 == 리플의 작성한 사람의 아이디
          context += '<td><input type="button" value="수정" class = "replyUpdBtn">';
          context += '<input type="button" value="삭제" class = "replyDelBtn">';
			context += '<input type = "hidden" class="replyNo" value = "'+item.reply_no+'">';
			context += '<input type = "hidden" class="boardNo" value = "'+item.board_no+'">';
			context += '</td>';                
          }
       context+='</tr>';
       context+='<div id = "replyUpdateForm"></div>'
       });

    context += '</table>';
    $("#replyDiv").html(context);
    $("#reply_context").val("");

    
    
}

$(function(){
   $("#replyBtn").on("click",function(){
         //가지고 와야하는 데이터는 2개
         //1.리플 내용
         var reply_context=$("#reply_context").val();
         //alert(reply_context); 값 제대로 가져와 지는지 알럿으로 한번 확인
         //2.게시글 번호
         var board_no=$("#board_no").val();
         //alert(board_no);

         //위에 2개의 데이터를 비동기 방식으로 서버에 전달한다.

         $.ajax({
            url : "/board/replyInsert",
            type : "post",
            data :{
               reply_context : reply_context,
               board_no : board_no
               },
            dataType : "json",
            success : function(data){//받아온 댓글 리스트       //맵으로 바꿔줌 data가 어떤 형태 인지 확인해보려면 콘솔에 찍어보고 확인
                  console.log(data);
				  replyList(data);
                  replyDelete(); // 새로운 태그에 기능 다시 연결.
				  replyUpdate();
                  },
            error : function(e){
                  console.log(e);
               }
            });
      });

   function replyDelete(){
	   
		$(".replyDelBtn").on("click",function(){
			var replyNo = $(this).nextAll(".replyNo").val();
			var boardNo = $(this).nextAll(".boardNo").val();
			

			$.ajax({
				url:"/board/replyDelete",
				type:"post",
				data:{ 
					reply_no : replyNo,
					board_no : boardNo
					},
				dataType:"json",
				success:function(data){
					console.log(data);
					replyList(data);
					replyDelete();
					replyUpdate();
					},
				error:function(e){
					console.log(e);
					}
				});
   	   	});
   	   
	   }

   
   	
  
	   function replyUpdate(){
		   
		   var replyContext = '';
		   var reply_no = 0;
		   var board_no = 0;
		   
		   $(".replyUpdBtn").on("click",function(){
			    replyNo = $(this).nextAll(".replyNo").val();
				boardNo = $(this).nextAll(".boardNo").val();
				
			
			replyContext += '<tr>';
			replyContext += '<td> <textarea rows="3" cols="50" id ="replyUpdContent"></textarea></td>';
			replyContext += '<td><input type = "button" id = "replyUpdBtn2" value = "수정"></td>';
			replyContext += '</tr>';
			

		   $("#replyUpdateForm").html(replyContext); 
	

		   $("#replyUpdBtn2").on("click",function(){

		    	var replyUpdContent = $(this).parent().prev().find("#replyUpdContent").val();
		    	console.log(replyUpdContent);

		    	$.ajax({
					url: "/board/replyUpdate",
					type: "post",
					dataType: "json",
					data:{
						reply_no : replyNo,
						board_no : boardNo,
						reply_context : replyUpdContent
						},
					success:function(data){
						console.log(data);
					   
						  replyList(data);
		                  replyDelete(); // 새로운 태그에 기능 다시 연결.
						  replyUpdate();
						
						},
					error:function(e){
						console.log(e);
						}
						
					});
		    	
		  
				
			    });
				

		   });
		   	
				   
	   
		 
				
/*
				
 */

		 
	  }
   
	replyDelete(); //기능을 사용하려면 호출을 해줘야함.
	replyUpdate();
	

   
});
</script>
</head>
<body>

   <!--태그로 둘러싸여있지 않아서 선택하기 곤란 -> 히든 만들자-->
   글 번호 : ${detail.BOARD_NO}<br>
   글 제목 : ${detail.BOARD_TITLE}<br>
   작성자 :  ${detail.CUSTOMER_NM}<br>
   글 내용 : <textarea rows="10" cols="10"> ${detail.BOARD_CONTENT}</textarea><br>
   조회수 :  ${detail.BOARD_HITS}<br>
   작성일 :  ${detail.BOARD_INDATE}<br>
   첨부 파일 : <a href="/board/download?board_no=${detail.BOARD_NO}"> ${detail.BOARD_ORIGINAL}</a> <br><!--첨부파일 보여주기, 원래 파일명으로 보여줘야함-->
   <!--다운로드를 누르면 이 글의 fk도 같이감 이 글의 첨부파일을 다운로드 해야하니깐-->
   
   
   <!--el표현식을 쓸때 안에 연산자를 써줘야함, 나머지 부분은 test의 영역이기 때문에 el나눠서 연산하는건 불가능-->
   <c:if test="${sessionScope.loginVO.customer_id==detail.CUSTOMER_ID}"><!--이 글을 작성한 사람이 로그인 되어 있으면 보여주기-->
   <input type="button" value="수정" onclick="boardUpdateForm(${detail.BOARD_NO})">
   <input type="button" value="삭제" onclick="boardDelete(${detail.BOARD_NO})">
   </c:if>
   <!--삭제: 버튼이 없어도 로그인 안한 사람이 삭제 요청 주소를 알고 있으면 삭제가 가능함, 그러니까 sql에다 삭제 요청을 받을때 로그인 한 사람이 맞는지 확인해야함-->
   <br><br>
   
   
   <!--댓글-->
   <div>
      댓글 : <textarea rows="3" cols="50" id="reply_context"></textarea> <input type="button" id="replyBtn" value="댓글 저장">
      <input type="hidden" id="board_no" value="${detail.BOARD_NO}">
   </div>
   
   <div id="replyDiv"><!--글 상세조회를 누르면 게시글이 같이 나오게 끔-->
      <table border="1">
         <c:forEach var="reply" items="${map.replyList}" varStatus="status"><!-- varStatus:반복하면서 생기는 속성들 저장 대표적으로 카운트,인덱스 -->
            
            <tr>
               <td>${status.count}</td><!--변수이름.index : 지금 반복하고 있는 인덱스값을 반환(0~), 변수이름.count : 반복횟수 반환(1~)-->
               <td>${reply.reply_context}</td><!--댓글 내용-->
               <td>${reply.reply_indate}</td>
               <td>${reply.customer_id}</td>
               
               <c:if test="${sessionScope.loginVO.customer_id==reply.customer_id}"><!--본인이 단 리플에만 처리가 됨-->
                  <td>
                     <input type="button" value="수정" class = "replyUpdBtn">
                     <input type="button" value="삭제" class = "replyDelBtn">
                     <input type = "hidden" class="replyNo" value = "${reply.reply_no }">
					<input type = "hidden" class="boardNo" value = "${reply.board_no }">
					             
                  </td>
               </c:if>
            </tr>
               
         </c:forEach>
         <div id = "replyUpdateForm"></div>   
        
         
      </table>
      
   </div>
  
</body>
</html>