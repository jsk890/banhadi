<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/template" id="opinionTmpl">
   <div class="opinionBox">
 <h2>진료내용</h2>
            <div>
                <h3>진료내용</h3>
                <div class="content" id="diagnosis"><@if(opinion.diagnosis!=null){@><@=opinion.diagnosis@><@}else{@>내용이 없습니다.<@}@></div>
            </div>
            <div>
                <h3>유의사항</h3>
                <div class="content" id="notice"><@if(opinion.notice!=null){@><@=opinion.notice@><@}else{@>내용이 없습니다.<@}@></div>
            </div>
            <div>
                <h3>처방내역</h3>
                <div class="content" id="prescription"><@if(opinion.prescription!=null){@><@=opinion.prescription@><@}else{@>내용이 없습니다.<@}@></div>
            </div>
            <div class="modifiedOpinionBtnBox">
                <button class="btn_openReservation">진료보기</button>
                <button class="btn_modifiedOpinion" data-btntype="e">수정하기</button>
            </div>
</div><!-- //.OpinionBox -->
</script>