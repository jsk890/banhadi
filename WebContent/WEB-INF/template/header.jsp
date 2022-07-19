	<%@page import="com.obama.coco.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
%>
  
<div id="header">
    <div class="aux">
        <div id="logo">
            <h1><a href=""><img src="/img/img_logo.png"></a><p class="screen_out">반하디</p></h1>
        </div><!--  //#logo  -->
        <div id="gnb">
            <ul>
             <%if (loginUser == null) { %>
                <li><a href="">전문가상담</a></li>
                <li><a href="">병원예약</a></li>
                <li><a href="">마이펫</a></li>
                <li><a href="/login.jsp">로그인</a></li>
                <%}else {  %>
                	<%if(loginUser.getType() == 'e') {%>
                		   <li><a href="">전문가상담</a></li>
                			<li><a href="">예약관리</a></li>
                			<li><a href="">병원관리</a></li>
                			<li><a href=""><i class="im im-user-circle"></i></a></li>
                	<%}else{ %>
                		   <li><a href="">전문가상담</a></li>
                			<li><a href="">병원예약</a></li>
                			<li><a href="">마이펫</a></li>
                			<li><a href=""><i class="im im-user-circle"></i></a></li>
                	<%} %>
                <%} %>
            </ul>
        </div><!--  //#gnb  -->
    </div><!--  //.aux   -->
</div><!--  //#header  -->


<div id="content">