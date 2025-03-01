<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>타이소</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/x-icon" href="./images/logo.png">
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="./css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="./css/animate.css">
	
	<link rel="stylesheet" href="./css/owl.carousel.min.css">
	<link rel="stylesheet" href="./css/owl.theme.default.min.css">
	<link rel="stylesheet" href="./css/magnific-popup.css">
	
	<link rel="stylesheet" href="./css/aos.css">
	
	<link rel="stylesheet" href="./css/ionicons.min.css">
	
	<link rel="stylesheet" href="./css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="./css/jquery.timepicker.css">
	
	
	<link rel="stylesheet" href="./css/flaticon.css">
	<link rel="stylesheet" href="./css/icomoon.css">
	<link rel="stylesheet" href="./css/style.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">



<!-- 블로그 로딩 코드 start -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#waiting {
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    position: fixed;
    display: flex;
    background: white;
    z-index: 999;
    opacity: 0.9;
}
#waiting > img {
    display: flex;
    width: fit-content;
    height: fit-content;
    margin: auto;
}
</style>
<div id="waiting">
   <img src="./img/loading.gif">
</div>

<script type="text/javascript">
    $(window).on('load', function() {
        setTimeout(function(){
            $("#waiting").fadeOut();
        }, 300);
    });
</script>
<!-- 블로그 로딩 코드 end -->
	
	<script type="text/javascript">

	function updateBoard(seq){
		Swal.fire({
		  title: '글을 수정하시겠습니까?',
		  // text: "삭제하시면 다시 복구시킬 수 없습니다.",
		  icon: 'info',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: 'grey',
		  confirmButtonText: '수정',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
	        //"등록" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
	 		if(document.fr.rev_subject.value == ""){
	 		    Swal.fire({
	 		    	icon: 'error',
					text: '제목을 입력해주세요'
				})
	 			document.fr.rev_subject.focus();
	 			return;
	 		}
	 		if(document.fr.rev_content.value == ""){
	 		    Swal.fire({
	 		    	icon: 'error',
					text: '내용을 입력해주세요'
				})
	 			document.fr.rev_content.focus();
	 			return;
	 		}
	 		if(document.fr.rev_star.value == ""){
	 		    Swal.fire({
	 		    	icon: 'error',
					text: '별점을 입력해주세요'
				})
	 			document.fr.rev_star.focus();
	 			return;
	 		}
	 		else{
	 		    Swal.fire({
	 		    	icon: 'success',
					text: '글이 수정되었습니다'
				})
	 		}
			var f= document.forms.fr;
			document.domain = "localhost"; 
		    opener.name = "openerNames";
		    f.target = opener.name;
		    
	        fr.submit();
	        self.close();

		  }
		})
	}
	
	function backBoard(seq){
		Swal.fire({
		  title: '이전페이지로 돌아가시겠습니까?',
		  // text: "삭제하시면 다시 복구시킬 수 없습니다.",
		  icon: 'info',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: 'grey',
		  confirmButtonText: '네',
		  cancelButtonText: '아니오'
		}).then((result) => {
		  if (result.value) {
	          //"등록" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
				var f= document.forms.fr;
				document.domain = "localhost"; 
			    opener.name = "openerNames";
			    f.target = opener.name;
			    
		        self.close();
		  }
		})
	}
	
	function back(){
		history.back();
	}
	

	</script>
</head>
  <body>

