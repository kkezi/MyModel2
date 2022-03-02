<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>KIMEUNJI</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- nav바 아이콘  -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<style>


body {
  font-family: "Malgun Gothic";
  line-height: 1.8;
  
  
 
 
}


.w3-bar .w3-button {
  padding: 10px;
  
}

.mymargin {
margin : 5% 9% 0 9% ; /*위 오른 아래 왼 = 시계방향*/
}


 table {
  margin: 0 auto; /*위아래 양쪽*/
  text-align:center;
  border: 1px solid #dddddd;
  border-collapse: collapse;
  width: 100%;
  height: 70%;
  background-color:#EFF0F1; 
}

td, th {
 border: 1px solid #dddddd;
  padding: 15px;
 }


th {
	background-color:#E5E7E4 ;
	/*letter-spacing 자간*/
	letter-spacing:-1px;	
}


/* title은 공지사항 테이블 안의 게시글 제목  */
.title {
	width: 50%;
	text-align: left;
	padding: 15px;
}

/* items은 공지사항의 게시글 갯수*/
.items{
	text-align: right;
	padding: 5px;
}

/* header는 회원가입 테이블의 항목제목 */
.header{
	letter-spacing:-1px;
	background-color: #E5E7E4
}

hr {
	height: 10px;
	border:0;
	/*box-shadow: 좌우값 상하값 blur정도 그림자크기<option> 색;*/
	box-shadow:  0 10px 10px -10px #bbb inset;
}

caption {
	font-size:x-large;
	font-weight: bold;
}

/* 입력창 테두리,너비 */
#user, #user_id, #user_pw{
 	width:95%;
 	border:1px solid #dddddd ;
 	border-radius:5px;
}
#pass {
width :90%;
border:1px solid #dddddd ;
 	border-radius:5px;
}

/* 회원가입 사진추가*/
.input_image_text{
  	color: black;
  	cursor: pointer; /*커서스타일 손가락모양으로 바꾸기*/
}

/* 입력시 입력창 테두리 색상 변경 focus:입력대기상태*/

input:focus {
	outline:1px solid black;
	}
	


</style>





<script>

//첨부한 이미지 보기
function PreviewImage() {
    // 파일리더 생성 
    let preview = new FileReader();
    preview.onload = function (e) {
    // img id 값 
    document.getElementById("user_image").src = e.target.result;
	};
	// input id 값 
	preview.readAsDataURL(document.getElementById("input_img").files[0]);
};
 

</script>


<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href="<%=request.getContextPath() %>/myMain" class="w3-bar-item w3-button w3-wide">KIC캠퍼스</a>
    
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
  	<%
		String mymemid = (String)session.getAttribute("mymemberId");
		if(mymemid == null) {
			%>
    	<a href="<%=request.getContextPath() %>/myMember/myMemberInput" class="w3-bar-item w3-button">회원가입</a>
        <a href="<%=request.getContextPath() %>/myMember/myLoginForm" class="w3-bar-item w3-button"><i class="fas fa-sign-in-alt"></i>로그인</a>
        
    	
  <% } else { %>
      
      <a href="<%=request.getContextPath() %>/myMember/myMemberUpdate" class="w3-bar-item w3-button"><%=mymemid %>님 회원정보수정</a>
       <a href="<%=request.getContextPath() %>/myMember/myLogout" class="w3-bar-item w3-button"><i class="fas fa-sign-in-alt"></i>로그아웃</a>
       <a href="<%=request.getContextPath() %>/myMember/myDeleteForm" class="w3-bar-item w3-button"><i class="fas fa-sign-in-alt"></i>회원탈퇴</a>
        
      
      
    <%   }%>
      
      
      
      
      
  
      
      
      
      <a href="<%=request.getContextPath() %>/myBoard/myList?myboardid=1" class="w3-bar-item w3-button"><i class="fas fa-bullhorn"></i>공지사항</a>
      <a href="<%=request.getContextPath() %>/myBoard/myList?myboardid=2" class="w3-bar-item w3-button"><i class="fas fa-comments"></i>자유게시판</a>
      <a href="<%=request.getContextPath() %>/myBoard/myList?myboardid=3" class="w3-bar-item w3-button"><i class="fas fa-envelope"></i> Q n A</a>
      <a href="#personal" class="w3-bar-item w3-button"><i class="fas fa-user"></i>마이페이지</a>
      
    </div>  
  </div>
</div>


 
</body>
</html>