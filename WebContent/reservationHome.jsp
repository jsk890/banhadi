<%@page import="com.obama.coco.dao.HospitalsDAO"%>
<%@page import="com.obama.coco.vo.Hospital"%>
<%@page import="java.util.concurrent.ConcurrentHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

String hospitalNoStr = request.getParameter("no");
String userNoStr = request.getParameter("userNo");
int hospitalNo = Integer.parseInt(hospitalNoStr);
int userNo = Integer.parseInt(userNoStr);
String state = "f";
Map<String, Object> map = new ConcurrentHashMap<String, Object>();

map.put("state",state);
map.put("no", hospitalNoStr);

Hospital hospital = HospitalsDAO.selectHospital(map);
String hospitalName = hospital.getName();
int count = hospital.getCount();
%>     

<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
    <link href='/css/main.css' rel='stylesheet'/>
    <link rel="stylesheet" href="/css/iconmonstr-iconic-font.min.css">
    <link rel="stylesheet" href="/css/reservationComplete.css">
    <link rel="stylesheet" href="/css/diagnosisComplete.css">
    <link rel="stylesheet" href="/css/reservationPage.css">
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
 <h2 class="screen_out">예약관리</h2>
    <div id="reservationName">
        <h2><%=hospitalName %></h2>
    </div><!--  //#reservationName  -->
    <div id="reservationTab">
        <ul>
 			<li class="reservationTab" data-state="f">예약요청</li>
            <li class="reservationTab" data-state="t">예약완료</li>
            <li class="reservationTab" data-state="c">진료완료</li>
        </ul>

        <div id="tab_sliderBox">
            <div id="tab_slider"></div>
        </div><!--  //#tab_sliderBox  -->
    </div><!--  //#reservationTab  -->
    <div class="on_box reservationBox">
      		<div id='calendar'></div>
      		
      <div class="finishReservationBox"> 		

         
         
         <div class="finishReservation sharebox"><!--  .popup_reservation  -->
    	</div><!--  //.finishReservation  -->
     
    </div><!--  //.finishReservationBox  -->  
    
    
     
    </div><!--  //.reservationBox  -->
        
       <%@ include file="/WEB-INF/template/popupWriteOpinion.jsp" %>  
       
 
	  <!--    예약 상세보기 팝업-->
    <div class="popup_reservation"><!--  .popup_reservation  -->
        <div class="popup_reservationBox"><!--  .popup_reservationBox  -->

            
        </div><!--  //.popup_reservationBox  -->

    </div><!--  //#popup_reservation  --> 
    
    
   <div class="popup_background"><!--  .popup_background  -->
    </div><!--  //.popup_background  -->  
        
        
        
<%@ include file="/WEB-INF/template/footer.jsp" %>
<%@ include file="/WEB-INF/template/reservationTmpl.jsp" %>
<%@ include file="/WEB-INF/template/reservationDetailPopup.jsp" %>
<%@ include file="/WEB-INF/template/reservationDetailTmpl.jsp" %>
<%@ include file="/WEB-INF/template/opinionTmpl.jsp" %>
<script src="/js/main.js"></script>
<script src='/js/locales-all.js'></script>
<script src="js/moment-with-locales.js"></script>
<script>
//예약리스트출력 스크립트
_.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };

	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	 //강의템플릿
    const $applyTemplate = _.template($("#applyTemplate").html());
    //강의목록(ul)
    const $finishReservationBox = $(".finishReservationBox");
   // const $reservationList = $(".reservationList ul");
	const $calendar = $("#calendar");
   	var state = "<%=state%>";
  
   	function getReservationList(){
		$.ajax({
    		
    		dataType: "json",
    		type:"get",
    		data: {
    			hospitalNo : <%=hospitalNo%>,
    			state : state
    		},
    		url:"/ajax/getReservationList.json",
    		error:function(){
    			alert("error");
    		},
    		success:function(json){
    			$(".reservationList").remove();
    			if(state=='f'){
   				$calendar.css('display','block');
    			$finishReservationBox.css('display','none');
    			$finishReservationBox.before($applyTemplate({reservationList:json}));	
    			}else{
    			$calendar.css('display','none');
    			$finishReservationBox.css('display','block');
    			$finishReservationBox.prepend($applyTemplate({reservationList:json}));
    			$(".sharebox").empty();
    			console.log(json.length)
    			}
    		}
    		
    	});//getHospitalTemplate() end
   	}//getReservationList() end
 	getReservationList();
 	 const $tabSlider = $("#tab_slider");
 	 
    $(document).on('click','.reservationTab',function(){
    	state = $(this).data('state');
    	if(state=='t'){
    		$tabSlider.css('left','144px');
    	}else if(state=='c'){
    		$tabSlider.css('left','285px');
    	}else{
    		$tabSlider.css('left','0');
    	}
    	
    	getReservationList();
 
    })