<!-- contact 작성Form -->
	
          <div class="col-md-8 block-9 mb-md-5">
            <form action="./ReviewUpdateProAction.rev?rev_num=${dto.rev_num }" name = "fr" class="bg-light p-5 contact-form" method="post" >
           <div class="form-group">
           	 <h3><b>리뷰 수정</b></h3>	 
              <div class="form-group">
                <input type="text" class="form-control" name="rev_subject" value="${dto.rev_subject }">
              </div>
              <div class="form-group">
                <textarea name="rev_content" id="" cols="30" rows="15" class="form-control"  >${dto.rev_content }</textarea>
              </div>
              <c:if test="${dto.rev_star == 5 }">
				  <div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="rev_star" value="5" v-model="ratings" checked />
					<label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="rev_star" value="4" v-model="ratings"/>
					<label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="rev_star" value="3" v-model="ratings"/>
					<label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="rev_star" value="2" v-model="ratings"/>
					<label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="rev_star" value="1" v-model="ratings"/>
					<label for="1-star" class="star">★</label>
				  </div>
			  </c:if>
              <c:if test="${dto.rev_star == 4 }">
				  <div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="rev_star" value="5" v-model="ratings" />
					<label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="rev_star" value="4" v-model="ratings" checked/>
					<label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="rev_star" value="3" v-model="ratings"/>
					<label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="rev_star" value="2" v-model="ratings"/>
					<label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="rev_star" value="1" v-model="ratings"/>
					<label for="1-star" class="star">★</label>
				  </div>
			  </c:if>
              <c:if test="${dto.rev_star == 3 }">
				  <div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="rev_star" value="5" v-model="ratings" />
					<label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="rev_star" value="4" v-model="ratings"/>
					<label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="rev_star" value="3" v-model="ratings" checked/>
					<label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="rev_star" value="2" v-model="ratings"/>
					<label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="rev_star" value="1" v-model="ratings"/>
					<label for="1-star" class="star">★</label>
				  </div>
			  </c:if>
              <c:if test="${dto.rev_star == 2 }">
				  <div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="rev_star" value="5" v-model="ratings" />
					<label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="rev_star" value="4" v-model="ratings"/>
					<label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="rev_star" value="3" v-model="ratings"/>
					<label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="rev_star" value="2" v-model="ratings" checked/>
					<label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="rev_star" value="1" v-model="ratings"/>
					<label for="1-star" class="star">★</label>
				  </div>
			  </c:if>
              <c:if test="${dto.rev_star == 1 }">
				  <div class="star-rating space-x-4 mx-auto">
					<input type="radio" id="5-stars" name="rev_star" value="5" v-model="ratings" />
					<label for="5-stars" class="star pr-4">★</label>
					<input type="radio" id="4-stars" name="rev_star" value="4" v-model="ratings"/>
					<label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="rev_star" value="3" v-model="ratings"/>
					<label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="rev_star" value="2" v-model="ratings"/>
					<label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="rev_star" value="1" v-model="ratings" checked/>
					<label for="1-star" class="star">★</label>
				  </div>
			  </c:if>
				<br>
			  <div class="form-group">
                <input type="button" value="수정" class="btn btn-primary py-2 px-3"  onclick="return updateBoard();">
                <input type="button" value="닫기" class="btn btn-primary py-2 px-3" onclick="backBoard();">                
                <input type="reset" value="초기화" class="btn btn-primary py-2 px-3">

              </div>
              
			  <div style="display:none">
				<input type="file" id="input-file" name="rev_image"/> <br><br>
              </div>
			</div>
              
              
           
            </form>  
          </div>
        </div>
	
<!-- contact 작성Form -->
    </section>
	
	
<!-- 푸터 시작 -->
<%-- 	<jsp:include page="../inc/bottom.jsp"></jsp:include> --%>
<!-- 푸터 끝 -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


	<script src="./js/jquery.min.js"></script>
	<script src="./js/jquery-migrate-3.0.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/jquery.easing.1.3.js"></script>
	<script src="./js/jquery.waypoints.min.js"></script>
	<script src="./js/jquery.stellar.min.js"></script>
	<script src="./js/owl.carousel.min.js"></script>
	<script src="./js/jquery.magnific-popup.min.js"></script>
	<script src="./js/aos.js"></script>
	<script src="./js/jquery.animateNumber.min.js"></script>
	<script src="./js/bootstrap-datepicker.js"></script>
	<script src="./js/jquery.timepicker.min.js"></script>
	<script src="./js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="./js/google-map.js"></script>
	<script src="./js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    
  </body>
</html>