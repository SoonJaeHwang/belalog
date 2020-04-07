<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	console.log('Page Loading...');
	
	$('#btn_save').click(function(){
		saveCustBasicInfo();
	});
});

function saveCustBasicInfo() {
	//var custInfoForm = document.custInfoForm;
	
	// 값 유효성 체크
	if(!checkCustBasicInfo()) {
		return false;
	}

	var params = {
					"custNo" : $('#custNo').val()
				  , "custNm" : $('#custNm').val()
				 };
	
	$.ajax({
		url         : '/belalog/backend/saveCustBasicInfo',
		data        : JSON.stringify(params),
		type        : 'POST',
		contentType : 'application/json',
		dataType    : 'json',
		cache       : false,
		success     : function(result) {
			alert(result.belalogCustDto.custNo);
		},
		error       : function(jqXhr, status, error) {
			alert(error);
		}
	});
}

function checkCustBasicInfo() {
	if ($('#custNo').val() == null || $('#custNo').val() == "") {
		alert('고객 이름을 입력해주세요.');
		return false;
	}
	
	if ($('#telNo').val() == null || $('#telNo').val() == "") {
		alert('고객 연락처를 입력해주세요.');
		return false;
	}
	
	return true;
}
</script>
<meta charset="EUC-KR">
<title>BMS : Belalog Management System</title>
</head>
<body>
	<button type="button" id="btn_save">테슷흐버튼</button>
	<form id="custInfoForm" name="custInfoForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="custNo" value="202003000002"/>
		<input type="hidden" id="custNm" value="황순재"/>
		<input type="hidden" id="telNo"  value="010"/>
	</form>
</body>
</html>