</script>
<script>
//예약상세보기
const $sharebox=$(".sharebox");
const reservationDetailTmpl = _.template($("#reservationDetailTmpl").html());

function getReservationDetail(){
	$.ajax({
		
		dataType: "json",
		type:"get",
		data: {
			reservationNo : reservationNo
		},
		url:"/ajax/getReservation.json",
		error:function(){
			alert("error");
		},
		success:function(json){
			$sharebox.empty()
					.removeClass("opinionBox")
					.addClass("finishReservation");
					
			$sharebox.append(reservationDetailTmpl({reservation:json}));
			console.log(json);
		}
		
	})//ajax end
	
}//getReservationDetail end

const opinionTmpl = _.template($("#opinionTmpl").html());
function getOpinion(){
	
	$.ajax({
		url:"/ajax/getOpinion.json",
		dataType :"json",
		type : "get",
		data : {
			reservationNo : reservationNo
		},
		error :function(){
			alert("error")
		},
		success:function(json){
			$sharebox.empty()
					.removeClass("finishReservation")
					.addClass("opinionBox");
			console.log(json);
			$(".opinionBox").append(opinionTmpl({opinion:json}));
			
		}
	
		
	})//ajax end
	
}//getOpinion end

const $popup_reservationBox = $(".popup_reservationBox");
const reservationPopupTmpl = _.template($("#reservationPopupTmpl").html()); 

function getReservationDetailPopup(){
	 $popup_background.addClass("popup_on");
    $popup_reservation.addClass("popup_on");
    $(".popup_reservationBox").addClass("popup_on");
    $("html").css("overflow", "hidden");
    $("#content").css("paddingRight", "17px");
    $(".aux").css("left", "-8px");
    
    $.ajax({
    	url:"/ajax/getReservation.json",
    	dataType:"json",
    	type :"get",
    	data :{
    		reservationNo : reservationNo
    	},
    	error:function(){
    		alert("error")
    	},
    	success:function(json){
    		console.log(json)
    		$popup_reservationBox.empty();
    		$popup_reservationBox.append(reservationPopupTmpl({reservation:json}))
    	}
    	
    })//ajax end
}//getReservationDetailPopup end

var reservationNo = 0;
$(document).on('click','.applyItem',function(){
	
	 reservationNo = $(this).data('no');
	 if(state=='c'){
		 getOpinion();
		 
	 }else if(state=='t'){
		 getReservationDetail();
	 }else{
		 getReservationDetailPopup();
	 }
	



})//applyItem Click end


let opinionBtnType = "";


$(document).on('click','.btn_opinion',function(){
	opinionBtnType= $(this).data('btntype');
	  
    $("#diagnosisTxt").val("");
    $("#noticeTxt").val("");
    $("#prescriptionTxt").val("");
	openPopupOpinion();
});

//소견작성버튼 클릭이벤트
$(document).on('click','.opinionBtn',function(){
		
		const diagnosis = $("#diagnosisTxt").val();
		const notice = $("#noticeTxt").val();
		const prescription = $("#prescriptionTxt").val();
	$.ajax({
    		
    		dataType: "json",
    		type:"get",
    		data: {
    			reservationNo : reservationNo,
    			state:state,
    			diagnosis :diagnosis,
    			notice:notice,
    			prescription :prescription,
    			userNo : <%=userNo%>
    		
    		},
    		url:"/ajax/updateOpinion.json",
    		error:function(){
    			alert("error");
    		},
    		success:function(json){
					
    			alert(state);
				
				if(state=="t"){
					getReservationList();
				}else if(state=="c"){
					getOpinion();
				}
				closePopup();
    		}
    		
    	})//ajax end
    	
		
	})//click btn_writeOpinion end

