<%@page import="com.obama.coco.vo.ExpertAnswer"%>
<%@page import="com.obama.coco.dao.ExpertAnswersDAO"%>
<%@page import="com.obama.coco.dao.RepliesDAO"%>
<%@page import="com.obama.coco.vo.Reply"%>
<%@page import="java.util.List"%>
<%@page import="com.obama.coco.util.PaginateUtil"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.obama.coco.dao.SpeciesDAO"%>
<%@page import="com.obama.coco.vo.Species"%>
<%@page import="com.obama.coco.vo.Question"%>
<%@page import="com.obama.coco.dao.QuestionsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//유저 로그인 세션을 얻어옴
	//User loginUser = (User)session.getAttribute("loginUser");

	//Question selectOne
	String noStr = request.getParameter("questionNo");
	int questionNo = Integer.parseInt(noStr);
	Question question = QuestionsDAO.selectOne(questionNo);
	
	//ExpertAnswer selectAnswerList()
	List<ExpertAnswer> expertAnswers = ExpertAnswersDAO.selectAnswerList(questionNo);
	
	//Replies selectList
	/* List<Reply> replies = RepliesDAO.selectList(questionNo); */
	
/* 	//replies pagenate처리
	String pageNoStr = request.getParameter("page");
	
	int pageNo = 1; //기본값을 1로
	try {
		pageNo = Integer.parseInt(pageNoStr);
	}catch(Exception e) {
	}//try~catch end
	//한 페이지당 보여질 게시물 수
	int numPage = 5;
	
	PageVO pageVO = new PageVO(pageNo,numPage,questionNo); //PageVO 객체 생성
	
	List<Reply> replies = RepliesDAO.selectPageList(pageVO);
	System.out.println(replies);
			
	
	/* System.out.println(total);
			
	int numBlock = 3;
	String url = "/counsellingAnswercompleted.jsp";
	String param = "questionNo="+questionNo+"&page=";
			
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param); */

	
	
    //expertAnswer total	
    int AnswerTotal = ExpertAnswersDAO.selectTotal(questionNo);
	System.out.println(AnswerTotal);
	
	int total = RepliesDAO.selectTotal(questionNo);
%>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>전문가답변완료</title>
    
    <%@ include file="/WEB-INF/template/link.jsp" %>
    
    <link rel="stylesheet" href="css/paginate.css"/>
    <link rel="stylesheet" href="css/counsellingAnswercompleted.css"/>
