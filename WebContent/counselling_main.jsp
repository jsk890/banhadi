<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>전문가상담메인페이지</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
        <style>

        .wholeWrap {
            position: fixed;
            z-index: 100;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, .75);
            background-repeat: no-repeat;
            background-position: center;
            display: none;
        }

        #myPetList {
            width: 410px;
            height: 160px;
            border: 2px solid #DFF2FF;
            border-radius: 4px;
        }

        #myPetList div {
            width: 120px;
            height: 135px;
            float: left;
            margin: 15px 5px;
        }
        
        #myPetList div:hover {
        	background-color:#DFF2FF;
            cursor: pointer;
        }
        
        .toggle {
        	background-color:#DFF2FF;
    
        }
        

        #myPetList img {
            width: 100px;
            height: 100px;
            border: 2px solid #2699f7;
            border-radius: 50%;
            margin-bottom: 15px;

        }

        .wholeWrap #popup_counsel {
            width: 600px;
            height: 280px;
            background: white;
            position: absolute;
            left: 50%;
            margin-left: -300px;
            top: 300px;
            text-align: center;
            padding-top: 5px;
            border-radius: 4px;
        }

        .wholeWrap #popup_counsel h2 {
            margin-top: 3px;
            font-size: 24px;
        }

        #popup_counsel #btn_close {
            position: absolute;
            right: 3px;
            top: 0;
            background: white;
            border: none;
            font-size: 23px;
            cursor: pointer;


        }

        #myPetListWrap {
            width: 410px;
            height: 208px;
            margin: 30px auto;
            position: relative;

        }

        #btn_question button {
            width: 410px;
            height: 37px;
            color: white;
            font-size: 15px;
            background: #2699f7;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            position: absolute;
            bottom: 0;
            left: 0;
        }

        :focus {
            outline: none;
        }


        #header #counselHome {
            position: absolute;
            left: 90px;
            bottom: 16px;
            font-size: 30px;

        }

        #banner {
            width: 1000px;
            height: 150px;
            background: #658CEA;
            margin: auto;
            margin-top: 10px;
            border-radius: 4px;

        }

        #bannerLogo {
            width: 110px;
            height: 110px;
            position: relative;
            left: 50px;
            top: 20px;
        }

        #bannerIntro {
            position: relative;
            left: 200px;
            top: -70px;
        }

        #banner h2 {
            font-size: 24px;
            color: #fff;
        }

        #banner h1 {
            font-size: 38px;
            margin-left: 5px;
            margin-top: 5px;
            font-weight: 600;
            color: #fff;

        }

        #banner #answer, #question {
            height: 46px;
            width: 160px;
            position: relative;
        }

        #banner #question {
            left: 680px;
            top: -150px;
        }

        #banner #answer {
            left: 610px;
            top: -104px;
        }

        #questionBtn {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: #DFF2FF;
            position: absolute;
            text-align: center;
            box-shadow: 0 0 0 3px rgba(223, 242, 255, 0.5), 0 0 0 6px rgba(223, 242, 255, 0.5);
            right: 500px;
            z-index: 10;
        }

        #questionBtn a {
            text-decoration: none;

        }

        #questionBtn div {
            margin-top: 5px;
            font-size: 14px;
            color: #424242;
        }

        #questionBtn .fas {
            font-size: 50px;
            color: black;
        }

        #searchWrap {

            width: 560px;
            height: 41px;
            margin: auto;
            margin-top: 60px;
            z-index: -100;

        }

        #category {

            width: 130px;
            height: 41px;
            float: left;

        }

        #category select {
            width: 120px;
            height: 41px;
            border: 2px solid #2699f7;
            border-radius: 20px;
            margin-left: 20px;
            background: white;
            padding-left: 20px;

        }

        #category select:focus {
            outline: none;
        }


        #searchInput {
            height: 37px;
            width: 388px;
            border: 2px solid #2699f7;
            border-radius: 20px;
            position: absolute;
            left: 0;
            padding-left: 20px


        }

        #searchInput:focus {
            outline: none;
        }

        #searchWindow {
            position: relative;
            width: 388px;
            height: 43px;
            left: 180px;


        }

        #searchWindow button {
            background: white;
            border: none;
            position: absolute;
            right: 0;
            top: 6px;
            cursor: pointer;
            float: left;


        }

        #searchWindow .fas {
            color: #2699f7;
            font-size: 25px;
        }

        #questionListWrap {
            width: 732px;
            height: 450px;
            margin: auto;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        .titleWrap {
            margin-bottom: 20px;
        }

        .mark {
            width: 8px;
            height: 38px;
            background: #2699f7;
            display: inline-block;
            position: relative;
            top: 12px;
            left: 7px;
            margin-right: 15px;

        }

        #questionListWrap span {
            font-size: 24px;
            margin-top: -5px;
        }

        #questionList {
            width: 732px;
            height: 350px;
            position: relative;
        }

        #questionList div {
            width: 232px;
            height: 108px;
            border: 2px solid #CCCCCC;
            position: relative;
            float: left;
            margin-left: 7px;
            margin-top: 10px;
            border-radius: 4px;
        }

        #questionList div:hover {
            background: #DFF2FF;
            cursor:pointer;
        }

        #questionList img {
            width: 35px;
            height: 30px;
            position: absolute;
            left: 8px;
            top: 70px;
        }

        #questionList .titleQ {
            font-size: 16pt;
            color: #2699f7;
            font-weight: 500;
            margin-left: 11px;
        }

        #questionList .answerNum {
            font-size: 13px;
            position: absolute;
            top: 80px;
            left: 150px;
        }

        #questionList .likeNum {
            font-size: 13px;
            position: absolute;
            top: 80px;
            left: 190px;

        }

        #questionList .questionContent {
            font-size: 13pt;
            width: 192px;
            height: 75px;
            position: absolute;
            left: 32px;
            top: 1px;
            border: none;
        }

        #animalCategoryWrap {
            width: 732px;
            margin: auto;
            margin-top: 30px;
        }

        #animalCategoryWrap span {
            font-size: 24px;
            margin-top: -5px;
        }

        #animalList {
            width: 732px;
            height: 250px;
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
        
        #animalList div {
        	cursor:pointer;
        }

        #searchInput::placeholder {
            text-align: center;
        }

		/*
        #hotDoctorWrap {
            width: 732px;
            margin: auto;
            margin-top: 30px;
        }

        #hotDoctorWrap span {
            font-size: 24px;
        }

        #hotDoctorWrap #doctorList {
            width: 732px;
            height: 660px;
            background: pink;
        } */
        
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/template/header.jsp" %>
    <div class="wholeWrap">
        <div id="popup_counsel">
            <h2>어떤 동물이 궁금하세요?</h2>
            <button id="btn_close">
                <i class="fas fa-times"></i>
            </button>
            <div id="myPetListWrap">
                <div id="myPetList">
                    <div class="mypet"><img src="img/dog.png"> <span class="name">치즈 </span></div>
                    <div class="mypet"><img src="img/cat.png"> <span class="name">커리</span></div>
                    <div class="mypet"><img src="img/cat.png"> <span class="name">커리22</span></div>
                </div><!--myPetList end-->
                <div id="btn_question">
                    <button>질문하기</button>
                </div>
            </div><!--mypetList Wrap end-->
        </div>
    </div><!--wholeWrap end-->
    <div id="banner">
        <img id="bannerLogo" src="img/img_footerlogo.png">
        <div id="bannerIntro">
            <h2>반하디만의</h2>
            <h1>전문가상담</h1>
        </div>
        <img id="question" src="img/question.png">
        <img id="answer" src="img/banneranswer.png">
    </div><!--banner end-->

    <div id="questionBtn">
        <a href="">
            <i class="fas fa-feather-alt"></i>
            <div>상담하기</div>
        </a>
    </div><!--questionBtn end-->
    <div id="searchWrap">
        <form id="category" class="rounded" method="get" action="/questionList.jsp?">
        <!-- 김정석 00:03 name속성값 speciesNo로 변경 -->
            <select form="category" name="speciesNo">
            <!-- 김정석 00:03 value값 숫자로 변경 -->
                <option value="1">강아지</option>
                <option value="2">고양이</option>
                <option value="3">포유류</option>
                <option value="4">파충류</option>
                <option value="5">조류</option>
                <option value="6">갑각류</option>
                <option value="7">어류</option>
                <option value="8">양서류</option>
                <option value="9">그 외 동물</option>
            </select>
        </form><!--category end-->
        <!-- 김정석 23:55 form 속성, name속성, type속성 추가 -->
        <div id="searchWindow">
            <input form="category" name="search" id="searchInput" class="searchRounded" placeholder="반하디 지식검색">
            <button form="category" type="submit" ><i class="fas fa-search"></i></button>
        </div>
        
    </div><!--searchWrap end-->
    <div id="questionListWrap">
        <div class="titleWrap">
            <div class="mark"></div>
            <span> 유용한 질문</span>
        </div><!--title wrap end-->

        <div id="questionList">


        </div>

    </div><!--questionListWrap-->
    <div id="animalCategoryWrap">
        <div class="titleWrap">
            <div class="mark"></div>
            <span> 다양한 동물에 대한 질문을 찾아보세요!</span>
        </div><!--title wrap end-->

        <div id="animalList">
        <!-- 김정석 23:12 data요소 각각 추가 -->
        	<div id="dog" data-species-no="1">강아지</div>
            <div id="cat" data-species-no="2" >고양이</div>
            <div id="rabbit" data-species-no="3" >포유류</div>
            <div id="turtle" data-species-no="4" >파충류</div>
            <div id="bird" data-species-no="5" >조류</div>
            <div id="shrimp" data-species-no="6" >갑각류</div>
            <div id="fish" data-species-no="7" >어류</div>
            <div id="frog" data-species-no="8" >양서류</div>
            <div id="etc" data-species-no="9" >그 외 동물</div>
        </div>
    </div><!--animalCategoryWrap-->

    <!--<div id="hotDoctorWrap">
        <div class="titleWrap">
            <div class="mark"></div>
            <span>Hot Doctor</span>
        </div>//title wrap end
        <div id="doctorList">
            hotdoctor 목록
        </div>
    </div> -->
    
    <%@ include file="/WEB-INF/template/footer.jsp" %>

