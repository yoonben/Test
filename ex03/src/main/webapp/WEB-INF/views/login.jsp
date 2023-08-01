<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script src='/resources/js/jquery-3.7.0.js'></script>

<script src="/resources/js/login.js"></script>

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
						<button class="w-100 btn btn-lg btn-warning" type="submit"
							id="btnLogin">Login</button>

						<a class="mt-5 mb-3 text-muted" id='btnSignupView'>회원가입</a>
					</form>

					<!-- ***** login End ***** -->

					<!-- ***** 회원 가입 ***** -->
					<form name='signupForm' style='display: none;'>

						<div class="login-img">
							<!-- 이미지 -->
						</div>
						
						<!-- 회원 가입 체크 인풋 -->
						<input type="hidden" id="idCheckRes">
						<input type="hidden" id="nickNameRes">
						<input type="hidden" id="pwCheckRes">
						<input type="hidden" id="emailCheckRes">
						<input type="text" name="m_id" id="m_id" value="">
						<h1 class="h3 mb-3 fw-normal">Please sign up</h1>
						<div id="signupMsg"></div>
						<div class="form-floating">
							<input type="text" class="form-control" id="signUpName">
							<label for="signUpName">name</label>
						</div>

						<div class="form-floating">
							<input type="text" class="form-control" id="signUpId"> <label
								for="signUpid">Id</label>

							<button class="btn btn-lg btn-warning" type="button" id="btnid">아이디
								중복 검사</button>
						</div>

						<div class="form-floating">
							<input type="password" class="form-control" id="signUpPw">
							<label for="signUpPw">Password</label>
						</div>

						<div class="form-floating">
							<input type="password" class="form-control" id="pwCheck">
							<label for="signUpPwCheck">Password Check</label>
						</div>

						<div class="form-floating">
							<input type="text" class="form-control" id="nickName"> <label
								for="signUpPwCheck">NickName</label>
							<button class="btn btn-lg btn-warning" required="required"
								type="button" id="btnNickName">닉네임 중복 검사</button>
						</div>

						<div class="form-floating">
							<input type="text" class="form-control" id="age"> <label
								for="signUpPwCheck">Age</label>
						</div>

						<div class="form-floating">
							<%@include file="./emailCheck.jsp"%>
							<input type="hidden" id="email" type="hidden">
						</div>

						<div class="form-floating">
							<input type="text" class="form-control" id="phone"> <label
								for="signUpPwCheck">Phone number</label>
						</div>
						
						<div class="form-floating">
							<input type="file" class="form-control" id="files" name="files"> <label
								for="signUpPwCheck">프로필첨부</label>
						</div>


						<button class="w-100 btn btn-lg btn-primary" type="submit"
							id="btnSignup">회원가입</button>
						<a class="mt-5 mb-3 text-muted" id='btnSigninView'>회원가입</a>
					</form>
					<!-- ***** 회원가입 End ***** -->
				</div>
			</div>
		</div>
	</div>

	<footer> </footer>


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