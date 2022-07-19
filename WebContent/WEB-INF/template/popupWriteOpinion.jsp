<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="popup_writeOpinion"><!-- //popup_writeOpinion -->
        <!--  <form action="/updateOpinion.obama" method="get">-->

            <div>
                <h2>소견쓰기</h2>
                <i class="im im-x-mark"></i>
            </div>
            <div>
                <label>진료내용
                    <textarea id="diagnosisTxt" name="diagnosis" placeholder="진료내용을 작성해주세요" type="text"></textarea>
                </label>
            </div>
            <div>
                <label>
                    유의사항
                    <textarea id="noticeTxt" name="notice" placeholder="유의사항을 작성해주세요"></textarea>
                </label>
            </div>
            <div>
                <label>
                    처방내역
                    <textarea id="prescriptionTxt" name="prescription" placeholder="처방내역을 작성해주세요"></textarea>
                </label>
            </div>
            <div class="popup_OpinionBtnBox">
            		<input id="reservationNo" type ="hidden" name="reservationNo"></input>
				  <button class="btn_writeOpinion opinionBtn"  type="submit">소견작성</button>
            </div>
      </form>  

    </div><!-- //#popup_writeOpinion -->