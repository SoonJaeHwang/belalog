<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	initMgmtPage();	// 화면 초기화
});

function initMgmtPage() {
    var custNo = '${custNo}';
    
	if (custNo != '') {
		$('#searchKeywordCustNo').val(custNo);
		searchCustBasicInfo();
    }
    
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
	if (($('#searchKeywordCustNm').val() == null || $('#searchKeywordCustNm').val() == '')
	 && ($('#searchKeywordCustNo').val() == null || $('#searchKeywordCustNo').val() == '')
	) {
		alert('검색조건을 입력해주세요.');
		return false;
	}
	
	if ($('#searchKeywordCustNm').val() != '') {
		$('#searchKeywordCustNo').val(null);
	}

	var params = {
					"custNo" : $('#searchKeywordCustNo').val().trim()
				  , "custNm" : $('#searchKeywordCustNm').val().trim()
				  , "sex"    : $('input:radio[name="sex"]:checked').val()
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
				$('#searchKeywordCustNm').val(result.belalogCustDto.custNm);
				$("#custNo").val(result.belalogCustDto.custNo);
				$("#custNm").val(result.belalogCustDto.custNm);
        	   	if (result.belalogCustDto.sex == 'M') {
        	   		$('input:radio[id="sexM"]').attr('checked', true);
        	   	} else {
        	   		$('input:radio[id="sexF"]').attr('checked', true);
        	   	}
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
	if (!checkCustBasicInfo()) {
		return false;
	}
	
	var params = {
					"custNo" : $('#custNo').val()
				  , "custNm" : $('#custNm').val()
				  , "sex"    : $('input:radio[name="sex"]:checked').val()
				 };
	
	$.ajax({
		url         : '/belalog/backend/saveCustBasicInfo',
		data        : JSON.stringify(params),
		type        : 'POST',
		contentType : 'application/json',
		dataType    : 'json',
		cache       : false,
		success     : function(result) {
			if (result.resultMsg == "0000") {
				alert("고객정보가 성공적으로 등록되었습니다.");
				location.href = '/belalog/backend/belalogMgmtMain?custNo=' + result.belalogCustDto.custNo;
			} else {
				alert(result.resultMsg);
			}
		},
		error       : function(jqXhr, status, error) {
			alert('고객정보 등록에 실패하였습니다(' + error + ').');
		}
	});
}

function checkCustBasicInfo() {
	if ($('#custNm').val() == null || $('#custNm').val() == "") {
		alert('고객 이름을 입력해주세요.');
		return false;
	}
	
	if ($('input:radio[name="sex"]:checked').val() == null || $('input:radio[name="sex"]:checked').val() == "") {
		alert('고객 성별을 선택해주세요.');
		return false;
	}
	/*
	if ($('#telNo').val() == null || $('#telNo').val() == "") {
		alert('고객 연락처를 입력해주세요.');
		return false;
	}
	*/
	
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
	검색(이름): <input type="text" id="searchKeywordCustNm" value="" onkeyup="javascript:enterKey();"/><button type="button" id="btn_search">검색</button>
	<br><br>
	- 이름: <input type="text" id="custNm" value=""/><br>
	- 성별: M<input type="radio" id="sexM" name="sex" value="M" title="남자"/>&nbsp;F<input type="radio" id="sexF" name="sex" value="F" title="여자"/><br>
	- 연락처: <input type="text" id="telNo" value=""/><br>
	<br>
	<button type="button" id="btn_save">등록/수정</button>
	<input type="hidden" id="searchKeywordCustNo" value=""/>
	<input type="hidden" id="custNo" value=""/>
	<form id="custInfoForm" name="custInfoForm" method="post" enctype="multipart/form-data">
	</form>
</body>
</html>