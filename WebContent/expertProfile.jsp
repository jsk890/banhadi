<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.obama.coco.dao.ExpertsDAO"%>
<%@page import="com.obama.coco.vo.Expert"%>
<%@page import="com.obama.coco.dao.SpeciesDAO"%>
<%@page import="com.obama.coco.vo.Species"%>
<%@page import="java.util.List"%>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// Species(종) no, name 리스트
	List<Species> species = SpeciesDAO.selectList();

	// expert selectOne
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	Expert expert = ExpertsDAO.selectOne(no);
	
	//Calendar 객체
	Calendar now = Calendar.getInstance();

	int year = now.get(Calendar.YEAR);
	int month = now.get(Calendar.MONTH)+1;
	int date = now.get(Calendar.DATE);
	
	//경력 
    SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
    
    String nowCalendar = year+"-"+month+"-"+date; 
    Date nowDate = format.parse(nowCalendar); //현재 날짜
    Date startDate = expert.getStartDate();
    
    
//   System.out.println(nowDate);
//    System.out.println(startDate);
    
    // Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
    // 연산결과 -950400000. long type 으로 return 된다.
    long calDate = nowDate.getTime() - startDate.getTime(); 
    
//    System.out.println(calDate);
    
    // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
    // 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
    long calDateMonths = calDate / (24*60*60*1000); 
    long calDateYears = calDateMonths / 365;
//    System.out.println("두 날짜의 날짜 차이: "+calDateYears);


%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>전문가용마이페이지</title>
    
    
	<%@ include file="/WEB-INF/template/link.jsp" %>

	<link rel="stylesheet" href="css/expertprofilemenu.css">
    <link rel="stylesheet" href="css/expertprofile.css">
    
</head>
<body>


