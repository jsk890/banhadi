<%@page import="com.obama.coco.dao.MyPetsDAO"%>
<%@page import="com.obama.coco.vo.MyPet"%>
<%@page import="com.obama.coco.dao.SpeciesDAO"%>
<%@page import="com.obama.coco.vo.Species"%>
<%@page import="java.util.List"%>
<%@page import="com.obama.coco.dao.QuestionsDAO"%>
<%@page import="com.obama.coco.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	String userNo = request.getParameter("userNo");
	userNo = "13";
	
	List<Species> speciesList = SpeciesDAO.selectSpecies();



	//파라미터로 넘어간 값을 받아온다
	String search = request.getParameter("search");
	String species = request.getParameter("speciesNo");
	
	String period = request.getParameter("period");
	String type = request.getParameter("type");
	String filter = request.getParameter("filter");
	String rownum = request.getParameter("rownum");
	if(search==null){search="";}
	if(period==null){period="999999";}
	if(type==null){type="t";}
	if(filter==null){filter="questionLike";}
	if(rownum==null){rownum="4";}
	Question question = new Question("%"+search+"%", Integer.valueOf(species), period,type);
	int searchCount = QuestionsDAO.selectQuestionCount(question);

	

%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>전문가상담검색</title>

    <%@ include file="/WEB-INF/template/link.jsp"%>
    <link rel="stylesheet" href="css/questionlist.css"/>

</head>
<body>
    <%@ include file="/WEB-INF/template/header.jsp"%>

<div id="content">
    <div class="wholeWrap">
        <div id="popup_counsel">
            <h2>어떤 동물이 궁금하세요?</h2>
            <button id="btn_close">
                <i class="fas fa-times"></i>
            </button>
            <div id="myPetListWrap">
                <div id="myPetList">
	                <ul>
	                </ul>
                </div><!--myPetList end-->
                <div id="btn_question">
                    <button>질문하기</button>
                </div>
            </div><!--mypetList Wrap end-->
        </div>
    </div><!--wholeWrap end-->
    <div id="questionSubmit"><i class="fas fa-pen-nib"></i><br/><span>질문하기!</span></div>
    <div id="banner">
    	<!-- 배너 동물이미지 -->
        <div id="bannerIcon">
        	<ul>
			</ul>
        </div>
        <!-- 배너 글자 -->
        <div id="bannerText">
        	<ul>
            </ul>
            
            <h3>질문을 모아모아!</h3>
        </div>
        <a href=""><img id="bannerImg" src="img/banneranswer.png"/></a>
    </div> <!--배너 end-->

    <div id="bannerAnimalSelect" class="animalIconBox">
        <div id="animalIconBox">
            <ul>
                <li id="dogIcon" data-species=1><img class="bannerIcon on" src="img/species/1.png"/><br/>강아지</li>
                <li id="catIcon" data-species=2><img class="bannerIcon" src="img/species/2.png"/><br/>고양이</li>
                <li id="rabbitIcon" data-species=3><img class="bannerIcon" src="img/species/3.png"/><br/>포유류</li>
                <li id="frogIcon" data-species=4><img class="bannerIcon" src="img/species/4.png"/><br/>파충류</li>
                <li id="shrimpIcon" data-species=5><img class="bannerIcon" src="img/species/5.png"/><br/>조류</li>
                <li id="birdIcon" data-species=6><img class="bannerIcon" src="img/species/6.png"/><br/>갑각류</li>
                <li id="turtleIcon" data-species=7><img class="bannerIcon" src="img/species/7.png"/><br/>어류</li>
                <li id="fishIcon" data-species=8><img class="bannerIcon" src="img/species/8.png"/><br/>양서류</li>
            </ul>
        </div>
    </div> <!--배너에서 동물 선택 드롭다운 end-->
    <div id="searchBox">
    	<div id="searchBoxText">
		</div>
			<div id="inputBox">
				<form method="get" action="/ajax/questions.json">
					<label class="screen_out">검색명</label>
					<input type="hidden" name="species" value="<%= species %>">
					<input id="input_searchWord" id="searchWord" name="search" class="inputArea" placeholder="단어를 입력해주세요" onfocus="this.placeholder=''"
						onblur="this.placeholder='단어를 입력해주세요'" autocomplete="off"
						value="<%= search%>"/>
					<button><i class="fas fa-search"></i><span class="screen_out">검색</span></button>
				</form>
			</div>
    </div><!--searchBox end-->
    <div id="periodBox">
        <ul>
            <li id="periodTotal" data-select-period="999999" class="period periodOn">전체</li>
            <li id="periodWeek"  data-select-period="7" class="period">지난 1주</li>
            <li id="periodMonth"  data-select-period="30" class="period">지난 1달</li>
            <li id="periodYear"  data-select-period="365" class="period">지난 1년</li>
        </ul>
    </div> <!--periodBox end-->

    <div id="tabBox">
        <ul id="boardTab">
            <li id="completedTap" class="tabOn">답변완료 글</li>
            <li id="waitingTap">기다리는 글</li>
        </ul>
        <ul id="filter">
            <li id="popularity" data-select-filter="questionLike" class="filterOn">인기순</li>
            <li id="latest" data-select-filter="regdate">등록순</li>
        </ul>
        <hr id="boardTapHr">
        <div id="tapSelection"></div>
    </div> <!--tabBox end-->

    <!--답변완료글 탭 내용-->
    <div id="boardCompletedTapContents" class="completedTap boardContents tabOn">
      <ul>
      </ul>
    </div>

    <!--기다리는글 탭 내용-->
    <div id="boardWaitingTapContents" class="waitingTap boardContents">
        <ul>
        </ul>
    </div>

    <div class="btn_view_more">
        <button class="view_more">2개 더 보기</button>
    </div>

