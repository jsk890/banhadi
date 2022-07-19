<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>수의테크니션 회원가입</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        #formBox{
            position: relative;
            width: 600px;
            height: auto;
            margin: 100px auto;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        #background{
            position: absolute;
            width: 600px;
            height: 600px;
            background-image: url("img/logo.png");
            background-size: 165px 195px;
            background-repeat: no-repeat;
            background-position: right top;
            animation: backgroundOpacity 2s ease;
            opacity: 0.5;
        }
        @keyframes backgroundOpacity {
            0%{opacity: 0}
            100%{opacity: 0.5}
        }
        .titleArea{
            margin: 50px 0 0 50px;
            width: 460px;
            height: 100px;
        }
        .title{
            position: relative;
            font-size: 25px;
            font-weight: bold;
        }
        .subtitle{
            position: relative;
            top: 10px;
            font-size: 14px;
        }
        .tagArea{
            display: block;
            position: relative;
            width: 130px;
            height: 60px;
            left: 70px;
        }
        .inputArea{
            position: absolute;
            top:-7px;
            left: 120px;
            width: 230px;
            height: 30px;
            border: 1px solid #bbb;
            border-radius: 3px;
            font-size: 13px;
        }
        #btn_signUp_next{
            position: relative;
            left: 75%;
            width: 100px;
            height: 40px;
            border: 1px solid #888888;
            border-radius: 50px;
            background-color: #e5e5e5;
            font-size: 18px;
            font-weight: 700;
            color: #888888;
            margin-bottom: 40px;

            cursor: pointer;
        }
        #btn_signUp_next:hover{
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        .emailId{
            width: 100px;
        }
        .email{
            left: 250px;
            width: 100px;
        }
        .selectedEmail{
            left: 360px;
            width: 100px;
            height: 34px;
        }
        .name{
            width: 100px;
        }
        .phoneNum{
            left: 210px;
            width: 140px;
        }
        .carrier{
            width: 85px;
            height: 34px;
        }
        /*인증하기 버튼*/
        .certification {
            left: 360px;
            width: 100px;
            height: 34px;
            color: #888;
            font-weight: bold;
        }
        /*병원찾기 버튼*/
        .btn_searchHospital {
            left: 360px;
            width: 100px;
            height: 34px;
            color: #888;
            font-weight: bold;
        }
        /* @ */
        .atSign {
            position: relative;
            left: 230px;
            top: -15px;
        }

        /*이미지 삽입*/
        .image_inputType_file {
            /*background-color: red;*/
            display: inline-block;
            width: 100px;
            height: 170px;
        }
        .image_inputType_file > input{
            display: none;
        }
        .image_inputType_file > span {
            position: relative;
            left: 350px;
            top: -190px;
            font-size: 15px;
        }
        .img_file {
            display: inline-block;
            background-color: #e0e0e0;
            width: 150px;
            height: 150px;
            border: none;
            cursor: pointer;
            font-size: 30px;
            text-align: center;
            line-height: 140px;

            position: relative;
            top: -20px;
            left: 120px;
        }


        /*유효성검사*/
        .agreeMsg {
            display: inline-block;
            position: relative;
            width: 500px;
            height: auto;
            top: 14px;
            left: 120px;
            font-size: 12px;
        }
        #emailAgreeMsg {
            color: blue;
            display: none;
        }

        #emailErrorMsg {
            color: red;
            display: none;
        }

        #passwordAgreeMsg {
            color: blue;
            display: none;
        }
        #passwordErrorMsg {
            color: red;
            display: none;
        }
        #passwordCheckAgreeMsg {
            color: blue;
            display: none;
        }
        #passwordCheckErrorMsg {
            color: red;
            display: none;
        }
        #searchHospitalErrorMsg {
            color: red;
            display: none;
        }


        /*수의사 회원가입 제목*/
        #veterinaryTechnicianSignUp{
            /*background-color: #009688;*/
            /*중앙 정렬, 박스 크기*/
            margin: auto;
            width: 350px;
            height: 60px;
            /*signUpBox로 부터 10px 마진*/
            position: relative;
            top: 80px;
        }
        /*병원장 회원가입 제목 폰트*/
        #veterinaryTechnicianSignUp h2 {
            /*폰트 사이즈, 웨이트*/
            font-size: 30px;
            font-weight: 700;
            /*폰트 수평,수직 정렬*/
            text-align: center;
            line-height: 60px;
        }

        /*팝업 띄었을 때 뒷배경*/
        .popup_search_hospital_background{
            display: none;
            position: fixed;
            z-index: 2;
            left:0;
            top:0;
            width:100%;
            height:100%;
            background-color: rgba(0,0,0,.5);
            background-repeat: no-repeat;
            background-position: center;
            cursor: pointer;
        }
        /*팝업 띄었을 때 뒷배경 나오게하는 on클래스 (toggleClass)*/
        .popup_search_hospital_background.on,
        .popup_search_hospital_total.on{
            display: block;
        }
        /*팝업 창*/
        .popup_search_hospital_total {
            display: none;
            position: fixed;
            z-index: 3;
            /*margin: auto;*/
            top: 10%;
            left: 50%;
            margin-left: -280px;
            width: 560px;
            height: 500px;
            border-radius: 10px;
            background-color: #fff;
            cursor: auto;
        }
        /*팝업 헤더*/
        .popup_header {
            background-color: #B2EBF2;
            width: 100%;
            height: 60px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .popup_header > h2 {
            font-size: 28px;
            font-weight: 200;
            padding: 16px;
        }
        .popup_header > img {
            width: 35px;
            height: auto;

            position: relative;
            top: -50px;
            left: 515px;
        }

        /*병원찾기 검색 컨텐츠*/
        .popup_content {
            /*background-color: red;*/
            width: 460px;
            margin: 30px auto;
        }
        .popup_content h2 {
            font-size: 18px;
        }
        /*병원찾기 텍스트*/
        #searchInput {
            width: 300px;
            height: 18px;
            position: relative;
            top: -22px;
            left: 60px;
        }
        .btn_search_choice
        {
            width: 80px;
            height: 25px;
            color: #888;
            font-weight: bold;
            position: relative;
            top: -22px;
            left: 65px;
        }
        /*병원찾기 content*/
        .search_hospital_content {
            width: 480px;
            height: 350px;



        }
        .hospital_list {
            width: 478px;
            height: 350px;
            border: 1px solid #5e5e5e;
            border-radius: 5px;

            overflow-x: hidden;
            overflow-y: scroll;
        }
        .hospital_list li {
            width: 438px;
            height: 90px;
            margin: 10px auto;
            border: 1px solid #5e5e5e;
            border-radius: 5px;
        }
        .hospital_list img{
            width: 90px;
            height: 90px;
            border-radius: 5px;
        }
        .hospital_list p {
            position: relative;
            left: 100px;
            top: -90px;
            margin-top: 9px;
            color: #424242;
        }


		input:read-only {
			background-color:#dedede;
		}
	

    </style>