<%@ include file="/WEB-INF/template/header.jsp" %>


    <!-- 뱃지 팝업 -->
    <div class="popup_badge_total">
        <div class="badge_list_title">전체 뱃지 목록
            <div class="badge_list_subtitle">뱃지를 획득하여 등급을 높여보세요!</div>
        </div>
        <div class="badge_total_content">
            <ul>
                <li>
                    <div class="badge_detail">
                        <img class="img_popupBadge" src="img/badge/5연속%20출석.png">
                        <span class="badge_description">5일 연속 출석했어요</span>
                    </div>
                </li>
                <li>
                    <div class="badge_detail">
                        <img class="img_popupBadge" src="img/badge/병원예약30.png">
                        <span class="badge_description">병원예약 30번을 해보세요</span>
                    </div>
                </li>
                <li>
                    <div class="badge_detail">
                        <img class="img_popupBadge" src="img/badge/병원리뷰%2010개%20이상.png">
                        <span class="badge_description">병원 리뷰를 10개 이상 달아보세요</span>
                    </div>
                </li>
                <li>
                    <div class="badge_detail">
                        <img class="img_popupBadge" src="img/badge/답변15개등록.png">
                        <span class="badge_description">답변 15개를 등록하세요</span>
                    </div>
                </li>
                <li>
                    <div class="badge_detail">
                        <img class="img_popupBadge" src="img/badge/답변5개%20등록.png">
                        <span class="badge_description">답변 5개를 등록하세요</span>
                    </div>
                </li>
                <li>
                    <div class="badge_detail">
                        <img class="img_popupBadge" src="img/badge/총%2020번%20출석.png">
                        <span class="badge_description">20번 이상 출석 해보세요</span>
                    </div>
                </li>
                <li>
                    <div class="badge_detail">
                        <img class="img_popupBadge" src="img/badge/채택%205개.png">
                        <span class="badge_description">답변 채택을 5개 받아보세요</span>
                    </div>
                </li>
                <li>
                    <div class="badge_detail">
                        <img class="img_popupBadge" src="img/badge/평점%204.5점이상%20(1).png">
                        <span class="badge_description">병원의 평점이 4.5점이 되어야 해요</span>
                    </div>
                </li>
                <li>
                    <div class="badge_detail">
                        <img class="img_popupBadge" src="img/badge/채택10개%20(1).png">
                        <span class="badge_description">상담답변 채택을 10개 받아보세요</span>
                    </div>
                </li>
                <li>
                    <div class="badge_detail">
                        <img class="img_popupBadge" src="img/badge/g병원%20평점%205점.png">
                        <span class="badge_description">병원의 평점이 5점이 되어야 해요!</span>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 팝업 뜰 시 뒷배경 -->
    <div class="popup_badge_total_bg"></div>
    <!-- 전문가 프로필 -->
    <div id="masterProfile">
        <div class="profile">
            <div class="profile_prefaceBox">
                <div class="preface">
                    <h2><a href="javascript:" class="rename_preface">여기를 눌러 한 줄 소개를 수정하세요.</a></h2>
                </div>
            </div><!--  profile_top end  -->
            <div class="profile_detail">
                <img class="img_profile" src="img/doctor.png">
                <div class="profile_grade_info">
                    <div class="grade">
                        <img class="grade_img" src="img/gold.png">
                    </div>
                    <div class="doctor_info">
                        <ul>
                            <li class="profile_name"><span class="job"><%if(expert.getPosition()=='c'|| expert.getPosition()=='d') {%>수의사<%} %><%else if(expert.getPosition()=='t') { %>수의테크니션<%} %></span></li>
                            <li class="period_cal">경력 <%=calDateYears %>년</li>
                            <li class="phone_num"><a href="">010-2356-2378</a></li>
                            <li class="hospital_name"><a href="">관악동물병원</a></li>
                        </ul>
                    </div>
                </div><!--  profile_grade_info end  -->
            </div><!--  profile_left end  -->
            <div class="profile_career">
                <div id="career_header_box">
                    <div class="career_title">경력사항</div>
                    <div class="btn_career_list_plus">추가</div>
                </div>

                <form class="career_input_area" action="" name="" method="get">
                    <fieldset>
                        <select class="select select_start_year">
                            <option>2020</option>
                            <option>2019</option>
                        </select> -
                        <select class="select select_end_year">
                            <option>현재</option>
                            <option>2019</option>
                        </select>
                        <input class="input input_place" placeholder="근무지 또는 직책">
                    </fieldset>
                </form>
                <div class="career_list">
                    <ul>
                    </ul>
                </div>
            </div><!--  profile_career end  -->
        </div><!--  profile end  -->
        <label class="setting_checkbox">
            <div class="profile_setting_mark">&vellip;
                <input type="checkbox">
            </div>

            <div class="profile_setting">
                <div class="popup_setting">
                    <div class="popup_setting_box">
                        <span><a href="">비밀번호 수정</a></span>
                        <span><a href="">회원탈퇴</a></span>
                    </div>
                </div>
            </div>
        </label>
        <div class="badgeBox">
            <div class="badge_total_count">획득 뱃지 7개</div>
            <div class="btn_badge_total"><button class="popup_badge_total_btn">전체보기</button></div>
            <div class="badge_list">
                <ul>
                    <li>
                        <img class="badge_img" src="img/badge/5연속%20출석.png">
                    </li>
                    <li>
                        <img class="badge_img" src="img/badge/병원예약30.png">
                    </li>
                    <li>
                        <img class="badge_img" src="img/badge/병원리뷰%2010개%20이상.png">
                    </li>
                    <li>
                        <img class="badge_img" src="img/badge/답변15개등록.png">
                    </li>
                    <li>
                        <img class="badge_img" src="img/badge/답변5개%20등록.png">
                    </li>
                    <li>
                        <img class="badge_img" src="img/badge/총%2020번%20출석.png">
                    </li>
                    <li>
                        <img class="badge_img" src="img/badge/채택%205개.png">
                    </li>
                </ul>
            </div>
        </div><!--  badge end  -->
    </div><!--    profile end-->

    <div id="wholeContent">
    <div id="masterProfileTap">
        <ul>
            <li id="tap_1" ><a href="">답변(12)</a></li>
            <li id="tap_2" ><a href="">댓글(5)</a></li>
            <li id="tap_3" ><a href="">등급</a></li>
        </ul>
    </div><!--tap end-->
        <hr id="masterProfileTapHr" width="1029px">
        <div id="tapSelection"></div>
    <div id="answerContentWrap" class="tap_1 on">
        <select class="alignType">
             <option value="최신순">최신순</option>
             <option value="좋아요순">좋아요순</option>
             <option value="카테고리별">카테고리별</option>
         </select>

    </div><!--answer_contentWrap end-->
        <div id="replyContentWrap" class="tap_2">
            <select class="alignType">
                <option value="최신순">최신순</option>
                <option value="좋아요순">좋아요순</option>
                <option value="카테고리별">카테고리별</option>
            </select>


        </div><!--replycontentWrap-->

        <div id="levelContentWrap" class="tap_3">
            <div id="achievementList">

            </div><!--achivementLIst end-->
            <div id="levelDetailWrap">
                <div id="medalList">
                    <div class="levelDetail" id="levelTitle">
                        <h2>등급 UP! 챌린지</h2>
                        <h3>등급도 up! 혜택도 UP!</h3>
                        <h3>등급을 올려보세요.</h3>
                    </div>
                    <div class="levelDetail" id="levelDia">
                        <img src="img/dia.png">
                        <dl>
                            <dt>답변수</dt>
                            <dd>40</dd>
                            <dt>답변의 좋아요 수</dt>
                            <dd>100</dd>
                            <dt>채택답변수</dt>
                            <dd>38</dd>
                        </dl>
                    </div>
                    <div class="levelDetail" id="levelGold">
                        <img src="img/gold.png">
                        <dl>
                            <dt>답변수</dt>
                            <dd>40</dd>
                            <dt>답변의 좋아요 수</dt>
                            <dd>100</dd>
                            <dt>채택답변수</dt>
                            <dd>38</dd>
                        </dl>
                    </div>
                    <div class="levelDetail" id="levelSilver">
                        <img src="img/silver.png">
                        <dl>
                            <dt>답변수</dt>
                            <dd>40</dd>
                            <dt>답변의 좋아요 수</dt>
                            <dd>100</dd>
                            <dt>채택답변수</dt>
                            <dd>38</dd>
                        </dl>
                    </div>
                    <div class="levelDetail" id="levelBronze">
                        <img src="img/bronze.png">
                        <dl>
                            <dt>답변수</dt>
                            <dd>40</dd>
                            <dt>답변의 좋아요 수</dt>
                            <dd>100</dd>
                            <dt>채택답변수</dt>
                            <dd>38</dd>
                        </dl>
                    </div>
                </div><!--medalList end-->



            </div><!--levelDetailWrap end-->
            <div id="writeBtn">
                <button>전문가상담 답변 올리러 가기</button>
            </div>
        </div><!--levelContentWrap end-->
    <div id="paginate">
    <ul>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
    </ul>
    </div><!--paginate end-->
    </div><!--underContent end-->



	<%@ include file="/WEB-INF/template/footer.jsp" %>