<script type="text/template" id="usefulQuestionTmpl">
    <@ _.each(usefulQuestionList,function(usefulQuestion){@>
    <div><span class="titleQ">Q.</span><div class="questionContent"><@=usefulQuestion.title@></div>
        <@if(usefulQuestion.speciesNo==1){@>
        <img src="img/species/1.png">
        <@}else if(usefulQuestion.speciesNo==2){@>
        <img src="img/species/2.png">
        <@}else if(usefulQuestion.speciesNo==3){@>
        <img src="img/species/3.png">
        <@}else if(usefulQuestion.speciesNo==4){@>
        <img src="img/species/4.png">
        <@}else if(usefulQuestion.speciesNo==5){@>
        <img src="img/species/5.png">
        <@}else if(usefulQuestion.speciesNo==6){@>
        <img src="img/species/6.png">
        <@}else if(usefulQuestion.speciesNo==7){@>
        <img src="img/species/7.png">
        <@}else if(usefulQuestion.speciesNo==8){@>
        <img src="img/species/8.png">
        <@}else if(usefulQuestion.speciesNo==9){@>
        <img src="img/species/9.png">
        <@}@>
        <span class="answerNum"><i class="far fa-file-alt"></i><@=usefulQuestion.views@></span><span class="likeNum"><i class="far fa-thumbs-up"></i><@=usefulQuestion.questionLike@></span></div>
    <@})@>
