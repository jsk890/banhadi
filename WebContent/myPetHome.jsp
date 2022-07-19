<%@page import="com.obama.coco.dao.MyPetsDAO"%>
<%@page import="com.obama.coco.vo.MyPet"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
    	String userNoStr = request.getParameter("userNo");
    	int userNo = Integer.parseInt(userNoStr);
    	List<MyPet> myPetList = MyPetsDAO.selectMyPetList(userNo);
    	if(myPetList.size()!=0){
    	int petNo = myPetList.get(0).getNo();
    	}
    %>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/notosanskr.css">
<link rel="stylesheet" href="css/all.min.css">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/myPet.css">
<link rel="stylesheet" href="css/paginate.css">
<link rel="stylesheet" href="css/iconmonstr-iconic-font.min.css">
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
   <!--  소견쓰기 팝업  -->
    <div class="popup_opinion"><!-- //popup_opinion -->

            <div class="popup_header">
                <h2>소견</h2>
                <i class="im im-x-mark"></i>
            </div>
            <div class="popup_contents">

            </div>

    </div><!-- //#popup_opinion -->
    <div class="popup_background"><!--  .popup_background  -->
    </div><!--  //.popup_background  -->
   <div id="container">
<!--        <h2>마이펫</h2>-->
        <div id="petBox">

            <!--템플릿으로 li요소 추가하기-->
            <ul class="petTab">
            
              <%if(myPetList.size()==0){%> 
              	<li class="pet_list default"><img src="/upload/profile.png"><span></span></li>
              <%}%>
            <li class="btn_petRegister" style="border-right: 2px solid #424242;">+</li>
            </ul><!--//#petTab-->
            
            <div id="petInformationBox">
               
                
					<div class="newPetRegisterForm">
                 		 <div class="petProfile">
                        <div class="petImg">
                            <div><img class="defaultProfile" src="/upload/profile.png"><label for="petImage" class="btn_photoChange" style="display:block"><input type="file" id="petImage" name="petImage"><i class="fas fa-camera"></i></label><input type="hidden" id="defaultProfileName" name="petImageName" value="profile.png"><button class="btn_petImageDelete"><i class="fas fa-times"></i></button> </div>
						
                            <div id="petInformInput">
                                <form id="petInformForm" action="" method="get" style="display: block">
                                    <input id="petNameInput" form="petInformForm" placeholder="이름" type="text">
                                    <label for="labelF">
                                    <input  type="radio" class="petSexCheck" id="labelF" name="petSex" value="f" checked> <i class="fas fa-venus"></i>
                                    <input  type="radio" class="petSexCheck" id="labelF" name="petSex" value="m"> <i class="fas fa-mars"></i>
                                    </label>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="petInformation">
                      
                        <form id="petDetailForm" action="" method="get" style="display:block;">
                            <select class="petSpecies" style="display: block; height:20px ">
							<option data-species-no="1">강아지</option>
							<option data-species-no="2">고양이</option>
							<option data-species-no="3">포유류</option>
							<option data-species-no="4">파충류</option>
							<option data-species-no="5">조류</option>
							<option data-species-no="6">갑각류</option>
							<option data-species-no="7">어류</option>
							<option data-species-no="8">양서류</option>
							<option data-species-no="9">기타</option>
							</select>
                            <input class="petDate" type="date" placeholder="생년월일"/>
                            
                            <input class="petWeight" type="text" placeholder="무게(kg)" value="0" style="display:block;width:64px; height: 18px;margin-bottom: 5px"/>
                            <textarea class="petSpecifics" placeholder="특이사항을 입력하세요" style="resize: none;height: 80px"></textarea>
                            
                       		<button class="btn_completePetInform btn_complete btn_register" type="button" data-no ="-1" data-type="r">등록하기</button>
                       		<button class="btn_completePetInform btn_complete btn_update" type="button" data-no ="" data-type="u">수정완료</button>
						</form>
 						
                    </div>
					</div><!-- newPetRegisterForm -->
             		
            <div class="petInformationForm hide"> 	    
           		<div class= "petInform " >
                </div>
            </div><!--//#petInformationForm-->
             
             
             <div class="medicalRecords">
                    <h3>진료기록</h3>
                    
							
                    
                    
              </div>
        </div><!--petInformationBox-->
    </div> <!--//#petBox-->
