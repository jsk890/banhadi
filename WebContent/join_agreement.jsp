<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   String type = request.getParameter("type");
   System.out.print(type);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>반하디 | 회원가입 약관동의</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <style>
        #container {
            width: 600px;
            margin: auto;
            /*background-color: red;*/
        }

        #contentSignUp h2 {
            font-size: 30px;
            text-align: center;
            margin-top: 80px;
            margin-bottom: 60px;
        }

        /*모두 선택 전체 박스*/
        .signUpCheckAll {
            height: 32px;
            /*background-color: blue;*/
        }
        
        /*모두 선택 체크박스*/
        #checkAll {
            background-color: red;
        }
        
        /*모두 선택 체크박스 텍스트 설명*/
        .checkAllText {
            /*background-color: lime;*/
            display: inline-block;
            /*height: 45px;*/
            /*width: 500px;*/
            /*text-align: left;*/
            margin-left: 10px;
            font-size: 16px;
        }
        
        /*signupBox*/
        .termsBox {
            margin-top: 10px;
        }

        .inputCheck {
            line-height: 60px;
        }
        
        /*bx 다른 이름으로*/
        .signUpBox {
            overflow-y: scroll;
            height: 100px;
            border-style: solid;
            border-width: 2px;
            padding: 5px;
            word-break: break-all;
        }

        .article {

        }
        /*약관 제목 위에 붙는 설명*/
        .policySummaryText {
            font-weight: 400;
            font-size: 14px;
        }
        /*약관 제목*/
        .articleTitle {
            line-height: 30px;
            font-weight: 500;
            font-size: 15px;
        }
        /*약관 내용*/
        .articleText {
            font-weight: 200;
            font-size: 14px;
        }

        /*유효성검사 체크*/
        .agreeMsg {
            /*display: none;*/
            line-height: 50px;
            color: red;
            font-size: 14px;
        }

        .btn_area {
            height: 120px;
            margin-top: 20px;
            /*margin-bottom: 100px;*/
        }
        .btn_type{
            border: 1px solid #2699f7;
            width: 200px;
            height: 40px;
            outline:none;
        }
        /*취소 버튼*/
        #btn_cancel{
            color: #424242;
        }
        /*확인 버튼*/
        #btn_agree{
            color: #2699f7;
            position: relative;
            right: -200px;
        }
        
        .btn_type:hover {
        	cursor:pointer;
        }
        
        
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/template/header.jsp" %>
<!-- container -->
<div id="container">
    <!-- contentSignUp -->
    <div id="contentSignUp"> <!--content를 앞으로-->
        <div class="contentSignUp">
            <h2>회원가입</h2>
       
       
        <form id="signUpForm" method="get" action=<%if(type.equals("c")) {%>
        											"/join_hospital_ceo.jsp"
        											<%} else if (type.equals("d")) {%>
        											"/join_hospital_doctor.jsp"
        											<%} else if (type.equals("t")) {%>
        											"/join_hospital_technician.jsp"
        											<%} else if (type.equals("n")) {%>
        											"/join_user.jsp"
        											<%}%>>
                <!-- 약관동의 -->
                <div class="signUp">
                    <p class="signUpCheckAll">
                        <input type="checkbox" id="checkAll" name="checkAll">
                        <label for="checkAll">
                            <span class="checkAllText">
                                반하디 이용약관, 개인정보수집 및 동의, 위치정보 이용약관에 모두 동의합니다.
                            </span>
                        </label>
                    </p>
                    <ul class="signUpBoxList">
                        <li class="termsBox">
                            <span class="inputCheck">
                                <input type="checkbox" id="signUpService" name="signUpService" class="check checkNecessary">
                                <label for="signUpService">
                                    반하디 이용약관 동의 (필수)
                                </label>
                            </span>
                            <div class="signUpBox" tabindex="0" id="divService">
                                <div class="article">
                                    <h3 class="articleTitle">여러분을 환영합니다.</h3>
                                    <p class="articleText">
                                        반하디 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 반하디 서비스의 이용과
                                        관련하여 반하디 서비스를 제공하는 반하디 주식회사(이하 ‘반하디’)와 이를 이용하는 반하디 서비스 회원(이하 ‘회원’)
                                        또는 비회원과의 관계를 설명하며, 아울러 여러분의 반하디 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                                    </p>
                                </div> <!-- article -->
                            </div> <!-- signup_bx -->
                        </li>
                        <li class="termsBox">
                            <span class="inputCheck">
                                <input type="checkbox" id="signupPrivacy" name="signupPrivacy" class="check checkNecessary">
                                <label for="signupPrivacy">
                                    개인정보 수집 및 이용 동의 (필수)
                                </label>
                            </span>
                            <div class="signUpBox" tabindex="0" id="divPrivacy">
                                <div class="article">
                                    <!-- 개인정보 수집 및 이용에 대한 안내 -->
                                    <div class="policySummary">
                                    <p class="policySummaryText">
                                        개인정보보호법에 따라 반하디에 회원가입 신청하시는 분께 수집하는 개인정보의 항목,
                                        개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의
                                        거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
                                    </p>
                                    </div>
                                    <h3 class="articleTitle">1. 수집하는 개인정보</h3>
                                    <p class="articleText">
                                        이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 반하디 서비스를
                                        회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이
                                        개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 반하디는 서비스 이용을
                                        위해 필요한 최소한의 개인정보를 수집합니다.
                                    </p>
                                </div> <!-- article -->
                            </div> <!-- divPrivacy -->
                        </li>
                        <li class="termsBox">
                            <span class="inputCheck">
                                <input type="checkbox" id="signUpLocation" name="signUpLocation" class="check" >
                                <label for="signUpLocation">
                                    위치정보 이용약관 동의 (선택)
                                </label>
                            </span>
                            <div class="signUpBox" tabindex="0" id="divLocation">
                                <div class="article">
                                    <!-- 위치정보 이용약관 동의 -->
                                    <div class="policySummary">
                                        <p class="policySummaryText">
                                            위치정보 이용약관에 동의하시면
                                            <strong>위치를 활용한 광고 정보 수신</strong>
                                            등을 포함하는 반하디 위치기반 서비스를 이용할 수 있습니다.
                                        </p>
                                    </div>
                                    <h3 class="articleTitle">제 1 조 (목적)</h3>
                                    <p class="articleText">
                                        이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치정보사업
                                        또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리,
                                        의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
                                    </p>
                                </div> <!-- article -->
                            </div> <!-- divLocation -->
                        </li>
                    </ul>
                    <p id="errorMsg" class="agreeMsg" style=""></p>
                </div>
                <!-- //약관동의 -->
                <div class="btn_area double">
                    <button id="btn_cancel" class="btn_type btn_default" type="button">취소</button>
                    <button id="btn_agree" class="btn_type btn_primary">확인</button>
                </div>
            </form>
        </div><!-- signup_content -->
    </div><!-- signup_content -->