<script type="text/template" id="myAnswerTmpl">
<@ _.each(myAnswerList,function(myAnswer){@>
    <div class="answerContent">
        <div class="categoryIcon">
            <@if(myAnswer.species==1){@>
            <img src="/img/species/1.png">
            <@}else if(myAnswer.species==2){@>
            <img src="/img/species/2.png">
            <@}else if(myAnswer.species==3){@>
            <img src="/img/species/3.png">
            <@}@>
        </div>
        <div class="list">
            <div class="title">Q. <@=myAnswer.title@></div>
            <div class="Time queTime"><@=myAnswer.queTime@></div>
            <div class="myAnswer"><@=myAnswer.myAnswer@></div>
            <div class="Time ansTime"><@=myAnswer.ansTime@></div>
            <div class="answerList"><a href=""><img src="img/answer.png"><@=myAnswer.answerList@></a></div>
        </div>

    </div>
<@})@>
</script>

<script type="text/template" id="replyContentTmpl">
    <@ _.each(myReplyList,function(myReply){@>
    <div class="replyContent">
        <div class="title">Q. <@=myReply.title@></div>
        <div class="Time queTime" ><@=myReply.queTime@></div>
        <div class="replyIcon"><img src="img/reply.png"></div>
        <div class="myReply"><@=myReply.myReply@></div>
        <div class="Time ansTime" ><@=myReply.ansTIme@></div>
    </div>
    <@})@>
</script>

<script type="text/template" id="levelInformTmpl">


    <div id="achiveNum">
        <h2><@=levelInform.name@> 님의 지식성과</h2>
        <dl>
            <dt>답변 수</dt>
            <dd><span><@=levelInform.answerNum@></span> 건</dd>

            <dt>답변 채택 수</dt>
            <dd><span><@=levelInform.answerSelectedNum@></span> 건</dd>

            <dt>답변 좋아요 수</dt>
            <dd><span><@=levelInform.answerLikeNum@></span> 건</dd>
        </dl>
    </div>
    <div id="achiveResult">

        <dl>
            <dt>답변 채택률</dt>
            <dd><@=levelInform.answerSelectedPer@>%</dd>
        </dl>

    </div>
    <div id="levelResult">
        <@if(levelInform.level==1){@>
        <img src="img/bronze.png">
        <h1>귀하의 등급은 <span>브론즈</span>입니다.</h1>
        <@}else if(levelInform.level==2){@>
        <img src="img/silver.png">
        <h1>귀하의 등급은 <span>실버</span>입니다.</h1>
        <@}else if(levelInform.level==3){@>
        <img src="img/gold.png">
        <h1>귀하의 등급은 <span>골드</span>입니다.</h1>
        <@}else if(levelInform.level==4){@>
        <img src="img/dia.png">
        <h1>귀하의 등급은 <span>다이아</span>입니다.</h1>
        <@}@>


    </div>