//$(document).on('click','.btn_reject',function(){
//	$("#approvalResult").val("reject");
//	location.href= "reservationApproval.obama";
//})//btn_reject end
//$(document).on('click','.btn_accept',function(){
//	$("#approvalResult").val("accept");
//	location.href= "reservationApproval.obama";
//})//btn_accept end
	


	




//popup 스크립트
    $popup_background = $(".popup_background");
	$popup_writeOpinion = $(".popup_writeOpinion");
    $opinionCloseBtn = $(".popup_writeOpinion i");
    $popup_reservation = $(".popup_reservation");

    
    function openPopupOpinion() {
        $popup_background.addClass("popup_on");
        $popup_writeOpinion.addClass("popup_on");
        $("html").css("overflow", "hidden");
        $("#content").css("paddingRight", "17px");
        $(".aux").css("left", "-8px");
        if(opinionBtnType=='w'){
        	$(".opinionBtn").removeClass("btn_editOpinion").addClass("btn_writeOpinion")
          
        }else{
        	$(".opinionBtn").removeClass("btn_writeOpinion").addClass("btn_editOpinion")
        }//
        
    }
    $popup_background.click(function () {
        closePopup()
    });//$popup_background  click



    $opinionCloseBtn.click(function () {
        closePopup()
    });//$btn_wirteOpinion  click
    //팝업 닫기
    function closePopup() {
        $(".popup_on").removeClass("popup_on")
        $("html").css("overflowY", "scroll");
        $("#content").css("paddingRight", "0px");
        $(".aux").css("left", "0px");
    }//.clossePopup end
    $(document).on('click','.popup_writeOpinion i',function () {
        closePopup();
    });//$btn_reject  click
    $(document).on('click','.popup_reservation i',function () {
        closePopup();
    });//$btn_reject  click
    const hospitalNo = <%=hospitalNo %>;
    
    
    $(document).on('click','.btn_modifiedOpinion',function () {
    	opinionBtnType= $(this).data('btntype');
    	
         
         const $diagnosis =$("#diagnosis").text();
         const $notice =$("#notice").text();
         const $prescription =$("#prescription").text();
   
         openPopupOpinion();
      
         $("#diagnosisTxt").val($diagnosis);
         $("#noticeTxt").val($notice);
         $("#prescriptionTxt").val($prescription);
 
         //$("#reservationNo").val(reservationNo);
         //$("#hospitalNo").val(hospitalNo);
         //$("#state").val(state);
         
       
    });//#modifybtn  click

 

   
   $(document).on('click','.btn_openReservation',function () {
	   getReservationDetailPopup();
       
   });//click .btn_openReservation end
   

   
   
   
</script>
<script>
//calendar 작동 template
$(document).ready(function(){
if(state=='f'){
	getCalendar();
}else{
	$("#calendar").css('display','none');
}	

	
})//document ready

function getCalendar(){
	
	
		const calendarEl = document.getElementById('calendar');
		const today = new Date();
		const calendar = new FullCalendar.Calendar(calendarEl, {
		    headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		    },
		    initialDate: today,
		    navLinks: true, // can click day/week names to navigate views
		    editable: true,
		    selectable: true,
		    locale: "ko",
	
		    },
		    getReservationInformation()
		);

		function getReservationInformation() {

		    $.ajax({
		        url: "/ajax/getAllReservationList.json",
		        type:"get",
		        dataType:"json",
		        data :{
		        	hospitalNo: <%=hospitalNo%>
		    
		        },
		        error: function () {
		            alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
		        },
		        success: function (json) {
		        	console.log(json)
		        	//$(".fc-list-event-dot").css("border-color","blue");
		        	//$(".fc-daygrid-event-dot").css("border-color","blue");
		            calendar.addEventSource(json);
		     
		        }
		    });
		}//getReservationInformation end
		calendar.render();
	
}//getCalendar end

</script>

</body>
</html>