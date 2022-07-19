<%@page import="com.obama.coco.dao.UsersDAO"%>
<%@page import="com.obama.coco.vo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//유저 출력
	List<User> users = UsersDAO.selectList();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    

	<%@ include file="/WEB-INF/template/link.jsp" %>
    
    
    <link rel="stylesheet" href="/css/searchPassword.css"/>

</head>
<body>


    <%@ include file="/WEB-INF/template/header.jsp" %>
  

        <div class="popup_find_password_content">
                <p>귀하의 이메일로 임시 비밀번호를 발송 하였습니다.</p>
                <p>임시 비밀번호로 로그인하신 이후 정보를 변경해 주세요.</p>
               
                
				<a href="/main.jsp">로그인</a>
        </div>
        
        <div class="popup_find_password_confirm_bg"></div>






        <form id="formBox"  name="findPasswordForm">
            <div id="background"></div>
            <fieldset>
                <div>
                    <div class="titleArea">
                        <h2 class="title">비밀번호 찾기</h2>
                    </div>
                    <div class="tagArea">
  	
                        <label>이메일 <input type="text" name="emailId" class="inputArea emailId"></label>
                        <input type="text" name="domain" class="inputArea email">
                        
                        <span id="emailAtSign">@</span>             
                        <select class="inputArea selectedEmail">
                            <option value='1'>직접입력</option>
                            <option value='naver.com'>naver.com</option>
                            <option value='gmail.com'>gmail.com</option>
                            <option value='nate.com'>nate.com</option>
                            <option value='hanmail.net'>hanmail.net</option>
                            <option value='lycos.co.kr'>lycos.co.kr</option>
                            <option value='hotmail.com'>hotmail.com</option>
                            <option value='yahoo.com'>yahoo.com</option>
                        </select>	
                    </div>
                    <div class="tagArea">
                        <label>이름 <input type="text" name="name" class="inputArea name" placeholder="이름"></label>
                    </div>
                    <div>
            			<button class="btn_findPassword" type="submit">비밀번호 찾기</button>
        			</div>			
                </div>
            </fieldset>
        </form>
        
        
   
    
    
    <%@ include file="/WEB-INF/template/footer.jsp" %>
    
    


<script src="js/jquery.js"></script>
<script>


const btnPasswordPopup = $(".btn_findPassword");
const bgPopup = $(".popup_find_password_confirm_bg");
const popupContent = $(".popup_find_password_content");


$("#formBox").submit(function(e) {
	e.preventDefault();
	
	
	//e.preventDefault();
    bgPopup.addClass("on");
    popupContent.addClass("on");
    $("html").css({
        overflow:"hidden"
    });
    $("#content,#header").css({
        paddingRight:"17px"
    });
    $(".aux").css({
        left:"-8px"
    });
    
  //비밀번호 찾기 버튼을 눌러도 창이 새로고침 되지 않게 ajax (2021.02.02 13:42 김기현)
    $.ajax({
    	url:'/ajax/sendPassword.json', //서블릿 연결
    	type:'post', //post타입
    	data: {
    		emailId : emailId,
    		domain : domain,
    		name : name
    	},
    	success: function(json) {
    		alert(json);
    	},
    	error: function() {
    		alert("error!!");
    	}
    });
});//#formBox submit() end


//이메일 select 선택 했을 때 (2021.01.23 16:33 김기현)
$('.selectedEmail').change(function() {
    $(".selectedEmail option:selected").each(function () {
        if($(this).val()== '1'){ //직접입력일 경우
            $(".email").val(''); //값 초기화
            $(".email").attr("readonly",false); //활성화
        } else{ //직접입력이 아닐경우
            $(".email").val($(this).text()); //선택값 입력
            $(".email").attr("readonly",true); //비활성화
        }
    });
});//.selectedEmail change() end


// 비밀번호 찾기 버튼을 클릭했을때
btnPasswordPopup.click(function (e) {
	
    
});//#btn_career_list_plus click()

bgPopup.click(function (){
    bgPopup.removeClass("on");
    popupContent.removeClass("on");
    $("html").css({
        overflow:"visible"
    });
    
})
    
    
    

</script>
</body>
</html>