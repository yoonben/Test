<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/1831dab350.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	window.addEventListener('load', function(){
		btnList.addEventListener('click',function(){
			getFileList();
		})
		
		// 파일 업로드
		btnFileupload.addEventListener('click', function(){
			// 웹 개발에서 HTML 폼 데이터를
			// JavaScript로 쉽게 조작하고 전송하는 방법을 제공하는 API
			let formData = new FormData(uploadForm);
		 
			
			console.log("formData : ", formData);
			for(var pair of formData.entries()){
				if(typeof(pair[1]) == 'object'){
					let fileName = pair[1].name;
					let fileSize = pair[1].size;
					// 파일 확장자, 크기 체크
					// 서버에 전송 가능한 형식인지 확인
					// 최대 전송가능한 용량을 초과하지 않는지
					if(!checkExtension(fileName,fileSize)){
						return false;
					}
					
					console.log('fileName',pair[1].name);
					console.log('fileSize',pair[1].size);
				
				}
			}
			
			fetch('/peco/fileuploadActionFetch'
					,{ 
						method : 'post'
						, body : formData
			})
			.then(response=>response.json())
			.then(map => fileuploadRes(map));
		});
	})
	
	function checkExtension(fileName, fileSize) {
		let MaxSize = 1024 * 1024 *10;
		// .exe, .sh, .zip, .alz 끝나는 문자열
		// 정규표현식 : 특정 규칙을 가진 문자열을 검색하거나 치환 할때 사용
		let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		if(MaxSize <= fileSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		// 문자열에 정규식 패턴을 만족하는 값이 있으면 true, 없으면 ㄹ먀ㅣ
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다");
			return false;
		}
		return true;
	}
	
	function fileuploadRes(map){
		if(map.result == 'success'){
			divFileuploadres.innerHTML = map.msg;		
		}else{
			alert(map.msg);
		}
	}
	
	function getFileList() {
		let bno = document.querySelector("#bno").value;
		fetch('/peco/list/'+bno)
			.then(response=>response.json())
			.then(map => viewFileList(map));
	}
	
	function attachFileDelete(e) {
		let uuid = e.dataset.uuid;
		let bno = e.dataset.bno;
	
		//fetch('/file/delete/'+uuid+'/'+bno)
		fetch(`/file/delete/\${uuid}/\${bno}`)
	    .then(response => response.json())
	    .then(map => filedeleteRes(map));
	}
	
	function  filedeleteRes(map) {
		if(map.result == 'success'){
			divFileuploadres.innerHTML = map.msg;
			getFileList();
		}else{
			alert(map.msg);
		}
	}
	
	function viewFileList(map) {
		console.log(map);
		let content = '';
		if(map.list.length > 0){
			map.list.forEach(function(item, index) {
				let savePath = encodeURIComponent(item.savePath)
				console.log(savePath);
				content += ''
						+ '<a href = "/file/download?fileName='+savePath+'">'
						+ item.fileName + "</a>"
						+ ' data-bno="'+item.bno+'" data-uuid = "'+item.uuid+'"'
						+ '<i onclick="attachFileDelete(this)" data-bno="'+item.bno+'" data-uuid="'+item.uuid+'" class="fa-solid fa-xmark"></i>'
						+'<br>';
			})
		} else {
			content = '등록된 파일이 없습니다.';
		}
		
		divFileupload.innerHTML = content; 
	}
</script>
</head>
<body>
	<h2>파일 업로드</h2>
	<form method="post" action="/peco/fileuploadAction"
	 enctype="multipart/form-data" name="uploadForm">
	 
	 	<h2>파일 선택</h2>
	 	m_id : <input type="text" name="m_id" id="m_id" value="4"><br><br>
	 	<input type="file" name="files" multiple="multiple"><br><br>
	 	
	 	<button type="submit">파일 업로드</button>
	 	<button type="button" id="btnFileupload">Fetch파일업로드</button>
		<div id="divFileuploadres">
		res : ${param.msg }
		</div>
	 </form>
	 
	 <h2>파일 리스트 조회</h2>
	 <button type="button" id="btnList" >리스트 조회</button>
	 <div id="divFileupload">
	 
	 </div>
</body>
</html>