<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String msg = (String)session.getAttribute("msg");


		if(msg!=null ){
			session.removeAttribute("msg");
		}
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인페이지</title>
 <%@ include file="/WEB-INF/template/link.jsp" %>
   
    <link rel="stylesheet" href="css/login.css"/>
</head>
<body>
<div id="content">
    <div id="logoBox">
    <h2><a href=""><img id="logoImg" src="img/img_logo.png"/></a></h2>
    </div>
    <div id="loginBox">
        <div id="loginTextBox">
        	<form method="post" action="/login.coco">
	        	<fieldset>
	        		<legend class="screen_out">로그인 폼</legend>
	        		<label for="email" class="screen_out">아이디</label>
		            <input type="text" name="email" class="inputArea" placeholder="아이디"/><br/>
		            <label for="pwd" class="screen_out">비밀번호</label>
		            <input type="password" name="password" class="inputArea" placeholder="비밀번호"/><br/>
		           	<%if(msg!=null){ %>
		            	<span>가입하지 않은 아이디이거나, 잘못된 비밀번호 입니다.</span>
					<%} %>
		            <button id="loginBtn">로그인</button>
	            </fieldset>
            </form>
            <div id="searchBox">
                <ul id="search">
                    <li id="searchId" class="search"><a href="">아이디 찾기</a></li>
                    <li id="searchPw" class="search"><a href="/searchPassword.jsp">비밀번호 찾기</a></li>
                   <li id="searchJoin" class="search"> <a href="/join_main.jsp">회원가입</a></li>
                </ul>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/template/footer.jsp" %>

<script>
	
</script>
</body>
</html>