</div><!--//#container--> 
<script type="text/template" id="petTabTmpl">
<@ _.each(myPetList,function(myPet){@>
  <li class="pet_list addedlist" data-no="<@=myPet.no@>"><img src="/upload/<@=myPet.picture@>"><span><@=myPet.name@></span></li>
<@})@>
</script>
<script type="text/template" id="myPetProfileTmpl">

   <div class="petProfile" data-no="<@=myPet.no@>">
                        <div class="petImg">
                            <div><img class="petPhoto" src="/upload/<@=myPet.picture@>"><label for="petImage" class="btn_photoChange"><input type="file" id="petImage" name="petImage"><i class="fas fa-camera"></i></label><input type="hidden" id="petImageName" name="petImageName" value="<@=myPet.picture@>"><button class="btn_petImageDelete"><i class="fas fa-times"></i></button></div>

                            <div id="petInform"><span id="petName"><@=myPet.name@></span> <span id="petSexIcon"> <@if(myPet.gender=='m'){@><i class="fas fa-mars"></i><@}else{@><i class="fas fa-venus"></i> <@}@></span> </div>
                         
                        </div>
                    </div>
                    <div class="petInformation">
                        <ul id="petDetail">
                            <li class="petSpecies"><@=myPet.speciesName@></li>
                            <li class="petDate"><@=moment(myPet.birthday).format("YYYY년 MM월 DD일")@> (<@=myPet.age@>세)</li>
                            <li class="petWeight"><@=myPet.weight@> kg</li>
                            <li class="petSpecifics"><@=myPet.specific@></li>
                        </ul>
                       <button class="btn_modifyPetInform btn_complete" data-no ="<@=myPet.no@>" type="button">수정</button>
                                        
			
 						
                    </div>

</script>





<script type="text/template" id="diagnosisListTmpl">
  <table class="records">
                        <thead>
                            <tr>
                                <th class="recordsNo">날짜</th>
                                <th>병원명</th>
                                <th>진료내용</th>
                                <th>수의사명</th>
                            </tr>
                        </thead>
                        <tbody>
<@if(diagnosisList.length<=1){ @>
	<td colspan=4>진료기록이 없습니다.</td>
<@}else{ @>
	<@for(let i = 1; i<diagnosisList.length; i++){@>

 <tr> 
        <td><@=moment(diagnosisList[i].reservationDate).format("YYYY년 MM월 DD일")@></td>
      	<td><@=diagnosisList[i].hospitalName@>	</td>
        <td><@ if(Object.keys(diagnosisList[i].medicalList).length==1){@> <@=diagnosisList[i].medicalList[0].name@> <@ }else {@> <@=diagnosisList[i].medicalList[0].name@> 외 <@=(Object.keys(diagnosisList[1].medicalList).length)-1 @>건 <@}@> <br />
            <span>(<@=numberWithCommas(diagnosisList[i].totalPrice)@> 원)</span>
			<button class="btn_opinion" data-no=<@=diagnosisList[i].reservationNo@>><i class="fas fa-clipboard-list"></i></button></td>
        <td><@=diagnosisList[i].doctorName@></td>
    </tr>
	<@}@>

<@}@>
    </tbody>
                    </table>
	<@=diagnosisList[0].paginate@>
</script>

<script type="text/template" id="popup_contentsTmpl">
 <span>진료내용</span>    
<div>
       
            <@=opinion.diagnosis@>


       
    </div>
<span>유의사항</span>
    <div>
        
            
            <@=opinion.notice@>
       
    </div>
 <span>처방내역</span>
    <div>
      
            <@=opinion.prescription@>
      
    </div>

</script>
<script src="js/moment-with-locales.js"></script>
<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>
_.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function petAddState(){
	  $(".newPetRegisterForm").css("display","block");
    $(".btn_petRegister").css("display","none");
    $petTab.children().css({
    	"pointer-events" :"none",
    	"cursor" : "not-allowed"
    	
    })
    $(".petInformationForm").addClass("hide");
 
}//petAddState end
$(document).ready(function(){
	var thisDate = new Date();
	const today =  moment(thisDate).format("YYYY-MM-DD")
	  $(".petDate").attr("max",today).val(today);
    <%if(myPetList.size()!=0){int petNo = myPetList.get(0).getNo();%>
    getMyPetTab();
    getMyPet();
		 $(".petInformationForm").removeClass("hide");
		getDiagnosisList(<%=petNo%>);
    <%}else{%>
		petAddState();
		 $(".btn_register").addClass("show");
      <%}%> 
})   
</script>
<script>
const $petTab = $(".petTab");

const petTabTmpl = _.template($("#petTabTmpl").html());
const $petInform= $(".petInform");


function getMyPetTab(){
    $.ajax({
        url: "/ajax/getPetList.json",
        type:"get",
        dataType:"json",
        data:{
        	userNo:<%=userNo%>
        },
    
        error: function () {
          alert("서버 점검중 잠시 후 다시시도하세요")
        },
        success: function (json) {
        	$(".addedlist").remove();
        	$petTab.prepend(petTabTmpl({myPetList: json}));
       
        	
        }
    })//ajax end
}//getMyPetTab() end

