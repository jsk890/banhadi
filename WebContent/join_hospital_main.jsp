<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>병원관계자 회원가입</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <style>

        #content h2 {
            margin : 100px;
            font-size:40px;
            font-weight:bold;
            text-align:center;
        }


        #joinBox {
            width: 950px;
            margin: auto;
            border :1px solid #5e5e5e;
            padding: 20px;
            text-align:center;
        }

        .join {
            width:310px;
            height:320px;
            display: inline-block;
            color:black;
            text-align:center;
            border: 1px solid #5e5e5e;
            line-height:30px;
        }


        .joinTitle {
            font-size:30px;
            font-weight:bold;
        }

        .joinIcon {
            font-size:100px;
            color:black;
            margin-top: 70px;
            margin-bottom: 20px;
        }

        .join:hover {
            background-color: #2699f7;
            cursor: pointer;
        }

        .join a {
            text-decoration:none;
            color:#000;
        }

        .join:hover a ,.join:hover .joinIcon{
            color:#fff;
        }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
    <h2>회원가입</h2>
    <div id="joinBox">
        <div id="hospitalOwner" class="join">
            <a href="join_agreement.jsp?type=c">
                <div class="joinIcon"><i class="fas fa-hospital"></i></div>
                <div class="joinTitle">병원장</div>
                <div class="joinContents">동물병원 사업자등록증을 보유한 회원</div>
            </a>
        </div>
        <div id="hospitalDoctor" class="join">
            <a href="join_agreement.jsp?type=d">
                <div class="joinIcon"><i class="fas fa-stethoscope"></i></div>
                <div class="joinTitle">수의사</div>
                <div class="joinContents">수의사 면허번호를 보유한 회원</div>
                </a>
        </div>
        <div id="hospitalTechnician" class="join">
            <a href="join_agreement.jsp?type=t">
                <div class="joinIcon fas fa-syringe"></div>
                <div class="joinTitle">수의테크니션</div>
                <div class="joinContents">수의테크니션 자격을 보유한 회원</div>
            </a>
        </div>
        </div>
    </div>
<%@ include file="/WEB-INF/template/footer.jsp" %>

</body>
</html>