</head>
<body>

	<%@ include file="/WEB-INF/template/header.jsp" %>

	
    <div id="banner">
        <div id="bannerIcon">
            <img id="<%=question.getSpeciesEngName() %>WhiteIcon" class="bannerIcon on" src="/img/<%=question.getSpeciesEngName() %>_white.png"/>
        </div>
        <div id="bannerText">
            <h2 id="dog" class="bannerAnimalName on"><%=question.getSpeciesName() %></h2>
            <h3>질문을 모아모아!</h3>
        </div>
        <img id="bannerImg" src="/img/banneranswer.png"/>
    </div> <!--배너 end-->

    


    <!-- 신고 관련 배너) 아직 구현하지 않음 : JS에서 팝업 뜨지않게 주석처리 해둠 -->
    <div id="reportPopup" class="popup">
        <div id="reportPopupBox">
            <div id="reportPopupTitle">신고하기</div>
            <div id="reportQuestion">
                <div class="reportQuestion"><span class="reportTitle">작성자 </span><span class="reportContent">대소변 못가리는 강아지 교육 방법은?</span></div>
                <div class="reportQuestion"><span class="reportTitle">내용 </span><span class="reportContent">대소변 제대로 못가리는 강아지...</span></div>
            </div>
            <ul>
                <li>나체 이미지이거나 음란한 내용을 담고 있습니다. <div><i class="fas fa-chevron-right"></i></div></li>
                <li>부적절한 상품을 팔거나 홍보하고 있습니다.<div><i class="fas fa-chevron-right"></i></div></li>
                <li>자해나 자살과 관련된 내용입니다.<div><i class="fas fa-chevron-right"></i></div></li>
                <li>저작권, 명예훼손 등 기타 권리를 침해하는 내용입니다.<div><i class="fas fa-chevron-right"></i></div></li>
                <li>특정인의 개인정보가 포함되어 있습니다.<div><i class="fas fa-chevron-right"></i></div></li>
                <li>혐오를 조장하는 내용입니다.<div><i class="fas fa-chevron-right"></i></div></li>
                <li>스팸입니다.<div><i class="fas fa-chevron-right"></i></div></li>
            </ul>
            <div id="reportBtn"> 신고하기 </div>
        </div>
    </div>





    <!-- 채택 관련 팝업 -->
    <div id="selectPopup" class="popup">
        <div id="selectNotice">
            <div id="selectNoticeBox">
                <span>채택하시겠습니까?<br/> 채택 후에는 변경하실 수 없습니다.</span>
                <div class="btnBox">
                    <div class="no">취소</div>
                    <div class="yes">확인</div>
                </div>
            </div>
        </div>
    </div>







    <div id="contentBox">
        <div id="qHead">
            <div id="qHeadBox">
                <div class="qPetInfo"><a href="/"></a></div>
                <div id="qTitle">
                    <span id="qLetter">Q.</span>
                    <h5><%=question.getTitle() %></h5>
                </div>
                <div id="qWriterInfo">
                    <div class="qWriterId"><img src="/img/membership_<%=question.getMembership() %>.png"><span><%=question.getUserName() %></span></div>
                    <span class="qWriteDate"><%=question.getRegdate() %></span>
                    <span class="qWriteViews"><%=question.getViews() %></span>
                </div>
            </div>
        </div><!--  //#qHead end -->
        <div id="qContents">
            <p><%=question.getContent() %></p>
        </div><!--  //#qContents end -->
        <div class="qBotBtnBox">
            <div class="usefulBtn qBotBtn"><i class="far fa-thumbs-up"></i> <%=question.getQuestionLike() %></div>
            <div class="commentBtn"> <i class="far fa-comment-dots"></i> <%=total %></div>
        </div><!--  //#qBotBtn end -->





		<!-- replies box -->
        <div class="commentBox">
            <div class="commentSubmitBox">
                <div class="commentInputBox">
                    <div class="commentInput">
                    	<%--if() { --%> <%--로그인 한 유저의 정보를 가져와서 standard에 넣어준다. --%>
                        <div class="membership"><img src="img/membership_standard.png"></div>
                        <input class="comment" type="text" name="comment" class="inputArea" placeholder="댓글을 입력해주세요." onfocus="this.placeholder=''"
                                               onblur="this.placeholder='댓글을 입력해주세요.'"/>
                    	<%--} --%>
                    </div>
                </div><!--inputBox end-->
                <div class="commentSubmitBtn">등록</div>
            </div><!-- commentSubmitBox end -->
            
            
            
            <%-- 댓글 나오는 박스 --%>
            <div class="commentContentsBox">
            
            </div>
            
            
            
        </div><!--  //#commentBox end -->
    </div><!--  //#contentBox end -->
    
    
    <%--if(loginUser.getType() == 'e') { --%>
    <a href="/expertAnswer.jsp?questionNo=<%=questionNo%>"> <button id="questionBtn">답변하기</button> </a>
    <%--} --%>
    
    <a href=""> <div id="counsellingQList"><i class="far fa-file-alt"></i> 질문 목록</div> </a>



	
    <div id="counsellingAList">총 <%=AnswerTotal %>개의 답변이 있습니다. </div>
    
    <div id="counsellingAListBox">
    
    <%for(ExpertAnswer expertAnswer : expertAnswers) { %>
    <div class="contentAnswerBox gold">
    
        <div class="aHead">
            <div class="aHeadBox">
                <div class="goldlevelIcon"></div>
                <div class="aTitle" >
                    <span class="aLetter">A.</span>
                    <div class="drInfo">
                        <span class="drId"><%=expertAnswer.getUserName() %> <%if(expertAnswer.getPosition()=='d'||expertAnswer.getPosition()=='c') { %>수의사<%} else if(expertAnswer.getPosition()=='t'){%>수의테크니션<%} %></span>
                        <span class="drHospitalName"><%=expertAnswer.getHospitalName() %></span>
                        <span class="drDate"><%=expertAnswer.getRegdate() %></span>

                        <div class="selection">
                            <div class="selectBtn">
                                <i class="far fa-check-circle"></i>채택하기
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div><!--  //#aHead end -->
        <div class="refSubjects">
            <div class="refSubjectsTitle">추천진료과</div>
            <div class="refSubjectsName"><%=expertAnswer.getMedicalName() %></div>
        </div><!--  //#refSubjects end -->
        <div class="aContents">
            <p><%=expertAnswer.getContents() %></p>
        </div><!--  //#aContents end -->
        <div class="aBotBtnBox">
            <div class="usefulBtn aBotBtn">유용해요 <%=expertAnswer.getLikeCnt() %></div>
            <div class="reportBtn aBotBtn">신고</div>
        </div><!--  //#qBotBtn end -->
        
    </div> <!--  //#contentAnswerBox gold end -->
	<%} %>
    
    </div><!--  //#contentAListBox end -->

	<%@ include file="/WEB-INF/template/footer.jsp" %>
	