function getMyPet(){
    $.ajax({
        url: "/ajax/getPetList.json",
        type:"get",
        dataType:"json",
        data:{
        	userNo:<%=userNo%>
        },
    
        error: function () {
          alert("서버 점검중 잠시 후 다시시도하세요")
        },
        success: function (json) {
        	
        	$petInform.append(myPetProfileTmpl({myPet:json[0]}));
        	
        }
    })//ajax end
}//getMyPet() end

const diagnosisListTmpl = _.template($("#diagnosisListTmpl").html());
const $medicalRecords = $(".medicalRecords");

function getDiagnosisList(petNo){
			
	   $.ajax({
           url : "/ajax/diagnosisList.json",
           dataType:"json",
           type:"get",
           data:{
        	   userNo:<%=userNo%>,
   				petNo:petNo,
   				pageNo : 1,
   				numPage : 5
   				
           },
           error : function(){
               alert("서버 점검중 잠시 후 다시시도하세요")
           },
           success :function(json){
        	  
        	   console.log(json);
        		$(".records").remove();
        		$(".paginate").remove();
        		$medicalRecords.append(diagnosisListTmpl({diagnosisList:json}));
               
           }
	   })//ajax end

	
   
}//getDiagnosisList() end



$(document).on('click','.btn_petRegister',function (){
    
    $petTab.append("<li class=\"pet_list default\"><img src=\"upload/profile.png\"><span></span></li>")
  	petAddState();
	 $(".btn_register").addClass("show");

    
})//btn_petRegister end

</script>
<script>
	const $petImage = $("#petImage");
	const $defaultProfile = $(".defaultProfile");
	let $defaultProfileName = $("#defaultProfileName");

	const $btn_petImageDelete =$(".btn_petImageDelete")
	
	$(document).on('change',"#petImage",function(){
		
		const file = this.files[0];
		if(file.size==0){	
			console.log("파일크기가 0이다")
			return ; 
		}
		if(!file.type.includes("image/")){
			console.log("이미지가 아니다")
			return;
		}
		const formData = new FormData();
		formData.append("petImage",file,file.name)
		console.log(formData);
		$.ajax({
			url:"/ajax/uploadPetImage.json",
			dataType:"json",
			type :"post",
			data:formData,
			processData:false,
			contentType:false,
			error:function(){
				alert("error")
			},
			success:function(json){
				//alert(json.fileName);
				$defaultProfile.attr("src","/upload/"+json.fileName);
				$defaultProfileName.val("");
				//$petImageName.val("/upload/"+json.fileName);
				$defaultProfileName.val(json.fileName);
				$btn_petImageDelete.css("display","block");
			}//success end
		
			
		})//ajax end
	
		
	});//petImage change function
	
	$(document).on('click',".btn_petImageDelete",function(){
		
		$(".petImg img").attr("src","/upload/profile.png");
		$("#petImage").val("");
		$("#petImageName").val("");
		$(".btn_petImageDelete").css("display","none");
		
	})// .btn_petImageDelete click end
	
	

	 const myPetProfileTmpl =_.template($("#myPetProfileTmpl").html());
	 
	//text값

	 //정규표현식
	 const regexp = /^[0-9]*$/;
	function registerMyPet(petNo,type) {
		
		//필요한 value 
		//사진
		let $petImageNameVal = $("#defaultProfileName").val(); 
		//이름
		let $petNameInput = $("#petNameInput").val();
		//성별
		let $petSexVal = $("input[name='petSex']:checked").val();
		//종
		let $speciesNo = $("#petDetailForm .petSpecies option:selected").data("speciesNo");
		//날짜
		let $petDateVal =  $("#petDetailForm .petDate").val();
		//몸무게
		let $petWeightVal = $("#petDetailForm .petWeight").val();
		//특이사항
		let $petSpecificsVal = $("#petDetailForm .petSpecifics").val();
		
		
		
		var birthDate = new Date($petDateVal);
		if(!regexp.test($petWeightVal)){
			alert("숫자만 입력해주세요")
			return;
		}
		if($petNameInput==""){
			alert("이름을 입력해주세요")
			return;
		}
	 	if($petSpecificsVal==""){
	 		alert("사랑하는 반려동물의 특징을 적어주세요")
	 		return;
	 	}
		$.ajax({
			
			url:"/ajax/registerMyPet.json",
			dataType :"json",
			type :"get",
			data:{
				userNo : <%=userNo%>,
				petNo : petNo,
				speciesNo : $speciesNo,
				name : $petNameInput,
				gender : $petSexVal,
				picture :$petImageNameVal,
				weight : $petWeightVal,
				specific : $petSpecificsVal,
				birthday :  moment(birthDate).format("YYYY-MM-DD")
			},
			error :function(){
				alert("펫 등록 서비스 점검중")
			},
			success :function(json){
				getMyPetTab();
				$petInform.append(myPetProfileTmpl({myPet:json}));
				$(".btn_petRegister").css("display","block");
				 $(".newPetRegisterForm").css("display","none");
				 $(".petInformationForm").removeClass("hide");
				  $petTab.children().css({
				    	"pointer-events" :"auto",
				    	"cursor" : "pointer"
				    	
				    })
				      $(".btn_complete").removeClass("show");
				 
				    thisPetNo = "";
				    
				    $("#defaultProfileName").val("profile.png");
				    $("#defaultProfile").attr("src","/upload/profile.png");
					$petSexVal = "";
					$petNameInput = "";
					$speciesNo = "";
					$petWeightVal ="0";
					$petSpecificsVal = "";
					thisDate = new Date();
					today =  moment(thisDate).format("YYYY-MM-DD")
					$(".petDate").attr("max",today).val(today);
					
			}//success end
			
		})//ajax end
		
	}//registerMyPet() end
	let thisPetNo = "";

	
	
	
	  $(document).on('click','.btn_modifyPetInform',function(){
		  petAddState()
    		$(".btn_modifyPetInform").css("display","none");
		    $(".btn_update").addClass("show");
		    thisPetNo = $(this).data("no");
		
			let $petNameTxt = $(".petInform #petName").text();
			let $petWeightTxt = $("#petDetail .petWeight").text().slice(0,-3);
			let $specific = $("#petDetail .petSpecifics").text();
			let $petPhoto = $(".petPhoto").attr("src");
			const $petImageName = $("#petImageName").val();
			//이름
			let $petNameInput = $("#petNameInput").val($petNameTxt);
			//몸무게
			let $petWeightVal = $("#petDetailForm .petWeight").val($petWeightTxt);
			//특이사항
			let $petSpecificsVal =  $("#petDetailForm .petSpecifics").val($specific);
			//사진
 			$(".defaultProfile").attr("src",$petPhoto);
			$("#defaultProfileName").val($petImageName);
			if($petImageName!="profile.png"){

 				$btn_petImageDelete.css("display","block");
					
			}
		
	  })//btn_modifyPetInform click end
	 
	$(document).on('click','.btn_completePetInform',function(){
		
		const type = $(this).data("type");
		
		if(type=="u"){
			
		
			$(".petInform").empty();
			registerMyPet(thisPetNo,"u");
		}else if(type=="r"){
			
			$(".petInform").empty();
			registerMyPet(-1,"r");
			$(".default").remove();
		}
	
		
	})// btn_complete click end
	

	  
	  