</head>
<body>

<div id="header">

</div>
<div id="content">

    <!--병원찾기 누를 시 팝업 창-->
    <div class="popup_search_hospital_total" id="popupSearchHospitalTotal">
        <div class="popup_header">
            <h2>병원등록</h2>
            <img src="img/logo.png" alt="logo" />
        </div><!--.popup_header end-->
        <div class="popup_content">
            <div class="search_hospital_header">
                <h2>병원명</h2>
                <input id="searchInput">
                <button class="btn_search_choice" id="btn_search_choice">병원조회</button>
            </div>
            <div class="search_hospital_content">
                <ul class="hospital_list" id="hospital_list">
                </ul>
            </div>
        </div><!--.popup_content-->
    </div><!--popup_search_hospital_total-->




    <!--병원찾기 누를 시 팝업 제외 뒷배경-->
    <div class="popup_search_hospital_background" id="popupSearchHospital"></div>

    <div id="signUpBox">

        <!--수의테크니션 회원가입 제목-->
        <div id="veterinaryTechnicianSignUp">
            <h2><i class="fas fa-user-nurse"></i> 수의테크니션 회원가입</h2>
        </div><!--veterinaryTechnicianSignUp end-->

        <form id="formBox" method="post" enctype="multipart/form-data" onsubmit="return false;">
        
	        <input type="hidden" id="hospitalNo" name="hospitalNo" />
			<input type="hidden" id="birthday" name="birthday" value="1900-01-01"/>
			<input type="hidden" id="type" name="type" value="e"/>
			<input type="hidden" id="position" name="position" value="t"/>
			
            <div id="background"></div>
            <fieldset>
                <div>
                    <div class="titleArea">
                        <h3 class="title">가입정보입력</h3>
                        <h4 class="subtitle">반하디의 서비스를 이용해 보세요!</h4>
                    </div>

                    <div class="tagArea">
                        <p>이름 <input type="text" name="userName" id="userName" class="inputArea name" placeholder="이름"></p>
                       <p id="nameErrorMsg" name="nameErrorMsg" class="agreeMsg" style="display:none;margin-top:7px;">필수 정보입니다.</p>
                    </div>

                    <div class="image_inputType_file tagArea">
	                    <p>사진</p>
	                    <input type="file" id="file" name="file" />
	                    <label class="img_file" for="file">+</label>
	                    <!--                    <span>미리보기</span>-->
	                </div>

                    <div class="tagArea">
                    <p>이메일 <input type="text" id="emailId" name="emailId" class="inputArea emailId"></p>
                    <span class="atSign">@</span>
                    <input type="text" id="emailDomain" name="emailDomain" class="inputArea email">
                    <select name="selectedEmail" id="selectedEmail" class="inputArea selectedEmail" onChange="javascript:selectEmail(this)">
                            <option value="" selected>이메일선택</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="hotmail.com">hotmail.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="1">직접입력</option>
                        </select>
                    <p id="emailErrorMsg" class="agreeMsg" style="margin-top: -7px;">이메일 형식을 다시 확인해주세요.</p>
                    <p id="emailAgreeMsg" class="agreeMsg" style="margin-top: -7px;">사용 가능한 이메일입니다.</p>
                </div>
                    <div class="tagArea">
                        <p>비밀번호 <input type="password" id="password1" name="password1" class="inputArea" placeholder="영문/숫자/특수문자 조합 6~12자리"></p>
                        <p id="passwordAgreeMsg" class="agreeMsg" style="margin-top:7px;">사용 가능한 비밀번호 입니다.</p>
                  	  	<p id="passwordErrorMsg" class="agreeMsg" style="margin-top:7px;">영문, 숫자, 특수문자를 조합하여 6~12자 입력해주세요.</p>
                    </div>
                    <div class="tagArea">
                        <p>비밀번호 확인 <input type="password" id="passwordConfirm" name="passwordConfirm" class="inputArea" placeholder="비밀번호 확인"></p>
                        <p id="passwordCheckAgreeMsg" class="agreeMsg" style="margin-top:7px;">비밀번호가 일치합니다.</p>
						<p id="passwordCheckErrorMsg" class="agreeMsg" style="margin-top:7px;">비밀번호가 일치하지 않습니다.</p>
                    </div>
                    <!-- 병원 찾기/등록 -->
                    <div class="tagArea">
                        <p>병원 찾기/등록 <input type="text" id="searchHospital" name="searchHospital" class="inputArea" placeholder="병원명" readonly></p>
                        <p id="searchHospitalErrorMsg" class="agreeMsg" style="margin-top:7px;">병원찾기를 해주세요.</p>
                        <button class="inputArea btn_searchHospital" id="btn_searchHospital">병원찾기</button>
                    </div>
                    <div class="tagArea">
                        <p>휴대폰번호 <input type="text" id="hpNo" name="hpNo" class="inputArea phoneNum" placeholder="숫자만 입력"></p>
                    	<select class="inputArea carrier" name="sel_hp" id="sel_hp">
                            <option>SKT</option>
                            <option>KT</option>
                            <option>LGU+</option>
                            <option>SKT 알뜰폰</option>
                            <option>KT 알뜰폰</option>
                            <option>LGU+ 알뜰폰</option>
                        </select>
                        <button class="inputArea certification" id="btn_send_authNo">인증하기</button>
                    </div>
                    <div>
                        <button id="btn_signUp_next">가입</button>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    </div><!-- signupbox end -->
    <%@ include file="/WEB-INF/template/footer.jsp" %>

