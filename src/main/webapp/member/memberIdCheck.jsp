<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script type="text/javascript">
function mem_userId(){
	 Swal.fire({
		   title: '사용가능한 아이디입니다.',
		   icon: 'success'
		 });
	
	// 확인된 아이디를 회원가입창으로 전달
	opener.document.fr.mem_id.value = document.ckfr.mem_userId.value;

	// 해당창 종료
	window.close();		
}
</script>

</head>

<body>

	<div class="formbold-main-wrapper">
  	<!-- Author: FormBold Team -->
  	<!-- Learn More: https://formbold.com -->
  		<div class="formbold-form-wrapper">
  		
    		<form action="./MemberIdCheckAction.me" method="POST" name="ckfr" >
      			<div class="formbold-email-subscription-form">
        			<input type="text" name="mem_userId" id="mem_userId" value="${param.inputID }" class="formbold-form-input"/>
       				<button class="submit"> 중복확인 </button>
       			</div>
    		</form>
    		
  		</div>
	</div>


	<c:if test="${requestScope.result != null}">
		<c:if test="${result == 0 }">
			<div class=textstyle>
				사용 가능한 아이디 입니다.
				<input type="button" id="btn" value="사용하기" onclick="mem_userId()">
			</div>
		</c:if>

		<c:if test="${requestScope.result == 1 }">
			<div class=textstyle>
				이미 사용중인 아이디 입니다.
			</div>
		</c:if>
	</c:if>


<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'InfinitySans-RegularA1';
	font-weight: normal;
    font-style: normal;
}

.formbold-main-wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 48px;
}

.formbold-form-wrapper {
	margin: 0 auto;
	max-width: 550px;
	width: 100%;
	background: white;
}

.formbold-form-input {
	width: 80%;
	padding: 13px 22px;
	border-radius: 5px;
	border: 1px solid #dde3ec;
	background: #ffffff;
	font-weight: 500;
	font-size: 12px;
	color: #536387;
	outline: none;
	resize: none;
}

.formbold-form-input:focus {
	border-color: #6a64f1;
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.submit {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	font-size: 14px;
	border-radius: 5px;
	padding: 5px 5px;
	border: none;
	font-weight: 500;
	background-color: #1089FF;
	color: white;
	cursor: pointer;
}

.submit:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-email-subscription-form {
	display: flex;
	gap: 15px;
}

.textstyle {
	color: #b1b3b6;
	font-size: 14px;
	line-height: 2px;
	display: block;
	text-align: center;
}


.swal2-title {
    position: relative;
    max-width: 100%;
    margin: 0;
    padding: 0.8em 1em 0;
    color: inherit;
    font-size: 20PX;
    font-weight: 600;
    text-align: center;
    text-transform: none;
    word-wrap: break-word;
}

.swal2-styled.swal2-confirm {
    border: 0;
    border-radius: 0.25em;
    background: initial;
    background-color: #1089FF;
    color: #fff;
    font-size: 1em;
}

.btn {
	vdisplay: inline-flex;
    align-items: center;
    gap: 8px;
    font-size: 14px;
    border-radius: 5px;
    padding: 5px 5px;
    border: none;
    font-weight: 500;
    background-color: #1089FF;
    color: white;
    cursor: pointer;
}
  
</style>

</body>
</html>