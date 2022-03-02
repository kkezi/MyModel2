<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type =" text/javascript" src ="/MyModel/myJs/myAjax.js"></script>
</head>
<script>
function win_upload1() {
	const myop = "width=500, height = 150, left=150,top=150";
	open('<%=request.getContextPath()%>/mySingle/myPictureForm.jsp',"",myop);
} // end win_upload1

function myidChk() {
	const myid = document.myf.myid.value
	let myresult = document.querySelector("#myresult")
	const myparam = "myid=" + myid
	//console.log(myparam) //확인차원
	if(myid.length < 8) {
		myresult.style.color ="red"
		myresult.innerHTML = "id는 8자리이상 입력해주세요"
	} else {
		myAjax("<%=request.getContextPath()%>/mySingle/readmyId.jsp", myparam, callback,'get')
	}
} //end myidChk

	function callback(){
	if(this.readyState == 4 && this.status ==200) {
		let myresult = document.querySelector("#myresult")
		let mychk = this.responseText.trim()
//확인차원		alert(mychk)
		if(mychk =='false') {
			myresult.style.color ='blue'
			myresult.innerHTML = '사용가능한 id입니다'
			document.myf.mychk.value ="ok"		
		} else {
			myresult.style.color = 'red'
			myresult.innerHTML ="사용중인 id입니다"
			document.myf.mychk.value ="no"
		}
		
	}
} //end callback

 function inputmyChk(){
	alert('ok')
	if(document.myf.mychk.value !='ok') {
		alert("id가 확인되지 않습니다")
		document.myf.myid.focus()
		return false
	}
	return true
} //end myinputChk

</script>
<body>
<hr>
<div class = 'mymargin'>
	<form action = "<%=request.getContextPath() %>/myMember/myMemberPro" method ="post" 
	name ="myf" onsubmit = "return inputmyChk()">
	<input type = "hidden" name = "mypicture">
	<table>
		<caption>회원가입</caption>
		<tr> 
		<td rowspan = '4'><img src="" width="200" height = "150" id ="mypic">
		<button type = "button" id="input_img" onclick = "win_upload1()">사진추가</button>
		</td>
	
		<!--  
			<td rowspan = '4'>
			<img id="user_image" src="dog.jpg" alt="기본 프로필 이미지" style="width:200px; height:150px;">
 			<br>
 			<label class="input_image_text" for="input_img">사진추가</label>
 			<input type="file" id="input_img" accept=".jpg" onchange="PreviewImage()" style="display:none;"/>
			</td>
			-->
			
			
			
			<td class= 'header'>아이디</td>
			<td><input type ='text' id ='user' name="myid" size ='20' autocomplete ="off" onkeyup="myidChk()">
			<input type ="hidden" name = "mychk">
			<div id = myresult></div></td>
		</tr>
		
		
		
		
		<tr>
			<td class= 'header'>비밀번호</td>
			<td><input type = 'password' id ='user' name="mypasswd" size ='20'></td>
		</tr>
		<tr>
			<td class= 'header'>이름</td>
			<td><input type = 'text' id = 'user' name="myname" size ='10'></td>
		</tr>
		<tr>
			<td class= 'header'>성별</td>
			<td>
			<label><input type ='radio' name= 'mygender' value='1' checked>남</label>
			<label><input type ='radio' name = 'mygender' value ='2'>여</label>
			</td>
		</tr>
		<tr>
			<td class= 'header'>전화번호</td>
			<td colspan ='2'><input type = 'tel' id = 'user' name = "mytel" size = '11'></td>
		</tr>
		<tr>
		<td class= 'header'>이메일</td>
		<td colspan ='2'><input type='email' id= 'user' name = "myemail" size = '60'></td>
		</tr>
		<tr>
		<td colspan = '3'><button type = 'submit'>회원가입</button></td>
		</tr>
	</table>
	</form>
</div>

		
</body>
</html>