<script src="js/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
const EXP_EMAIL 		= /^[0-9a-zA-Z\_\-\.]{1,}@[0-9a-zA-Z\_\-]{1,}\.{1}[0-9a-zA-Z\_\-]{1,}\.{0,1}[0-9a-zA-Z\_\-]*$/;
const EXP_PWD_PATTERN1 	= /[a-zA-Z]/;	//영문
const EXP_PWD_PATTERN2	= /[0-9]/;		//숫자
const EXP_PWD_PATTERN3	= /[\{\}\[\]\/\?\.\,\;\:\|\)\*\~\`\!\^\-\_\+\<\>\@\#\$\%\&\\\=\(\'\"]/;	//특수문자

const EXP_HP_PATTERN1	= /[0-9\-]{10,13}$/;

var isAuth	= false;


//유효성 검사
function fn_validate(){
	if($("#userName").val()==""){
		$("#userName").focus();
		$("#nameErrorMsg").css("display", "block");
	}else{
		$("#nameErrorMsg").css("display", "none");
	}
	
	const email		= $("#emailId").val() + '@' + $("#emailDomain").val();

	$("#emailErrorMsg").text("이메일 형식을 다시 확인해주세요.");
	if(!EXP_EMAIL.test(email)){
		$("#emailId").focus();
		$("#emailAgreeMsg").css("display", "none");
		$("#emailErrorMsg").css("display", "block");
		return false;
	}else{
		$("#emailAgreeMsg").css("display", "block");
		$("#emailErrorMsg").css("display", "none");
	}
	
	if(!EXP_PWD_PATTERN1.test($("#password1").val()) || !EXP_PWD_PATTERN2.test($("#password1").val()) || !EXP_PWD_PATTERN3.test($("#password1").val()) || ($("#password1").val().length < 6 || $("#password1").val().length > 12) || $("#password1").val()==""){
		$("#password1").focus();
		$("#passwordAgreeMsg").css("display", "none");
		$("#passwordErrorMsg").css("display", "block");
		return false;
	}else{
		$("#passwordAgreeMsg").css("display", "block");
		$("#passwordErrorMsg").css("display", "none");
	}
	 
	if($("#password1").val() != $("#passwordConfirm").val()){
		$("#passwordConfirm_msg").focus();
		$("#passwordCheckAgreeMsg").css("display", "none");
		$("#passwordCheckErrorMsg").css("display", "block");
		return false;
	}else{
		$("#passwordCheckAgreeMsg").css("display", "block");
		$("#passwordCheckErrorMsg").css("display", "none");
	}
	
	$("#searchHospitalErrorMsg").css("display", "none");
	if($("#searchHospital").val()==""){
		$("#searchHospitalErrorMsg").css("display", "block");
		return false;
	}
	
	if($("#hpNo").val()=="" || !EXP_HP_PATTERN1.test($("#hpNo").val())){
		alert("※ 휴대폰번호를 확인해주세요");
		return false;
	}else{
		if(!("/010/011/016/018/019/".indexOf($("#hpNo").val().substring(0,3))>=0)){
			alert("※ 휴대폰번호를 확인해주세요");
			return false;
		}
	}
	 
	return true;
}

//이메일주소 select
function selectEmail(ele){ 
	var $ele = $(ele); 
	var $emailDomain = $('input[name=emailDomain]'); 
	
	// '1'인 경우 직접입력 
	if($ele.val() == "1"){ 
		$emailDomain.attr('readonly', false); $emailDomain.val(''); 
	} else { 
		$emailDomain.attr('readonly', true); $emailDomain.val($ele.val()); 
	} 
}

//이메일 체크
function fn_email_check(){
	const email		= $("#emailId").val() + '@' + $("#emailDomain").val();
	
	$.ajax({
		url:"/ajax/checkEmail.json",
		type:"post",
		data:{
			email : email
		},
		dataType: "json",
		error:function(xhr,error){
			console.log(error);
		},
		success:function(data){
			if(data.result){
				$("#emailAgreeMsg").css("display", "none");
				$("#emailErrorMsg").text("이미 사용중이거나 탈퇴한 이메일입니다");
				$("#emailErrorMsg").css("display", "block");
			}else {
				$("#emailAgreeMsg").css("display", "block");
				$("#emailErrorMsg").css("display", "none");
			
				fn_join();
			}
		}
	});
}

//회원가입
function fn_join(){
	var form	= $('#formBox')[0];
	
	var data	= new FormData(form);
	
	$("#btn_signUp_next").prop("disabled", true);
	
	$.ajax({
		url:"/ajax/HospitalTechnianJoin.json",
		type:"post",
		enctype: 'multipart/form-data',
		data: data,
		processData: false,
        contentType: false,
        cache: false,
		dataType: "json",
		error:function(xhr,error){
			$("#btn_signUp_next").prop("disabled", false);
			console.log(error);
		},
		success:function(data){
			$("#btn_signUp_next").prop("disabled", false);
			if(data.result){
				alert("회원가입이 완료 되었습니다.");
				//회원가입 완료 후 redirect 페이지 이동.(ex 로그인페이지)
			}else{
				alert("회원가입에 실패 하였습니다.");
			}
		}
	});
}

//인증번호 발송
$("#btn_send_authNo").on("click", function(){
	isAuth	= true;
	//핸드폰번호 유효성 체크
	if($("#hpNo").val()=="" || !EXP_HP_PATTERN1.test($("#hpNo").val())){
		alert("※ 휴대폰번호를 확인해주세요");
		return;
	}else{
		if(!("/010/011/016/018/019/".indexOf($("#hpNo").val().substring(0,3))>=0)){
			alert("※ 휴대폰번호를 확인해주세요");
			return;
		}
	}
	$("#sel_hp").attr("disabled", true);
	$("#hpNo").attr("readonly", "readonly");
	$("#btn_send_authNo").attr("disabled", true);
	alert("인증 되었습니다.");
});

//가입하기 버튼
$("#btn_signUp_next").click(function(e){
	//가입하기 전 validation체크
	if(!fn_validate())
		return;
	
	e.preventDefault();
	
	fn_email_check();
});

//병원조회 버튼 눌렀을 시 content에 input과 이름이 맞는 해당 리스트가 나온다.
$("#btn_search_choice").on("click",function () {
	$.ajax({
		url:"/ajax/searchHospitals.json",
		type:"post",
		data:{
			hospitalName : $("#searchInput").val()
		},
		dataType: "json",
		error:function(xhr,error){
			console.log(error);
		},
		success:function(data){
			var content	= "";
			if(data.result != null && data.result.length > 0){
				for(var i=0;i<data.result.length;i++){
					content += "<li onclick=\"javascript:fn_set_hospital('"+data.result[i]['NO']+"','"+data.result[i]['NAME']+"');\">";
					content += "	<img src=\"img/"+data.result[i]['MAIN_IMAGE']+"\">";
					content += "	<p><strong>"+data.result[i]['NAME']+"</strong></p>";
					content += "	<p><i class=\"fas fa-phone-alt\"></i>"+data.result[i]['PHONE_NUM']+"</p>";
					content += "	<p><i class=\"fas fa-map-marker-alt\"></i>"+data.result[i]['ADDRESS']+"</p>";
					content += "</li>";
				}
			}
			
			$("#hospital_list").html(content);
		}
	});
});

function fn_set_hospital(no, name){
	$("#hospitalNo").val(no);
	$("#searchHospital").val(name);
	$("#popupSearchHospital").trigger("click");
}

$("#file").on("change", function() {
	const file = this.files[0];
	if (/^image\//.test(file.type)) {
		fn_readImage(this);
	} else {
		alert("이미지를 선택해주세요!");
		return;
	}
});

//팝업창 띄우기
$("#btn_searchHospital").on("click",function (e) {
	e.preventDefault();
	$("#popupSearchHospital").toggleClass("on");
	$("#popupSearchHospitalTotal").toggleClass("on");
	//스크롤 락
	$("html").css({
		overflow:"hidden"
	});
	$("#content, #header").css({
		paddingRight:"17px"
	});
	$(".aux").css({
		left:"-8px"
	});
});//$btnSearchHospital click end

//뒷배경 누르면 꺼짐
$("#popupSearchHospital").click(function (){
	$("#popupSearchHospital").toggleClass("on");
	$("#popupSearchHospitalTotal").toggleClass("on");
	//스크롤 언락
	$("html").css({
		overflow:"visible"
	});
});

function fn_readImage(obj){
	var reader	= new FileReader();
	reader.onload	= function(e){
		$("<img>").attr("src", e.target.result).attr("class", "img_profile")
		.css({
			"width":"150px",
			"height":"150px",
			"position":"relative",
			"top":"-20px",
			"left":"120px"
		}).appendTo("label");
		
		$("label").replaceWith($("img.img_profile"));   //이미지 업로드하는 label 대신 등록한 img를 넣어준다.
	}
	reader.readAsDataURL(obj.files[0]);
}
</script>
</body>
</html>