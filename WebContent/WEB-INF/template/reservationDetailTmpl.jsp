<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/template" id="reservationDetailTmpl">
 <div class="popup_reservationBox"><!--  .popup_reservationBox  -->
                <h2>예약상세보기</h2>
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
                        <@=reservation.symptoms@>
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

                <div class="reservationBtnBox">
                    <button class="btn_opinion" data-btntype="w">소견쓰기</button>

                </div>
            </div><!--  //.popup_reservationBox  -->

</script>