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
		
		btnSignup.addEventListener('click', function(e){
			// 기본 이벤트 제거
			e.preventDefault();
			
			let id = signUpId.value;
			let pw = signUpPw.value;
			let name = signUpName.value;
			let nickname = nickName.value
			let emailValue  = email.value;
			let mage = age.value;
			let mphone = phone.value;
			
			// 아이디 중복 체크 확인
			if(idCheckRes.value != 1){
				signupMsg.innerHTML = "아이디를 확인해주세요";
				signUpId.focus();
				return;
			}
			
			// 아이디 중복 체크 확인
			if(nickNameRes.value != 1){
				signupMsg.innerHTML = "닉네임을 확인해주세요";
				nickName.focus();
				return;
			}
			
			obj = {
					id : id
					,pw : pw
					,mname : name
					,mage : mage
					,mphone  : mphone
					,email : emailValue 
					,nickname : nickname
			}
			
			
			console.log('회원기입 obj : ', obj);
			
			fetchPost('/peco/register', obj, (map)=>{
						if(map.result == 'success'){
							location.href='/peco/login?msg='+map.msg;
						}else{
							signupMsg.innerHTML = map.msg;
						}
			});
			
		})
		
		btnid.addEventListener('click', function(e){
	
			if(!signUpId.value){
				signupMsg.innerHTML = '아이디를 입력해주세요';
				return
			}
			
			let obj={id : signUpId.value};
			console.log("아이디 체크", obj);
			
			fetchPost('/peco/idCheck', obj, (map)=>{
				if(map.result == 'success'){
					// 아이디 사용 가능
					idCheckRes.value = '1';
					signUpPw.focus();
				}else{
					// 아이디 사용 불가능
					idCheckRes.value = '0';
					signUpId.focus();
				}
				signupMsg.innerHTML = map.msg;
			});
			
		})
		
		btnNickName.addEventListener('click', function(e){
	
			if(!nickName.value){
				signupMsg.innerHTML = '닉네임을 입력해주세요';
				return
			}
			
			let obj={nickname : nickName.value};
			console.log("닉네임 체크", obj);
			
			fetchPost('/peco/nicknameCheck', obj, (map)=>{
				if(map.result == 'success'){
					// 아이디 사용 가능
					nickNameRes.value = '1';
					age.focus();
				}else{
					// 아이디 사용 불가능
					nickNameRes.value = '0';
					nickName.focus();
				}
				signupMsg.innerHTML = map.msg;
			});
			
		})
		
		$('#mail-Check-Btn').click(function() {
			const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
			
			$.ajax({
				type : 'get',
				url : '<c:url value ="/peco/mailCheck?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
				success : function (data) {
					console.log("data : " +  data);
					checkInput.attr('disabled',false);
					code =data;
					alert('인증번호가 전송되었습니다.')
				}			
			}); // end ajax
		}); // end send eamil
		
		// 인증번호 비교 
		// blur -> focus가 벗어나는 경우 발생
		$('.mail-check-input').blur(function () {
			const eamil = $('#userEmail1').val() + $('#userEmail2').val();
			const inputCode = $(this).val();
			const $resultMsg = $('#mail-check-warn');
			
			if(inputCode === code){
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color','green');
				$('#mail-Check-Btn').attr('disabled',true);
				$('#userEamil1').attr('readonly',true);
				$('#userEamil2').attr('readonly',true);
				$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
		        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
		        console.log('인증 성공 이메일 : ' + eamil);
		        $('#email').val(eamil);
			}else{
				$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
				$resultMsg.css('color','red');
			}
		});
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