</div><!--content end-->

    <%@ include file="/WEB-INF/template/footer.jsp"%>

<!-- 마이펫 팝업 리스트 템플릿 -->
<script type="text/template" id="myPetListTmpl">
	<@ _.each(animalList.petList,function(pet){@>
	<li class="mypet" data-pet-no="<@=pet.no@>">
		<img src="img/<@=pet.picture@>"> <span class="name"><@=pet.name@></span>
	</li>
	<@})@>
</script>

<!-- 배너 이미지 템플릿-->
<script type="text/template" id="bannerIconTmpl">
	<img class="bannerIcon" src="/img/species/<@=list.species[list.selectedSpecies-1].picture@>">
</script>

<!-- 배너 텍스트 템플릿 -->
<script type="text/template" id="bannerTextTmpl">
	<span class="bannerAnimalName"> <@=list.species[list.selectedSpecies-1].name@> </span>
	<span><i class="fas fa-chevron-down"></i></span>
</script>

<!-- 검색박스 템플릿 -->
<script type="text/template" id="searchBoxTextTmpl">
    <@ if(list.search==""||list.search==null){@>
		<p> <span class="sector searchResult"><@=list.species[list.selectedSpecies-1].name@> </span>
		<@ if(list.species[list.selectedSpecies-1].no!=9){ @>
		<span>에 대한 </span></p>
		<@}@>
		<p> <span> 질문을 검색해 보세요! </span></p>
	<@ } else{@>
		<p> 전문가 님들의 답변 중, </p>
		<p>
			"<span id="searchWord" class="searchResult"><@= list.search@></span>"에 대한 질문은
			<span id="searchCount" class="searchResult"><@= list.searchCnt@></span> 건 입니다.
		</p>
	<@ }@>
</script>

<!--질문완료 리스트 템플릿-->
<script type="text/template" id="questionCompletedListTmpl">
    <@ _.each(list.list,function(question){@>
	<li class="boardBox completed">
	<a href="/counsellingAnswercompleted.jsp?questionNo=<@=question.no@>" >
        <div class="labelBox">
            <div class="labelTag">
                <div class="labelTop"></div>
                <div class="labelMid">
                    <div class="labelMidTxt">
                        <i class="far fa-thumbs-up"></i>
                        <p><@=question.usefulCnt@></p>
                    </div>
                </div>
                <div class="labelBot"></div>
            </div>
            <div class="likeDetail">
                <div class="likeDetailBox">
                    <div class="likeDetailSquareBox">질문이 유용해요 + 모든 답변의 좋아요 수의 합</div>
                    <div class="likeDetailTriangle"></div>
                </div>
            </div>
        </div>
        <span class="counsellingTitle"><@=question.title@></span>
        <span class="submitDate"><@=moment(question.regdate).format("YY/MM/DD")@> <@=moment(question.regdate).format("hh:mm")@></span>
        <span class="usefulNm">
                <span>유용해요</span>
                <span><@=question.questionLike@></span>
            </span>
        <span class="answerNm">
                <i class="far fa-file-alt"></i>
                <span><@=question.answerCnt@></span>
        </span>
	</a>
    </li>
    <@})@>
</script>

<!--기다리는 질문 리스트 템플릿-->
<script type="text/template" id="questionWaitingListTmpl">
    <@ _.each(list.list,function(question){@>
    <li class="boardBox wating">
	<a href="/counsellingAnswercompleted.jsp?questionNo=<@=question.no@>" >
        <div class="labelBox">
            <div class="labelTag">
                <div class="labelTop"></div>
                <div class="labelMid">
                    <div class="labelMidQBox">
                        <i class="fas fa-question"></i>
                    </div>
                </div>
                <div class="labelBot"></div>
            </div>
        </div>
        <span class="counsellingTitle"><@=question.title@></span>
        <span class="submitDate"><@=moment(question.regdate).format("YY/MM/DD")@> <@=moment(question.regdate).format("hh:mm")@></span>
        <span class="views"><@=question.views@> 회</span>
	</a>
    </li>
    <@})@>