<script src="js/underscore-min.js"></script>
<script src="js/jquery.js"></script>
<script type="text/template" id="repliesTemplate">
<@ _.each(replies, function(reply){@>
<ul>        
	<li class="commentReadBox">
	<div class="membership"><img src="/img/membership_<@=reply.membership@>.png"></div>
	<div class="comment">
		<div class="commentWriterId"><@=reply.userName @></div>
		<div class="commentWriteDate"><@=reply.regdate @></div>
		<div class="commentEditBox">
			<button class="btn_updateReply btn_reply">수정</button>
			<button class="btn_removeReply btn_reply">삭제</button>
		</div>
		</div>
	<div class="comment_content">
		<span><@=reply.contents @></span>
	</div>
	</li>
</ul>
<@}); @>
<@=paginate@>

</script>
<script>


_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

	const repliesTemplate = _.template($("#repliesTemplate").html());
	const $commentContentsList = $(".commentContentsBox");
	

	let pageNo = 1;

	
	function getQuestionReplies() {
	    $.ajax({
	       //연결할 서블릿
	        url: "/ajax/getQuestionReplies.json",
	         //넘겨주는 방식
	        type:"get",
	        //넘겨주는 데이터 형식
	     dataType:"json",
	     //배열 및 리스트로 넘기는 값이 있을때 선언
	        //traditional : true,
	     //서블릿으로 넘겨줄 값 data:{서블릿에서 사용할 변수명 : 서블릿으로 넘길 데이터 값}
	     data:{
	        questionNo : <%=questionNo %>,
	        pageNo : pageNo,
	        numPage : 5
	        },
	        error: function () {
	            alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
	        },
	        success: function (json) {
	        	
	        	console.log(json);
	           
	        	const html = repliesTemplate(json);
	           
	        	$commentContentsList.html(html);

	        }
	    });
	}//getQuestionReplies end

	getQuestionReplies();
	
	//페이징처리
	$(document).on("click",".paginate a",function(e){
		e.preventDefault();
	});

	
    //댓글 버튼 클릭 시 밑 댓글 박스 display none, block
    $(".commentBtn").on("click", function () {
        $(".commentContentsBox").toggleClass("on");
    });//replyBtn click() end
	
	
    //신고 관련 팝업
    const $reportPopup = $("#reportPopup");
    const $reportBtn = $(".reportBtn");

    $reportBtn.on("click",function () {
        // $reportPopup.fadeIn();
        alert("점검 중 입니다.");
    });//.reportBtn click() end

    $reportPopup.on("click",function () {
        // $reportPopup.fadeOut();
    });//#popup click() end

    
  //채택 관련 팝업
    const $selectPopup = $("#selectPopup");
    const $selectBtn = $(".selectBtn");
    const $SelectNoticeYesBtn = $("#selectNoticeBox .yes");


    $selectBtn.on("click",function () {
        $selectPopup.fadeIn();
        let $selectionBox = $(this).parent();
        $SelectNoticeYesBtn.on("click", function () {
            //채택하기가 질문자채택으로 요소 변경된다.
            $selectionBox.replaceWith("<div class=\"userSelection\">\n" +
                "                            <div class=\"selectLabel\">\n" +
                "                                <span class=\"userSelectWord\">질문자채택</span>\n" +
                "                            </div>\n" +
                "                        </div>");
        });//yesBtn click() end
    });//.selectBtn click() end

    $selectPopup.on("click",function () {
        $selectPopup.fadeOut();
    });//#popup click() end



</script>
</body>
</html>