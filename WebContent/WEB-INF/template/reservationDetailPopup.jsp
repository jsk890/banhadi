<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/template" id="reservationPopupTmpl">
<div>
                <h2>예약상세보기</h2>
                <i class="im im-x-mark"></i>
            </div>

            <div class="popup_reservationNameBox"><!--  .popup_reservationNameBox  -->
                <div>예약자</div>
                <div class="popup_reservationName"><@=reservation.userName@></div>
                <div><@=reservation.userPhone.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-")@></div>
            </div><!--  //.popup_reservationNameBox  -->

            <div class="popup_reservationDate"><!--  .popup_reservationDate  -->
               <@=moment(reservation.reservationsDate).format("YYYY년 MM월 DD일 hh:mm")@>
            </div><!--  //.popup_reservationDate  -->

            <div class="popup_reservationImgBox">
                <div class="popup_reservationImg">
                    <img src="/img/mypet/<@=reservation.picture@>">
                </div>
                <div class="popup_reservationSymptoms">
                    <@=reservation.symptomList@>
                </div>
            </div><!--  //.popup_reservationNameBox  -->

            <div class="popup_reservationUniqueness"><!--  .popup_reservationUniqueness  -->
                <@=reservation.specific@>
            </div><!--  //.popup_reservationUniqueness  -->

            <div class="popup_reservationSubjectBox"><!--  .popup_reservationSubjectBox  -->
			
			<@ _.each(reservation.medicalList,function(medical){@>
                <div class="popup_reservationSubject">
                    <div><@=medical.name@></div>
                    <div><@=numberWithCommas(medical.price)@>원</div>
                </div>
			<@})@>

            </div><!--  //.popup_reservationSubjectBox  -->

            <div class="popup_reservationTotalPrice"><!--  .popup_reservationTotalPrice  -->
                <@=numberWithCommas(reservation.totalPrice)@>원
            </div><!--  //.popup_reservationTotalPrice  -->
			
			<@if(reservation.state=='f'){@>
			<div class="popup_reservationBtnBox">
				<button class="btn_reject"><a href="/reservationApproval.obama?approvalResult=reject&reservationNo=<@=reservation.no@>&hospitalNo=<@=reservation.hospitalNo@>&userNo=<%=userNo%>">예약거절</a></button>
				<button class="btn_accept"><a href="/reservationApproval.obama?approvalResult=accept&reservationNo=<@=reservation.no@>&hospitalNo=<@=reservation.hospitalNo@>&userNo=<%=userNo%>">예약수락</a></button>
            </div>
			<@}@>


</script>
