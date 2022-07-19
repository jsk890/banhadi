<%@page import="com.obama.coco.dao.ExpertsDAO"%>
<%@page import="com.obama.coco.vo.Expert"%>
<%@page import="com.obama.coco.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	User loginUser = (User)session.getAttribute("loginUser");
    
    if(loginUser!=null){
    
   
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
 <%@ include file="/WEB-INF/template/link.jsp" %>
    
    <style>
     
        #wrap {
            position: relative;
            margin: auto;
            text-align: center;
            width: 1100px;
        }
        #mainHeader {
            background-size: 100%;
            background-repeat: no-repeat;
            height: 460px;
            background-image: url("/img/main.jpg");
            background-position: 0 -275px;
        }


        #header li{
            display: inline-block;
            line-height: 60px;
        }
        #mainHeader_right {
            position: absolute;
            right: 0;
            margin-right: 25px;
            margin-top: 22px;
        }
        #mainHeader_left {
            width: 35px;
            position: absolute;
            left: 0;
            margin-left: 25px;
            margin-top: 10px;
        }
        #mainHeader h1 img{
            width: 35px;
            height: 40px;
        }
        #mainHeader a {

            text-decoration: none;
            font-size: 16px;
            margin: 10px;

            color: #000;
            font-weight: 500;
        }


        #main_container {
            margin:  -30px auto 0px auto;

            background-color: rgba(0, 0, 0, 0.40);
            height: 60px;
            width: 540px;
            border-radius: 50px;
        }

        #main_container li{
            float: left;
        }
        #main_container li a:hover{
        	transform : scale(1.2);
        	color : #DFF2FF;
        }
        #main_container a{
            display: inline-block;
            text-decoration: none;
            font-size: 22px;
            width: 180px;
            text-align: center;
            height: 60px;
            line-height: 60px;
            color: #fff;
            font-weight: 700;
        }
        #content{
            height: 300px;
        }
    
        #animalList {
            width: 732px;
            height: 250px;
            margin :auto;
            margin-top: 150px;

        }

        #animalList div {
            width: 136px;
            height: 110px;
            border: 2px solid #CCCCCC;
            position: relative;
            float: left;
            margin-left: 6px;
            margin-top: 10px;
            border-radius: 4px;
            line-height: 100px;
            text-align: center;
        }
        #animalList a {
        	color :black;
        	text-decoration:none;
        	width : 140px;
        	height: 114px;
        	display :block;
        }
    </style>
</head>
<body>
    <div id="wrap">

        <div id="mainHeader">
            <div id="header_background">


                <div id="mainHeader_left">
                    <h1><a href=""><img src="/img/img_logo.png"></a><p class="screen_out">반하디</p></h1>
                </div><!--  nav_left end  -->

                <div id="mainHeader_right">
                <%if (loginUser == null) { %>
             	<a href="/login.jsp">로그인</a>
  
                <%}else {  %>
                  	<a href=""><i class="im im-user-circle"></i></a>
                <%} %>
                   
                </div><!--  nav_right end  -->
            </div><!--  header_background end  -->


        </div><!--  header end  -->
        <div id="main_container">
            <ul>
               <%if (loginUser == null) { %>
                <li><a href="/counselling_main.jsp">전문가상담</a></li>
                <li><a href="/diagnosisList.jsp">병원예약</a></li>
                <li><a href="">마이펫</a></li>
  
                <%}else {  %>
                	<%if(loginUser.getType() == 'e') {
                	Expert expert = ExpertsDAO.getExpert(loginUser.getNo());
                    int hospitalNo = expert.getHospitalNo();     %>
                		   <li><a href="/counselling_main.jsp">전문가상담</a></li>
                			<li><a href="/reservationHome.jsp?no=<%=hospitalNo%>&userNo=<%=loginUser.getNo()%>">예약관리</a></li>
                			<li><a href="">병원관리</a></li>
         
                	<%}else{    %>
                		   <li><a href="/counselling_main.jsp">전문가상담</a></li>
                			<li><a href="/diagnosisList.jsp">병원예약</a></li>
                			<li><a href="/myPetHome.jsp?userNo=<%=loginUser.getNo()%>">마이펫</a></li>

                	<%} %>
                <%} %>
            </ul>
        </div><!--  main_container end  -->
        <div id="content">
            <div id="animalList">
                <div id="dog" data-no="1"><a href="/questionList.jsp?speciesNo=1">강아지</a></div>
                <div id="cat" data-no="2"><a href="/questionList.jsp?speciesNo=2">고양이</a></div>
                <div id="rabbit" data-no="3"><a href="/questionList.jsp?speciesNo=3">포유류</a></div>
                <div id="turtle" data-no="4"><a href="/questionList.jsp?speciesNo=4">파충류</a></div>
                <div id="bird" data-no="5"><a href="/questionList.jsp?speciesNo=5">조류</a></div>
                <div id="shrimp" data-no="6"><a href="/questionList.jsp?speciesNo=6">갑각류</a></div>
                <div id="fish" data-no="7"><a href="/questionList.jsp?speciesNo=7">어류</a></div>
                <div id="frog" data-no="8"><a href="/questionList.jsp?speciesNo=8">양서류</a></div>
                <div id="etc" data-no="9"><a href="/questionList.jsp?speciesNo=9">그 외 동물</a></div>
            </div>

<%@ include file="/WEB-INF/template/footer.jsp" %>
<script src="js/jquery.js"></script>
<script>

    const $animalList = $("#animalList")

    const $animal = $animalList.children("div")
    $animal.mouseenter(function () {
        let $animal = $(this);
        let speciesNo = $(this).data("no")
        $animal.css({
            fontSize: "0",
            backgroundImage: "url('img/species/" + speciesNo + ".png')",
            backgroundSize: "120px 100px",
            backgroundRepeat: "no-repeat",
            backgroundPosition: "7px 5px",
            backgroundColor: "#DFF2FF"


        });

    });//mouseenter end


    $animal.mouseleave(function () {
        $animal.css({
            fontSize: "13pt",
            backgroundImage: "none",
            backgroundColor: "white"
        })


    });//mouseleave end

</script>
</body>
</html>