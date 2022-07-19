<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/template" id="applyTemplate">

<div class='reservationList'><!--  .reservationList  -->
<h3><@if(state=='f'){@>예약신청<@}else if(state=='t'){@>예약완료<@}else{@>진료완료<@}@><span id="reservationCount"> <@=reservationList.length@> </span>건</h3>
<ul>
<@ _.each(reservationList, function(reservation){@>
    <li class="applyItem" data-no="<@=reservation.no@>"><!--  .applyItem  -->
        <div class="applyItemBox"><!--  .applyItemBox  -->
            <div class="animalInfo"><!--  .animalInfo  -->
                <div class="img_animal">
                    <img src="/img/mypet/<@=reservation.picture@>">
                </div>
                <div class="animalInfoname">
                    <@=reservation.petName@>
                </div>
                <div class="animalInfoKinds">
                    <@=reservation.speciesName@>
                </div>
            </div><!--  //.animalInfo  -->
            <div class="diagnosisInfo"><!--  .diagnosisInfo  -->
                <div class="animalInfoname">
					
                    <@=reservation.symptomList@>
					
                </div>
                <div class="uniqueness">
                     <@=reservation.specific@>
                </div>
                <div>
                    <div class="animalInfoname diagnosisName">
							<@if(reservation.medicalList.length>1){@>
				
							<@=reservation.medicalList[0].name@> 외 <@=reservation.medicalList.length-1@> 건
					<@}else{@>
						<@=reservation.medicalList[0].name@>
	
					<@}@>			
                        
                    </div>
                    <div>
                        <span class="diagnosisDate"><@=moment(reservation.reservationsDate).format("YYYY년 MM월 DD일 hh:mm")@></span>
                        <span class="diagnosisPrice animalInfoname">
							<@=numberWithCommas(reservation.totalPrice)@>원
						</span>
                    </div>
                </div>
            </div><!--  .diagnosisInfo  -->

        </div><!--  //.applyItemBox  -->
    </li><!--  //.applyItem  -->
<@})@>
</ul>
</div><!--  //.reservationList  -->

</script>