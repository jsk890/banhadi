<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String type = "c"; %>
    <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>병원장 회원가입</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <style>
    
   		/*병원장 회원가입 제목*/
        #veterinarianSignUp{
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
        #veterinarianSignUp h2 {
            /*폰트 사이즈, 웨이트*/
            font-size: 30px;
            font-weight: 700;
            /*폰트 수평,수직 정렬*/
            text-align: center;
            line-height: 60px;
        }
    
    
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

        .phoneNum{
            left: 210px;
            width: 140px;
        }
        .carrier{
            width: 85px;
            height: 34px;
        }
        .certification{
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


        /*면허번호 인증 후 이름,생년월일*/
        #nameAndDate {
            color: #000;
            font-weight: 700;
            display: none;
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

<div id="signUpBox">
    <!--병원장 회원가입 제목-->
    <div id="veterinarianSignUp">
        <h2><i class="fas fa-hospital"></i> 병원장 회원가입</h2>
    </div><!--veterinarianSignUp end-->

    <form id="formBox" method="post" enctype="multipart/form-data" onsubmit="return false;">
    	<input type="hidden" id="hospitalNo" name="hospitalNo" />
		<input type="hidden" id="userName" name="userName"/>
		<input type="hidden" id="birthday" name="birthday"/>
		<input type="hidden" id="latitude" name="latitude"/>
		<input type="hidden" id="longtitude" name="longtitude"/>
		<input type="hidden" id="type" name="type" value="e"/>
		<input type="hidden" id="position" name="position" value="c"/>
		
        <div id="background"></div>
        <fieldset>
            <div>
                <div class="titleArea">
                    <h3 class="title">가입정보입력</h3>
                    <h4 class="subtitle">반하디의 서비스를 이용해 보세요!</h4>
                </div>
                
                <!--사업자등록번호-->
		        <div class="tagArea">
		            <p>사업자등록번호 <input type="text" id="business_no" name="business_no" class="inputArea" placeholder="사업자등록번호"></p>
		            <button class="inputArea certification" id="btn_business_no">확인하기</button>
		            <p id="businessErrorMsg" class="agreeMsg" style="display:none; color: red;margin-top:7px;">올바르지 않은 사업자번호 입니다.</p>
		        </div>
		        <!--병원명-->
		        <div class="tagArea">
		            <p>병원명  <input type="text" id="hospital_name" name="hospital_name" class="inputArea" placeholder="병원명" readonly="readonly"></p>
		        </div>
		        <!--병원주소-->
		        <div class="tagArea">
		            <p>병원주소 <input type="text" id="hospital_address" name="hospital_address" class="inputArea" placeholder="병원주소" readonly="readonly"></p>
		        </div>
                
		        <!--병원전화번호-->
		        <div class="tagArea">
		            <p>병원전화번호 <input type="text" name="hospital_phoneNum" id="hospital_phoneNum" class="inputArea" placeholder="병원연락처" readonly="readonly"></p>
		        </div>

                <div class="licenseNumber tagArea">
                	<p>면허번호 <input type="text" id="licenseNumber" name="licenseNumber" class="inputArea" placeholder="면허번호"></p>
                    <button class="inputArea certification" id="btn_license">인증하기</button>
                    <p id="nameAndDate" class="agreeMsg" style="margin-top:7px;">김기현,1996-03-23</p>
                </div>

                <div class="image_inputType_file tagArea">
                    <p>사진</p>
                    <input type="file" id="file" name="file" />
                    <label class="img_file" for="file">+</label>
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
    </div><!--.signUpBox end-->
    
<%@ include file="/WEB-INF/template/footer.jsp" %>

<script src="js/jquery.js"></script>
<script>
const EXP_EMAIL 		= /^[0-9a-zA-Z\_\-\.]{1,}@[0-9a-zA-Z\_\-]{1,}\.{1}[0-9a-zA-Z\_\-]{1,}\.{0,1}[0-9a-zA-Z\_\-]*$/;
const EXP_PWD_PATTERN1 	= /[a-zA-Z]/;	//영문
const EXP_PWD_PATTERN2	= /[0-9]/;		//숫자
const EXP_PWD_PATTERN3	= /[\{\}\[\]\/\?\.\,\;\:\|\)\*\~\`\!\^\-\_\+\<\>\@\#\$\%\&\\\=\(\'\"]/;	//특수문자

const EXP_HP_PATTERN1	= /[0-9\-]{10,13}$/;

var isAuth	= false;
var businessAuth	= false;

//유효성 검사
function fn_validate(){
	if(!businessAuth || $("#hospital_name").val()=="" || $("#hospital_address").val()=="" || $("#hospital_phoneNum").val()==""){
		alert("사업자등록번호를 확인하여 주시기 바랍니다.");
		return;
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




//가입처리
function fn_join(){
	const email		= $("#emailId").val() + '@' + $("#emailDomain").val();
	var form	= $('#formBox')[0];
	
	var data	= new FormData(form);
	
	$("#btn_signUp_next").prop("disabled", true);
	
	$.ajax({
		url:"/ajax/HospitalCeoJoin.json",
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
				location.href="/main.jsp";
			}else{
				alert("회원가입에 실패 하였습니다.");
			}
		}
	});
}

//사업자번호 확인
$("#btn_business_no").click(function (e) {
	$("#businessErrorMsg").css("display", "none");
	
	businessAuth	= false;
	
	if($("#business_no").val()=="" || $("#business_no").val().length < 10){
		$("#businessErrorMsg").css("display", "block");
		return;
	}
	
	e.preventDefault();
	$("#btn_business_no").prop("disabled", true);
	
	$.ajax({
		url:"/ajax/checkBusiness.json",
		type:"post",
		data:{
			business_no : $("#business_no").val()
		},
		dataType: "json",
		error:function(xhr,error){
			$("#btn_business_no").prop("disabled", false);
			console.log(error);
		},
		success:function(data){
			$("#btn_business_no").prop("disabled", false);
			if(data.result != null){
				$("#hospital_name").val(data.result['NAME']);
				$("#hospital_address").val(data.result['ADDRESS']);
				$("#hospital_phoneNum").val(data.result['PHONE_NUM']);
				
				$("#latitude").val(data.result['LATITUDE']);
				$("#longtitude").val(data.result['LONGTITUDE']);
				
				businessAuth	= true;
			}else{
				$("#businessErrorMsg").css("display", "block");
			}
		}
	});
	
});

//면허번호 인증
$("#btn_license").click(function (e) {
	if($("#licenseNumber").val()==""){
		alert("면허번호를 입력하여 주세요");
		return;
	}
	
	e.preventDefault();
	$("#btn_license").prop("disabled", true);
	
	$.ajax({
		url:"/ajax/checkLicense.json",
		type:"post",
		data:{
			license_num : $("#licenseNumber").val()
		},
		dataType: "json",
		error:function(xhr,error){
			$("#btn_license").prop("disabled", false);
			console.log(error);
		},
		success:function(data){
			$("#btn_license").prop("disabled", false);
			if(data.result != null){
				$("#birthday").val(data.result["BIRTHDAY"]);
				$("#userName").val(data.result["NAME"]);
				
				$("#nameAndDate").text(data.result["NAME"] + "," + data.result["BIRTHDAY"]);
				$("#nameAndDate").css("display", "block");
			}else{
				alert("면허번호가 올바르지 않습니다.");
				return;
			}
		}
	});
	
});

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

$("#file").on("change", function() {
	const file = this.files[0];
	if (/^image\//.test(file.type)) {
		fn_readImage(this);
	} else {
		alert("이미지를 선택해주세요!");
		return;
	}
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


</script>
</body>
</html>