</script>
<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>

	//$( document ).ready( function() {
	    $( '#myPetList div' ).click( function() {
	    	
	    	if($(this).hasClass('toggle')){
	    		$(this).removeClass('toggle');
	    	}else {
	    		$( '#myPetList div' ).removeClass( 'toggle' );
	    		$( this ).addClass( 'toggle' );
	    	}
	    	
	    	//$( this ).addClass( 'toggle' );
	    	//$( this ).removeClass( 'toggle' );
	    	
	    } );



    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };

    $(document).ready(function(){
    	getQuestionTopRank();

    })

    const $questionList = $("#questionList");
   



    const $animalList = $("#animalList")

    const $animal = $animalList.children("div")
    $animal.mouseenter(function () {
        let $animal = $(this);
        let $animalName = $(this).attr("id")
        $animal.css({
            fontSize: "0",
            backgroundImage: "url('img/" + $animalName + ".png')",
            backgroundSize: "120px 100px",
            backgroundRepeat: "no-repeat",
            backgroundPosition: "7px 5px",
            backgroundColor: "#DFF2FF"
        });

    });//mouseenter end
    
    //김정석 23:40 종 버튼 클릭 시 페이지이동 추가
    $animal.click(function goQuestionList(){
    	let speciesNo = $(this).data("speciesNo");
    	location.href="/questionList.jsp?speciesNo="+speciesNo;
    });


    $animal.mouseleave(function () {
        $animal.css({
            fontSize: "13pt",
            backgroundImage: "none",
            backgroundColor: "white"
        })


    });//mouseleave end


    $("#questionBtn").on('click', function (e) {
        e.preventDefault();
        $(".wholeWrap").show();
        $("#popup_counsel").show();
    })

    $("#btn_close").on('click', function () {
        $(".wholeWrap").hide();
        $("#popup_counsel").hide();
    })
    
    /* const usefulQuestionTmpl = _.template($("#usefulQuestionTmpl").html());
    function getUsefulQuestionList(){
        $.ajax({
            url:"ajax/usefulQuestionList.json",
            error:function(){
                alert("error")
            },
            success:function(json){
                $questionList.append(usefulQuestionTmpl({usefulQuestionList:json}));
                console.log(json)
            }
        })*/
    
        

const usefulQuestionTmpl = _.template($("#usefulQuestionTmpl").html()) ;
const div = $("#questionList")
function getQuestionTopRank() {
        $.ajax({
        	url:"/ajax/QuestionRankTop.json",
        	dataType:"json",
        	type:"get",
        	error :function(){
        		alert("서비스 점검중...")
        	},
        	success :function(json){
        		
        		console.log(json)
        		div.append(usefulQuestionTmpl({usefulQuestionList:json}));
        		
        	}
        })
        }
        
</script>
</body>
</html>