</script>

<script type="text/template" id="nextLevelTmpl">
    <div class="nextLevel">
        <h2 class="firstLine"><@=levelInform.name@> 님은</h2>
        <@if(levelInform.level==4){@>

                <h2 class="secondLine">다이아 등급입니다.</h2>
                <h2 class="thirdLine">축하합니다.</h2>

        <@}else{@>
        <h2 class="secondLine"> 아래 활동을 완료하면</h2>
        <h2 class="thirdLine">실버 등급이 달성됩니다.</h2>
        <div class="nextLevelDetail">
            <i class="far fa-comment-dots"></i>
            <div class="condition">
                전문가상담
                답변 수
            </div>
            <div class="conditionNum">
                1건

            </div>
        </div>
        <div id="firstPlus"><i class="fas fa-plus"></i></div>
        <div class="nextLevelDetail">
            <i class="far fa-thumbs-up"></i>
            <div class="condition">
                전문가상담
                답변 좋아요
            </div>
            <div class="conditionNum">

                5건
            </div>
        </div>
        <div id="secondPlus"><i class="fas fa-plus"></i></div>
        <div class="nextLevelDetail">
            <i class="far fa-bookmark"></i>
            <div class="condition">
                전문가상담
                답변채택
            </div>
            <div class="conditionNum">

                2건
            </div>
        </div>
        <div id="lastArrow"><i class="fas fa-angle-double-down"></i></div>

        <div id="acquisition">
            <img src="img/silver.png">
            획득
        </div>
        <@}@>
    </div> <!--nextLevel end-->
</script>

<script type="text/template" id="profileCareerTmpl">
    <li class="career_detailBox">
        <div class="career_detail_mark">
            <div class="circle"><i class="fas fa-circle"></i></div>
            <div class="wave"><i class="far fa-circle"></i></div>
            <div class="wave_second"><i class="far fa-circle"></i></div>
        </div>
        <div class="career_detail">
            <div class="period"><@=startYear@> - <@=endYear@></div>
            <div class="place"><@=placeName@></div>
        </div>
    </li>
</script>
<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script src="js/expertprofile.js"></script>
<script>
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };

    $(document).ready(function(){
        getMyAnswerList();
        getMyReplyList();
        getLevelInform();
    })

    const $answerContentWrap =$("#answerContentWrap")
    const myAnswerTmpl = _.template($("#myAnswerTmpl").html());

    function getMyAnswerList(){
        $.ajax({
            url:"ajax/myAnswerList.json",
            error:function(){
              alert("error")
            },
            success:function(json){
                $answerContentWrap.append(myAnswerTmpl({myAnswerList:json}))
            }

        })

    }//getMyAnswerList end
    
    const $replyContentWrap = $("#replyContentWrap");
    const replyContentTmpl = _.template($("#replyContentTmpl").html());
    function getMyReplyList(){
        $.ajax({
            url:"ajax/myReplyList.json",
            error:function(){
                alert("error")
            },
            success:function(json){
                $replyContentWrap.append(replyContentTmpl({myReplyList:json}))
            }

        })

    }//getMyReplyList end

    const $achievementList =$("#achievementList");
    const levelInformTmpl = _.template($("#levelInformTmpl").html());
    const $levelDetailWrap = $("#levelDetailWrap");
    const nextLevelTmpl = _.template($("#nextLevelTmpl").html());
    function getLevelInform(){

        $.ajax({
            url:"ajax/specialistInform.json",
            error:function(){
                alert("error")
            },
            success:function(json){
                //전문가 번호가 3이면 => json에서 3번째 데이터 불러오기 (변수로바꿔야)
                const $idx = 1;
                const thisSpecialist = json[$idx]
                console.log(thisSpecialist)
                $achievementList.append(levelInformTmpl({levelInform:thisSpecialist}))
                $levelDetailWrap.append(nextLevelTmpl({levelInform:thisSpecialist}))
            }

        })
    }//getLevelInform end

    const $tapSelection = $("#tapSelection");

    $("#masterProfileTap li").on("click", function(e){
        e.preventDefault();

        $(".on").removeClass("on");

        const $tapName = $(this).attr("id");

        if ( $tapName==="tap_1")  {
            $("#answerContentWrap").addClass("on")
            $tapSelection.css({
                left:"13px"
            })

        } else if (  $tapName==="tap_2" ) {
            $("#replyContentWrap").addClass("on")
            $tapSelection.css({
                left:"158px"
            })

        } else {
            $("#levelContentWrap").addClass("on")
            $tapSelection.css({
                left:"288px"
            })
        }

    });




</script>
</body>
</html>