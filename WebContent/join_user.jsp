<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>    
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <style>
        #formBox{
            position: relative;
            width: 600px;
            height: auto;
            margin: auto;
            margin-top: 100px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        #background{
            position: absolute;
            width: 600px;
            height: 600px;
            background-image: url("img/img_logo.png");
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
            position: relative;
            width: 130px;
            height: 60px;
            left: 70px;
            margin: 20px 0 ;
        }
        
        #phoneNm{
         	position: relative;
            width: 130px;
            height: 60px;
            left: 70px;
            margin-bottom:0;
          
        }
                
        #phoneNmConfirm{
         	position: relative;
            width: 130px;
            height: 60px;
            left: 70px;
            margin-top:0;
        }
        
        .atSign {
            position: relative;
            left: 180px;
            top: 2px;
            text-align:center;
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
        #btn_signUp{
            position: relative;
            left: 50%;
            width: 150px;
            height: 30px;
            margin-left: -75px;
            border: 1px solid #2699F7;
            background-color: #fff;
            color: #2699F7;
            margin-bottom: 25px;
        }
        #btn_signUp:hover{
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
        .certification{
            left: 360px;
            width: 100px;
            height: 34px;
            color: #888;
            font-weight: bold;
        }
        
        .msg {
        	position: absolute;
            top:35px;
            left: 120px;
            width: 500px;
            height: 20px;
			color: #D32F2F;
			font-size:13px;
			font-weight: 200;
		}
		
		.msg.ok {
			color: #14BAB6;
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
        <div class="popup_find_password_confirm_bg"></div>

        <form id="formBox" action="" name="" method="get" onsubmit="return false;">
            <div id="background"></div>
            <fieldset>
                    <div class="titleArea">
                        <h1 class="title">가입정보입력</h1>
                        <h2 class="subtitle">반하디의 서비스를 이용해 보세요!</h2>
                    </div>
                    <div class="tagArea">
                        <label>이메일 <input type="text" id="emailId" name="emailId" class="inputArea emailId"></label>
                        <span class="atSign"> @ </span>
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
 						<div class="msg email" id="emailMsg"></div>
                    </div> 
                    <div class="tagArea">
                        <label>비밀번호 <input type="password" id="password1" name="password1" class="inputArea" placeholder="영문/숫자/특수문자 조합 8~15자리"></label>
<!--                         <div class="msg password" id="password_msg">※ 비밀번호는 영문/숫자/특수문자 조합 8~15자리여야 합니다 </div> -->
                        <div class="msg password" id="password_msg"></div>
                    </div>
                    <div class="tagArea">
                        <label>비밀번호 확인 <input type="password" id="passwordConfirm" name="passwordConfirm" class="inputArea" placeholder="비밀번호 확인"></label>
                    	<!-- <div class="msg passwordConfirm" id="passwordConfirm_msg">※ 비밀번호가 다르네요</div> -->
                    	<div class="msg passwordConfirm" id="passwordConfirm_msg"></div>
                    </div>
                    <div class="tagArea">
                        <label>이름 <input type="text" id="userName" name="userName" class="inputArea name" placeholder="이름"></label>
                    	<!-- <div class="msg name">※ 이름을 확인해주세요</div> -->
                    	<div class="msg name" id="msg_name"></div>
                    </div>
                    <div class="tagArea">
                        <label>생년월일 <input type="text" id="birthday" name="birthday" class="inputArea" placeholder="MM-DD-YYYY 예)12-02-1960"></label>
                        <!-- <div class="msg birthDate">※ 생년월일을 확인해주세요</div> -->
                        <div class="msg birthDate" id="msg_birthDate"></div>
                    </div>
                    <div id="phoneNm" class="tagArea">
                        <label>휴대폰번호 <input type="text" id="hpNo" name="hpNo" class="inputArea phoneNum" placeholder="숫자만 입력"></label>
                        <select class="inputArea carrier" id="sel_hp">
                            <option>SKT</option>
                            <option>KT</option>
                            <option>LGU+</option>
                            <option>SKT 알뜰폰</option>
                            <option>KT 알뜰폰</option>
                            <option>LGU+ 알뜰폰</option>
                        </select>
                        <button class="inputArea certification" id="btn_send_authNo">인증번호 발송</button>
                    </div>
                    <div id="phoneNmConfirm" class="tagArea">
                        <label><input type="text" id="auth_number" name="auth_number" class="inputArea" placeholder="인증번호 입력"></label>
                        <button class="inputArea certification" id="btn_auth">인증하기</button>
                        <!-- <div class="msg phoneNum">※ 휴대폰 번호를 인증해주세요</div> -->
                        <div class="msg phoneNum" id="msg_phoneNum"></div>
<!--                        <a href="">법인 회선 또는 알뜰폰을 이용하시나요?</a>-->
                    </div>
                    <div>
                        <button id="btn_signUp">가입하기</button>
                    </div>
            </fieldset>
        </form>
    <%@ include file="/WEB-INF/template/footer.jsp" %>

<script src="js/jquery.js"></script>
<script type="text/javascript">
const EXP_EMAIL 	= /^[0-9a-zA-Z\_\-\.]{1,}@[0-9a-zA-Z\_\-]{1,}\.{1}[0-9a-zA-Z\_\-]{1,}\.{0,1}[0-9a-zA-Z\_\-]*$/;
const EXP_PWD_PATTERN1 	= /[a-zA-Z]/;	//영문
const EXP_PWD_PATTERN2	= /[0-9]/;		//숫자
const EXP_PWD_PATTERN3	= /[\{\}\[\]\/\?\.\,\;\:\|\)\*\~\`\!\^\-\_\+\<\>\@\#\$\%\&\\\=\(\'\"]/;	//특수문자

const EXP_BIRTH_PATTERN1	= /[0-9\-]*$/;
const EXP_HP_PATTERN1		= /[0-9\-]{10,13}$/;

//인증번호 더미데이터
const hp_auth_number	=  "1234";
//인증여부
var isAuth	= false;


$("#btn_signUp").click(function(e){
	//가입하기 전 validation체크
	if(!fn_validate()){
		alert("※가입 정보를 모두 입력해주세요");
		return;
	}
		
	e.preventDefault();
	
	fn_email_check();
});


//인증번호 발송
$("#btn_send_authNo").on("click", function(){
	isAuth	= false;	//인증여부 초기화
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
	$("#hpNo").attr("disabled", true);
	$("#btn_send_authNo").attr("disabled", true);
	alert("인증번호가 전송 되었습니다.");
});

//인증번호 인증하기
$("#btn_auth").on("click", function(){
	//인증번호 더미데이터 비교
	if($("#auth_number").val() != hp_auth_number){
		$("#msg_phoneNum").text("※ 인증번호가 일치하지 않습니다.");
		return;
	}else{
		$("#msg_phoneNum").text("");
	}
	//인증여부 변경
	isAuth	= true;
	$("#auth_number").attr("disabled", true);
	$("#btn_auth").attr("disabled", true);
	alert("인증되었습니다.");
});

//유효성 검사
function fn_validate(){
	const email		= $("#emailId").val() + '@' + $("#emailDomain").val();

	if(!EXP_EMAIL.test(email)){
		$("#emailId").focus();
		$("#emailMsg").removeClass("ok").text("이메일 형식을 다시 확인해주세요.");
		return false;
	}else{
		$("#emailMsg").addClass("ok").text("사용 가능한 이메일입니다.");
	}
	
	if(!EXP_PWD_PATTERN1.test($("#password1").val()) || !EXP_PWD_PATTERN2.test($("#password1").val()) || !EXP_PWD_PATTERN3.test($("#password1").val()) || ($("#password1").val().length < 6 || $("#password1").val().length > 12) || $("#password1").val()==""){
		$("#password1").focus();
		$("#password_msg").text("비밀번호는 영문/숫자/특수문자 조합 6~12자리여야 합니다");
		return false;
	}else{
		$("#password_msg").text("사용 가능한 비밀번호 입니다.");
	}
	 
	if($("#password1").val() != $("#passwordConfirm").val()){
		$("#passwordConfirm_msg").focus();
		$("#passwordConfirm_msg").text("비밀번호가 일치하지 않습니다.");
		return false;
	}else{
		$("#passwordConfirm_msg").text("비밀번호가 일치합니다.");
	}
	
	if($("#userName").val()==""){
		$("#msg_name").text("필수 정보입니다.");
		return false;
	}else{
		$("#msg_name").text("");	
	}
	
	if($("#birthday").val()=="" || !EXP_BIRTH_PATTERN1.test($("#birthday").val())){
		$("#msg_birthDate").text("생년월일을 다시 확인해주세요");
		return false;
	}else{
		var val	= $("#birthday").val().replace(/[\-]/g,'');
		
		if(val.length!=8){
			$("#msg_birthDate").text("생년월일을 다시 확인해주세요");
			return false;
		}
		
		var yyyy	= val.substring(4);
		var mm		= val.substring(0,2);
		if(mm.startsWith("0"))
			mm		= mm.substring(1);
		var dd		= val.substring(2,4);
		if(dd.startsWith("0"))
			dd		= dd.substring(1);

		if("/1/3/5/7/8/10/12/".indexOf("/"+mm+"/")>=0 && parseInt(dd)>31){
			$("#msg_birthDate").text("※ 생년월일을 확인해주세요");
			return false;
		}else if("/4/6/9/11/".indexOf("/"+mm+"/")>=0 && parseInt(dd)>30){
			$("#msg_birthDate").text("※ 생년월일을 확인해주세요");
			return false;
		}else if(parseInt(mm)==2){
			if( ((parseInt(yyyy) % 4 == 0) && (parseInt(yyyy) % 100 != 0))|| (parseInt(yyyy) % 400 == 0) ){
				if(parseInt(dd)>29){
					$("#msg_birthDate").text("※ 생년월일을 확인해주세요");
					return false;
				}
			}else{
				if(parseInt(dd)>28){
					$("#msg_birthDate").text("※ 생년월일을 확인해주세요");
					return false;
				}
			}
		}else if("/1/2/3/4/5/6/7/8/9/10/11/12/".indexOf("/"+mm+"/")<0){
			$("#msg_birthDate").text("※ 생년월일을 확인해주세요");
			return false;
		}
		
		$("#msg_birthDate").text("");
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
	 
	if(!isAuth ||($("#auth_number").val() != hp_auth_number)){
		$("#msg_phoneNum").text("※ 휴대폰 번호를 인증해주세요");
		return false;
	}else{
		$("#msg_phoneNum").text("");
	}
	
	return true;
}

//이메일 체크
function fn_email_check(){
	$("#emailMsg").text("검사중...");
	const email		= $("#emailId").val() + '@' + $("#emailDomain").val();
	
	$.ajax({
		url:"/ajax/checkEmail.json", //
		type:"post", //방식
		data:{
			email : email
		},
		dataType: "json", //응답의 자료형 (json, xml, html등 가능)
		error:function(xhr,error){
			console.log(error);
		},
		success:function(data){
			if(data.result){
				$("#emailMsg").removeClass("ok").text("※ 이미 사용중이거나 탈퇴한 이메일입니다");
			}else {
				fn_join();
				
			}//if~else end
			
		}//success하면 json을 실행
	});//ajax end
}

//회원정보 저장
function fn_join(){
	$("#btn_signUp").prop("disabled", true);
	
	//type: n:일반, e:전문가
	$.ajax({
		url:"/ajax/userJoin.json",
		type:"post",
		data:{
			email : $("#emailId").val() + '@' + $("#emailDomain").val()
			,password : $("#password1").val()
			,name : $("#userName").val()
			,birthday : $("#birthday").val()
			,phone : $("#hpNo").val()
			,type : "n"
		},
		dataType: "json",
		error:function(xhr,error){
			$("#btn_signUp").prop("disabled", false);
			console.log(error);
		},
		success:function(data){
			$("#btn_signUp").prop("disabled", false);
			if(data.result){
				alert("회원가입이 완료 되었습니다.");
				location.href="/main.jsp";
			}else{
				alert("회원가입에 실패 하였습니다.");
			}
		}
	});
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