</div><!-- //container -->
    <%@ include file="/WEB-INF/template/footer.jsp" %>
</body>
<script src="js/jquery.js"></script>
<script>


    //모두 체크하기
    $("#checkAll").on("click",function () {

        if($("#checkAll").prop('checked')) {
            $(".check").prop('checked',true);
        } else {
            $(".check").prop('checked',false);
        }//if~else end

    });//checkAll 클릭 시 전체선택 및 해제
    
    $(".check").on("click",function () {

        if($("input:checkbox[id='checkAll']").is(":checked") == true) {
            $("#checkAll").prop('checked',false);
        } else {
            
        }//if~else end

    });//선택사항 클릭 시 checkAll해제
	
	const $errorMsg = $("#errorMsg");
	
    //필수체크 안할 시 유효성 검사
    $("#btn_agree").on("click",function () {
    	const errorMsg = $errorMsg.val();
    	
    	if($('.checkNecessary:checked').length == $('.checkNecessary').length) {
    		//alert('모두다선택!!');
    		  
   		} else {
    		 //alert('필수 약관에 동의해주시기 바랍니다');
    		 $errorMsg.addClass("ok").text("반하디 이용약관과 개인정보 수집 및 이용약관에 대한 안내에 동의해주세요.");
    		 return false;
    		  
   		}//if~else end

    });//btnAgree  

	
</script>
</html>