</script>


<script src="js/moment-with-locales.js"></script>
<script>
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };
    //서블릿으로 넘겨줄 파라미터들
    let searchWord="<%=search%>";
    let type = "<%=type%>";
    let species ="<%=species%>";
    let period = "<%=period%>";
    let filter = "<%=filter%>";
    let rownum = "<%=rownum%>";
    let sector = "강아지";
    
    $("#searchBox .sector").text(sector);
    getQuestionList(searchWord,type,species,period,filter,rownum);
    //완료질문
    const $boardCompletedTapContents = $("#boardCompletedTapContents ul");// 탭
    const questionCompletedListTmpl = _.template($("#questionCompletedListTmpl").html());// 템플릿

    //대기질문
    const $boardWaitingTapContents = $("#boardWaitingTapContents ul");// 탭
    const questionWaitingListTmpl = _.template($("#questionWaitingListTmpl").html());//템플릿
    
    //검색구역
    const $searchBoxText = $("#searchBoxText");
    const searchBoxTextTmpl = _.template($("#searchBoxTextTmpl").html());
    
    //배너아이콘
    const $bannerIcon = $("#bannerIcon ul");
    const bannerIconTmpl = _.template($("#bannerIconTmpl").html());
    
    //배너텍스트
    const $bannerText = $("#bannerText ul");
    const bannerTextTmpl = _.template($("#bannerTextTmpl").html());
    
    //마이펫 리스트
    const $myPetList = $("#myPetList ul");
    const myPetListTmpl = _.template($("#myPetListTmpl").html());
    


    

    const $searchWord = $("#input_searchWord");// 검색창
    const $viewMore = $(".view_more");// 더보기 버튼
    const $questionSubmit = $("#questionSubmit");// 질문하기 버튼
    const $btn_question = $("#btn_question");// 팝업창 질문하기 버튼
    
    const $tapSelection = $("#tapSelection"); // 완료,대기 탭
    const $periodTab = $("#periodBox li");//기간 탭
    const $filterTab = $("#filter li");//인기순, 최신순 탭
    
    const $periodNo = $("#periodNo");//종번호 선택
    const $filterNo = $("#filterNo");//종번호 선택
    const $speciesNo = $("#speciesNo");//종번호 선택
    

    
    $(document).ready(function(){
    	$("#bannerIcon img:nth-child("+<%=species%>+")").addClass("on");
        $("#bannerText h2:nth-child("+<%=species%>+")").addClass("on");
        getQuestionList(searchWord,type,species,period,filter,rownum);
    })

    
    //스크롤 감지
    $(window).scroll(function (event) {
        let scrollBottom = $("body").height() - $(window).height() - $(window).scrollTop();
        $questionSubmit.css("bottom",scrollBottom);
    });

    
  	//더보기 버튼을 눌렀을 때
    $viewMore.click(function (e) {
    	e.preventDefault();
    	rownum -="-2";//스트링이라도 음수끼리는 연산되므로 덧셈 +2가 된다
    	let location = document.querySelector('.view_more').offsetTop;	
    	getQuestionList(searchWord,type,species,period,filter,rownum);
    	window.scrollTo({top:location, behavior:'smooth'});
    })
    
    //새로고침없이 주소창 쿼리스트링 변경
	function resetQueryString(searchWord,type,species,period,filter,rownum){
        let URLSearch = new URLSearchParams(window.location.search);
    	URLSearch.set('search', String(searchWord));
    	URLSearch.set('speciesNo', String(species));
    	URLSearch.set('period', String(period));
    	URLSearch.set('type', String(type));
    	URLSearch.set('filter', String(filter));
    	URLSearch.set('rownum', String(rownum));
    	let newParam = URLSearch.toString();
    	let queryString = location.pathname + '?' + newParam;
    	history.pushState('','',queryString);
  	}
    
    
    //글 리스트
    function getQuestionList(searchWord,type,species,period,filter,rownum){
    	resetQueryString(searchWord,type,species,period,filter,rownum);
    	 
        $.ajax({
        	//연결 시킬 서블릿
            url:"/ajax/questions.json",
            //넘겨주는 방식
            type:"get",
            //넘겨주는 데이터 형식
			dataType:"json",
			//서블릿으로 넘겨줄 데이터
			data:{
				search : searchWord,
				type : type,
				species : species,
				period : period,
				filter : filter,
				rownum : rownum},
            error:function(xhr,error){
                alert(error);
               
            },
            success:function(json){
            	// console.log(json);
            	if($("#completedTap").hasClass("tabOn")){
            		 $boardCompletedTapContents.html(questionCompletedListTmpl({list:json}));
            	}else {
            		 $boardWaitingTapContents.html(questionWaitingListTmpl({list:json}));
            	}
                $searchBoxText.html(searchBoxTextTmpl({list:json}));
                $bannerIcon.html(bannerIconTmpl({list:json}));
                $bannerText.html(bannerTextTmpl({list:json}));
                //$myPetList.html(myPetListTmpl({list:json}));
				
               	if(rownum >= json.searchCnt){
	                $viewMore.css({display:"none"});           		
               	}else{
               		$viewMore.css({display:"block",margin:"auto",marginBottom:"25px"});
               	}
            }
        })
    }
    

    //필터에 따라서 마이펫목록을 불러오는 함수
    function getMypetsList() {
        $.ajax({
            url: "/ajax/getMyPet.json",
            //넘겨주는 방식
            type:"get",
            //넘겨주는 데이터 형식
			dataType:"json",
			//서블릿으로 넘겨줄 데이터
			data:{userNo:"<%=userNo%>"},
            error: function () {
                alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
            },
            success: function (json) {
                $myPetList.html(myPetListTmpl({animalList: json}));
                
            }
    	});
    }//getMypetsList end

    //답변완료 글, 기다리는 글 탭을 눌렀을 때
    $("#boardTab li").click(function (e) {
        e.preventDefault();
        rownum=4;
        $(".tabOn").removeClass("tabOn");
        $(this).toggleClass("tabOn");

        const idx = $(this).index();

        if (idx == 0){
            $('.completedTap').addClass("tabOn");
            $boardCompletedTapContents.empty();
            type="t";
            $tapSelection.css({
                left:"13px"
            });
        }else {
            $('.waitingTap').addClass("tabOn");
            $boardWaitingTapContents.empty();
            type="f";
            $tapSelection.css({
                left: "158px"
            });
        }
        getQuestionList(searchWord,type,species,period,filter,rownum);
    });

    

    //기간 탭을 눌렀을 때
    $periodTab.click(function (e){
    	e.preventDefault();
        $(".periodOn").removeClass("periodOn");
        $(this).toggleClass("periodOn");
        //selectedPeriod = $(this).data("selectperiod");
        $periodNo.val($(this).data("selectPeriod"));
        period = $(this).data("selectPeriod");
        getQuestionList(searchWord,type,species,period,filter,rownum);
    })
    
    // 인기순 등록순 탭을 눌렀을 때
    $filterTab.click(function (e){
    	e.preventDefault();
        $(".filterOn").removeClass("filterOn");
        $(this).toggleClass("filterOn");
        
        $filterNo.val($(this).data("selectFilter"));
        filter = $(this).data("selectFilter");
        getQuestionList(searchWord,type,species,period,filter,rownum);

    })
	
    
   //배너동물을 클릭했을 때
    $("#bannerAnimalSelect li").on("click", function(e){
    	$('#bannerAnimalSelect').toggleClass("open");
    	rownum=4;
    	species = $(this).data("species");
    	searchWord="";
    	sector=$(this).text();
    	getQuestionList(searchWord,type,species,period,filter,rownum);
    });
    
    //배너 텍스트를 눌렀을 때
    $(document).on("click","#bannerText ul .bannerAnimalName", function (e) {
		$('#bannerAnimalSelect').toggleClass("open");
		$("#input_searchWord").val("");
	});
    
    //검색창 검색시  
    $("#inputBox form").on("submit",function(e) {
    	e.preventDefault();
    	searchWord = $("#input_searchWord").val();
    	rownum = 4;
    	getQuestionList(searchWord,type,species,period,filter,rownum);
    });
    
    //질문하기 버튼을 눌렀을 때
    $("#questionSubmit").on('click', function (e) {
        e.preventDefault();
    	//마이펫 리스트 불러오기
        getMypetsList();
        $(".wholeWrap").show();
        $("#popup_counsel").show();
    })

    //팝업창 닫기 버튼을 눌렀을 때
    $("#btn_close").on('click', function () {
        $(".wholeWrap").hide();
        $("#popup_counsel").hide();
    })

    //질문하기 버튼 클릭 시 페이지이동
    $btn_question.click(function goWriteQuestion(){
    	let petNo = $('#myPetList .mypet.toggle').data("petNo");
    	if(petNo!=null)
    	location.href="/받을주소?petNo="+petNo;
    });
    
    //팝업창 동물 클릭시
    $(document).on("click","#myPetList li", function() {
    	
    	if($(this).hasClass('toggle')){
    		$(this).removeClass('toggle');
    	}else {
    		$( '#myPetList li' ).removeClass( 'toggle' );
    		$( this ).addClass( 'toggle' );
    	}
    } );

    

</script>
</body>
</html>