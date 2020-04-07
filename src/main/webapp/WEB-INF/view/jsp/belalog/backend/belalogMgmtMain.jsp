<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
// 화면 초기화
initMgmtPage();
});

function initMgmtPage() {
	// 검색버튼 클릭 이벤트
	$('#btn_search').click(function(){
		searchCustBasicInfo();
	});

	// 저장버튼 클릭 이벤트
	$('#btn_save').click(function(){
		saveCustBasicInfo();
	});
}

function searchCustBasicInfo() {
	if ($('#searchKeyword').val() == null || $('#searchKeyword').val() == '') {
		alert('검색조건을 입력해주세요.');
		return false;
	}
	
	var params = {
					"custNm" : $('#searchKeyword').val().trim()
				 };

	$.ajax({
		url         : '/belalog/backend/searchCustBasicInfo',
		data        : JSON.stringify(params),
		type        : 'POST',
		contentType : 'application/json',
		dataType    : 'json',
		cache       : false,
		success     : function(result) {
			if (result.belalogCustDto != null) {
				//alert('조회성공: ' + result.belalogCustDto.custNo + ', ' + result.belalogCustDto.custNm + ', ' + result.belalogCustDto.telNo);
				$("#custNm").val(result.belalogCustDto.custNm);
				$("#sex").val(result.belalogCustDto.sex);
				$("#telNo").val(result.belalogCustDto.telNo);
			} else {
				alert('조회된 정보가 없습니다. 검색조건을 다시 확인해주세요.');
			}
		},
		error       : function(jqXhr, status, error) {
			alert(error);
		}
	});
}

function saveCustBasicInfo() {
//	var custInfoForm = document.custInfoForm;
	
	// 값 유효성 체크
	if(!checkCustBasicInfo()) {
		return false;
	}
	
	var params = {
					"custNm" : $('#custNm').val()
				 };
	
	$.ajax({
		url         : '/belalog/backend/saveCustBasicInfo',
		data        : JSON.stringify(params),
		type        : 'POST',
		contentType : 'application/json',
		dataType    : 'json',
		cache       : false,
		success     : function(result) {
    		alert("고객정보가 성공적으로 등록되었습니다.");
    		location.href = '';
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

// 검색버튼 Enter Key 적용
function enterKey() {
	if (window.event.keyCode == 13) {
		searchCustBasicInfo();
	}
}
</script>
<title>BMS : Belalog Management System</title>
</head>
<body>
	검색(이름): <input type="text" id="searchKeyword" value="" onkeyup="javascript:enterKey();"/><button type="button" id="btn_search">검색</button><br>
	이름: <input type="text" id="custNm" value=""/><br>
	성별: <input type="text" id="sex" value=""/><br>
	연락처: <input type="text" id="telNo" value=""/><br>
	<!--<button type="button" id="btn_save">테슷흐버튼</button>-->
	<form id="custInfoForm" name="custInfoForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="custNo" value=""/>
		<input type="hidden" id="custNm" value=""/>
		<input type="hidden" id="telNo"  value=""/>
	</form>
</body>
</html>