</script>
<script>
$popup_background = $(".popup_background");

$popup_opinion = $(".popup_opinion");

$tabSlider = $("#tab_slider");

$opinionCloseBtn = $(".popup_opinion i");
//진료내용 클릭 시
$(document).on('click','.btn_opinion',function(){
	const reservationNo = $(this).data("no");
	openPopupOpinion();
    getOpinion(reservationNo);
})//btn_opinion click

$(".btn_modifiedOpinion").click(function () {
	
    openPopupOpinion();

});//#applyItem  click

function openPopupOpinion() {
    $popup_background.addClass("popup_on");
    $popup_opinion.addClass("popup_on");
    $("html").css("overflow", "hidden");
    $("#content").css("paddingRight", "17px");
    $(".aux").css("left", "-8px");
}
$popup_background.click(function () {
    closePopup();
});//$popup_background  click



$opinionCloseBtn.click(function () {
    closePopup();
});//$btn_opinion  click
//팝업 닫기
function closePopup() {
    $(".popup_on").removeClass("popup_on")
    $("html").css("overflowY", "scroll");
    $("#content").css("paddingRight", "0px");
    $(".aux").css("left", "0px");
}//.closePopup end



$(document).on('click','.pet_list',function(){
	
	const petNo = $(this).data("no");
	$.ajax({
        url: "/ajax/getMyPet.json",
        type:"get",
        dataType:"json",
        data:{
        	userNo:<%=userNo%>,
			petNo:petNo
        },
    
        error: function () {
          //  alert("서버 점검중 잠시 후 다시시도하세요")
        },
        success: function (json) {
        	$petInform.empty();
        	$petInform.append(myPetProfileTmpl({myPet:json}));
        	
        }
    })//ajax end
    getDiagnosisList(petNo);
	
})//pet_list click end

const $popup_contents = $(".popup_contents");
const popup_contentsTmpl = _.template($("#popup_contentsTmpl").html());
function getOpinion(reservationNo){

    $.ajax({
        url : "/ajax/getOpinion.json",
        type:"get",
        dataType:"json",
        data:{
        	reservationNo :reservationNo
        },
        error : function(){
         //   alert("서버 점검중 잠시 후 다시시도하세요")
        },
        success :function(json){
        	$popup_contents.empty();
            $popup_contents.append(popup_contentsTmpl({opinion:json}));
        }


    })
}//get Opinion() end


</script>
</body>
</html>