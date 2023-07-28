<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script type="text/javascript">
	window.addEventListener('load', function(){
		btnSigninView.addEventListener('click',function(){
	          signupForm.style.display = 'none';
	          signinForm.style.display = '';
	        })

	        btnSignupView.addEventListener('click',function(){
	          signupForm.style.display = '';
	          signinForm.style.display = 'none';
	      	})
		
		
		btnLogin.addEventListener('click', function(e){
			// 기본 이벤트 제거
			e.preventDefault();
			// 파라메터 수집
			let obj={
				id : document.querySelector('#id').value
				, pw : document.querySelector('#pw').value
			}
			
			console.log(obj);
			
			// 요청
			fetchPost('/peco/loginAction', obj, loginCheck)
		})
	})
	
	
	
	function loginCheck(map) {
		
		console.log(map);
		// 로그인 성공 -> list 로 이동
		// 실페 -> 메세지 처리
		if(map.result == 'success'){
			location.href = map.url;
		} else {
			msg.innerHTML = map.msg
		}
	}
	
	// get방식 요청
	function fetchGet(url, callback){
		try{
			// url 요청
			fetch(url)
				// 요청결과 json문자열을 javascript 객체로 반환
				.then(response => response.json())
				// 콜백함수 실행
				.then(map => callback(map));			
		}catch(e){
			console.log('fetchGet',e);
		}
	}

	// post방식 요청
	function fetchPost(url, obj, callback){
		try{
			// url 요청
			fetch(url
					, {
						method : 'post'
						, headers : {'Content-Type' : 'application/json'}
						, body : JSON.stringify(obj)
					})
				// 요청결과 json문자열을 javascript 객체로 반환
				.then(response => response.json())
				// 콜백함수 실행
				.then(map => callback(map));			
		}catch(e){
			console.log('fetchPost', e);
		}
		
	}
</script>

<title>페코 로그인</title>


<!-- Bootstrap core CSS -->
<%@include file="./commo/css.jsp"%>

</head>

<body>

	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- header -->
	<%@include file="./commo/header.jsp"%>
	
	<!-- 로그인 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<!-- ***** login Start *****-->
					<form name='signinForm'>
						<div class="login-img">
							<!-- 이미지 -->
						</div>
						<div id="msg"></div>
						<h1 class="h3 mb-3 fw-normal">Please sign in</h1>

						<div class="form-floating">
							<input type="text" class="form-control" id="id"> <label
								for="id">id</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="pw"> <label
								for="pw">Password</label>
						</div>

						<div class="checkbox mb-3">
							<label> <input type="checkbox" value="remember-me">
								Remember me
							</label>
						</div>
						<button class="w-100 btn btn-lg btn-warning" required="required"
							type="submit" id="btnLogin">Login</button>
							
							<a class="mt-5 mb-3 text-muted" id='btnSignupView' >회원가입</a>
					</form>
		
					<!-- ***** login End ***** -->

					<!-- ***** 회원 가입 ***** -->
					<form name='signupForm' style='display: none;'>

						<div class="login-img">
							<!-- 이미지 -->
						</div>
						<h1 class="h3 mb-3 fw-normal">Please sign in</h1>
						<div id="signupMsg"></div>
						<div class="form-floating">
							<input type="text" required="required" class="form-control"
								id="signUpName"> <label for="signUpName">name</label>
						</div>
						
						<div class="form-floating">
							<input type="text" required="required" class="form-control"
								id="signUpId"> <label for="signUpid">Id</label>
						<button class="btn btn-lg btn-warning" required="required"
							type="button" id="btnid">아이디 중복 검사</button>
						</div>
						<div class="form-floating">
						
							<input type="password" required="required" class="form-control"
								id="signUpPw"> <label for="signUpPw">Password</label>
						</div>
						<div class="form-floating">
							<input type="password" required="required" class="form-control"
								id="pwCheck"> <label for="signUpPwCheck">Password
								Check</label>
						</div>
						<div class="form-floating">
							<input type="text" required="required" class="form-control"
								id="name"> <label for="signUpPwCheck">Name</label>
						</div>
						<div class="form-floating">
							<input type="text" required="required" class="form-control"
								id="nickName"> <label for="signUpPwCheck">NickName</label>
						</div>
						
						<div class="form-floating">
							<input type="text" required="required" class="form-control"
								id="age"> <label for="signUpPwCheck">Age</label>
						</div>
						<div class="form-floating">
							<input type="email" required="required" class="form-control"
								id="email"> <label for="signUpPwCheck">Email</label>
						</div>
						<div class="form-floating">
							<input type="text" required="required" class="form-control"
								id="phone"> <label for="signUpPwCheck">Phone number</label>
						</div>
						<div class="form-floating">
							<input type="file" required="required" class="form-control"
								id="profile"> <label for="signUpPwCheck">프로필첨부</label>
						</div>


						<button class="w-100 btn btn-lg btn-primary" type="submit"
							id="btnSignup">회원가입</button>
							<a class="mt-5 mb-3 text-muted" id='btnSigninView' >회원가입</a>
					</form>
					<!-- ***** 회원가입 End ***** -->
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<p>
						Copyright © 2036 <a href="#">Cyborg Gaming</a> Company. All rights
						reserved.
				</div>
			</div>
		</div>
	</footer>


	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js"
		integrity="sha512-8Y8eGK92dzouwpROIppwr+0kPauu0qqtnzZZNEF8Pat5tuRNJxJXCkbQfJ0HlUG3y1HB3z18CSKmUo7i2zcPpg=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script src="/resources/assets/js/isotope.min.js"></script>
	<script src="/resources/assets/js/owl-carousel.js"></script>
	<script src="/resources/assets/js/tabs.js"></script>
	<script src="/resources/assets/js/popup.js"></script>
	<script src="/resources/assets/js/custom.js"></script>


</body>

</html>