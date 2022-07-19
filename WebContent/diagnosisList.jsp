<%@page import="com.obama.coco.vo.PageVO"%>
<%@page import="com.obama.coco.dao.FacilitiesDAO"%>
<%@page import="com.obama.coco.dao.HospitalMedicalsDAO"%>
<%@page import="java.util.concurrent.ConcurrentHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.obama.coco.vo.Hospital"%>
<%@page import="com.obama.coco.util.PaginateUtil"%>
<%@page import="com.obama.coco.vo.MyPet"%>
<%@page import="java.util.List"%>
<%@page import="com.obama.coco.dao.MyPetsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String userNo = request.getParameter("userNo");
	userNo = "13";

%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>진료예약</title>

    <%@ include file="/WEB-INF/template/link.jsp"%>
    <link rel="stylesheet" href="css/rSlider.min.css">
    <link rel="stylesheet" href="css/iconmonstr-iconic-font.min.css">
    <link rel="stylesheet" href="css/tui-date-picker.min.css"/>
    <link rel="stylesheet" href="css/diagnosislist.css"/>
    <link rel="stylesheet" href="css/paginate.css"/>
</head>
<body>

<%@ include file="/WEB-INF/template/header.jsp"%>


<form id="parameterBox" method="get" action="/hospitalList.jsp">
	<fieldset>
		
	
	</fieldset>
</form>


    <h2 class="screen_out">병원검색</h2>
    <div id="header_filter"><!--  #header_filter  -->
        <div id="filterContentBox">
            <div id="filterBox">
                <div id="animalList">
                	<ul>
                	</ul>
                </div><!--  //#animalList  -->
                <diV id="hospitalFilter">
                    <button class="btn_hospitalFilter"><span>응급진료</span></button>
                    <button class="btn_hospitalFilter"><span>진료 과목</span></button>
                    <button class="btn_hospitalFilter"><input type="text" id="btn_diagnosisDate" aria-label="Date-Time"disabled></button>
                    <button class="btn_hospitalFilter"><span>주소 검색하기</span></button>
                    <button class="btn_hospitalFilter"><span>시설/서비스</span></button>
                    <button class="btn_hospitalFilter"><span>가격</span></button>


				    
                </diV><!--  //#hospitalFilter  -->
            </div><!--  //#filterBox  -->
            

            
        </div><!--  //#filterBox  -->

        <div id="hospitalFilterInfo">
            <h3 class="screen_out">진료명</h3>
            <div class="popup_subjects"><!-- .popup_subjects -->
                <input placeholder="진료명을 입력해주세요"/>
                <i class="im im-x-mark"></i>
                <ul>
                </ul>
            </div><!-- //.popup_subjects -->
            
            <div class="popup_date"><!-- .popup_date -->
                <!--                <div class="tui-datepicker-input tui-datetime-input tui-has-focus">-->
                <!--                    &lt;!&ndash;        <input type="text" id="datepicker-input" aria-label="Date-Time">&ndash;&gt;-->
                <!--&lt;!&ndash;                    <span class="tui-ico-date"></span>&ndash;&gt;-->
                <!--                </div>-->

                <div id="wrapper" style="margin-top: -1px;">
                </div>
            </div><!-- //.popup_date -->

            <div class="popup_priceFilter"><!-- .popup_priceFilter -->
                <div>
                    <h3 class="popup_name">가격</h3>
                    <i class="im im-x-mark"></i>
                    <hr/>
                </div>
                <input type="text" id="rangeSlider"/>
                <div id="priceInputBox"><!-- #priceInputBox -->
                    <div>
                        <input placeholder="최저요금" id="minPrice"/>
                        <p>최저요금</p>
                    </div>
                    <div>
                        <input placeholder="최고요금" id="maxPrice"/>
                        <p>최고요금</p>
                    </div>
                </div><!-- //#priceInputBox -->
                <button id="btn_price">병원보기</button>

            </div><!-- //.popup_priceFilter -->
            <div class="popup_service"><!-- .popup_service -->
                <div>
                    <h3 class="popup_name">시설/서비스</h3>
                    <i class="im im-x-mark"></i>
                </div>
                <hr/>
                <div>
                    <label><input type="checkbox"/><img src="img/icon_parking.png">건물 내 무료주차</label>
                    <label><input type="checkbox"/><img src="img/icon_hospitalbed.png">입원</label>
                    <label><input type="checkbox"/><img src="img/icon_hotel.png">호텔링</label>

                </div>
                <hr/>
                <div>
                    <button class="btn_hospitalPopup btn_service">병원보기</button>
                </div>
            </div><!-- //.popup_service -->
        </div>
    </div><!--  //#header_filter  -->

    <div id="addFilter">
        <ul>
        </ul>
    </div>
    <hr/>

    <div id="content_list">
        <div id="hospitalList" class="listBox">
            <ul>
            </ul>
        </div><!--  //#hospitalList  -->
        <div id="hospitalList_map" class="listBox"></div> 
    </div><!--  //#content_list  -->




<%@ include file="/WEB-INF/template/footer.jsp"%>


<!-- 마이펫 템플릿 -->
<script type="text/template" id="mypetTemplate">
<@ _.each(animalList, function(animal){ @>
	<li data-species-no="<@=animal.speciesNo@>" data-my-pet-no="<@=animal.no@>">
		<label class="animalProfileBox">
    		<input type="radio" class="animalProfile" name="myAnimal"/>
    	    <img src="img/mypet/<@=animal.picture @>"/>
    	    <p><@= animal.name @></p>
			<p>(
			<@ if(animal.gender =="m") {@>
    	   	<i class="fas fa-mars"></i>
			<@}else{@>
			<i class="fas fa-venus"></i>
			<@}@>
			/ <@= moment().format("YY") - moment(animal.birthday).format("YY") @>세)</p>
    	    <p><@= animal.weight @>kg</p>
    	</label>
	</li>
<@ }); @>
</script>
<!--필터추가 템플릿-->
<script type="text/template" id="FilterTemplate">
    <li class="addFilterItem">
        <button><i class="fas fa-minus-circle"></i></button>
    </li>
</script>
<!--진료명 필터 템플릿-->
<script type="text/template" id="diagnosisNameTemplate">
    <li class="addFilterItem presentKeyword"><@= name @></li>
</script>

<!--진료명 검색 템플릿-->
<script type="text/template" id="searchDiagnosisTemplate">
    <@ _.each(diagnosisList, function(diagnosis){ @>
    	<li><@= diagnosis.name @></li>
    <@ }); @>
</script>

<!-- 병원리스트 템플릿 -->
<script type="text/template" id="hospitalTemplate">
<@ _.each(hospitalss.list, function(hospital){ @>

    <li class="hospitalListItem"
data-price-score="<@= hospital.priceScore@>" 
data-accessibility-score="<@= hospital.accessibilityScore@>"
data-kindness-score="<@= hospital.kindnessScore@>" 
data-cleanliness-score="<@=hospital.cleanlinessScore@>" 
data-speciaty-score="<@= hospital.speciatyScore@>">
        <div class="hospitalListBox"><!--  .hospitalListBox  -->
            <div class="hospitalListImgBox"><!--  .hospitalListImgBox  -->

                <div class="hospitalListImg" data-photolength="<@=hospital.hospitalPhotos.length@>"><!--  .hospitalListImg  -->
                    <button class="btn_changeImg btn_leftImg"><i class="fas fa-angle-left"></i></button>
                    <div class="hospitalImgs"><!--  .hospitalImgs  -->
						<@ _.each(hospital.hospitalPhotos, function(photos){ @><!--
                        --><img src="/img/hospital/<@= photos.fileName@>" alt="병원사진"/>
						<@ }); @>
                    </div><!--  //.hospitalImgs  -->
                    <button class="btn_changeImg btn_rightImg"><i class="fas fa-angle-right"></i></button>
                </div><!--  //.hospitalListImg  -->

                <span><@= hospital.name@></span>
            </div><!--  //#hospitalListPoint  -->
<a href="javascript:goWriteQuestion(<@=hospital.no@>,<@=hospital.hmNo@>);">
            <div class="hospitalListInfo"><!--  #hospitalListInfo  -->
                <div>
                    <@= hospital.mName@>
                </div>
                <div class="moreInfo">
                    <@= hospital.speciesName@>
                </div>
                <div class="moreInfo">
                    <@= hospital.price@> 원
                </div>
                <div class="moreInfo additionalInfo ">
                    <@= hospital.address@>
                </div>
                <div class="moreInfo additionalInfo">
                    <@= hospital.phoneNum@>
                </div>
                <div class="moreInfo additionalInfo">
					<ul>

					<@ _.each(hospital.facilities, function(facility){@>
						<li class = "facilityName">

							<@if(facility.name=="호텔링") {@>
								<img src="img/icon_hotel.png">
							<@}else if(facility.name=="입원") {@>
								<img src="img/icon_hospitalbed.png">
							<@}else{@>
								<img src="img/icon_parking.png">
							<@}@>

							<@= facility.name +"　"@>		
						</li>
					<@ }); @>

					</ul>
                </div>
            </div><!--  //#hospitalListInfo  -->
</a>
            <div class="hospitalListPoint"><!--  .hospitalListPoint  -->
                <div class="pointPercent"><!--  .pointPercent  -->
                    <div>
						<@if(hospital.treeScore>=60) {@>
							<img src="img/icon_happyTree.png"/>
						<@}else{@>
							<img src="img/icon_sadTree.png">
						<@}@>
					</div>
                    <span><@=hospital.treeScore@>% (<@= hospital.reviewCnt@>)</span>
                    <i class="far fa-heart"></i>
                </div><!--  //#pointPercent  -->
                <canvas  id="myChart" class="hospitalChart" width="180" height="180"></canvas>
                <!--                <canvas id="chart" width="180" height="180"></canvas>-->
            </div><!--  //#hospitalListPoint  -->
        </div><!--  //.hospitalListBox  -->

    </li>
<@ }); @>
<@=hospitalss.paginate@>

</script>
<script src="js/rSlider.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/tui-date-picker.min.js"></script>
<script src="js/Chart.min.js"></script>
<script src="js/underscore-min.js"></script>
<script src="js/moment-with-locales.js"></script>
<script src="js/jquery.js"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b939568819a96f99364aa6bb3dabf9d8&libraries=services"></script>
<script>
	
	
	const $parameterBox = $("#parameterBox")
	
	
    //템플릿
    const $hospitalTemplate = _.template($("#hospitalTemplate").html());
    //목록(ul)
    const $hospitalList = $("#hospitalList ul");
    
    //gethospitalTemplate();


    function gethospitalTemplate() {
    	
        for (let i = 0; i < 15; i++) {
            $hospitalList.append($hospitalTemplate());
        }
    	
    }//getLectureList end

</script>
<script>

    //템플릿
    const $FilterTemplate = _.template($("#FilterTemplate").html());

    //목록(ul)
    const $addFilterList = $("#addFilter ul");


</script>
<script>
    // 언더스코어는 기본적으로 %을 사용하는데 %는  jsp에서 사용할 수 없기 때문에 % -> @ 로변경하는 코드가 필요함
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };
    
    var browserHeight = window.innerHeight;

    var scrollTopValue = 0;
    var scrollLeftValue = 0;

    
	let species = 1; //종번호
	let mypetNo=1;
    let emergency = "f"; //긴급
	let diagnosis = ""; //진단명
    let today = new Date(); //현재날짜
	let date = $("#btn_diagnosisDate").text(); //버튼에입력된 날짜
	let facilityArr = new Array();
	facilityArr = [];
	let addressArr = new Array();// 리스트들의 주소를 담는 배열
	const $hospitalPhoto = $(".hospitalListBox .hospitalImgs");
	
	let parking = 1;//주차
	let bed = 2;//입원
	let hoteling = 3;//호텔링
    let minPrice=0; //최소금액
    let maxPrice=1500000; //최대금액
    let page=1;//페이지
    getHospitalDiagnosisList(species,emergency,diagnosis,date,facilityArr,minPrice,maxPrice,page); //jsp접속시 리스트 한번 불러오기
    
    
    //사진 좌우 클릭시 변경
    let imgleft = 0;

    $(document).on('click', '.btn_leftImg', function () {
    	let photoArrLength = $(this).parent().data("photolength");
    	if(imgleft == 0){
    		imgleft = -242 * (photoArrLength-1);
    		$(this).next().css("left", imgleft);
    	}else{
        	imgleft += 242;
        	$(this).next().css("left", imgleft);
    	}
    });//.btn_leftImg click
    $(document).on('click', '.btn_rightImg', function () {
    	let photoArrLength = $(this).parent().data("photolength");
    	if(imgleft == -242 * (photoArrLength-1)){
    		imgleft = 0;
        	$(this).prev().css("left", imgleft);
    	}else{
        	imgleft -= 242;
        	$(this).prev().css("left", imgleft);
    	}
    });//.btn_rightImg click


    
    
    
    //마이펫리스트템플릿
    const mypetTemplate = _.template($("#mypetTemplate").html());
    //동물 목록(ul)
    const $animalList = $("#animalList ul")
	//마이펫 리스트 불러오기
    getMypetsList();
    //필터에 따라서 마이펫목록을 불러오는 함수
    function getMypetsList() {
        $.ajax({
            url: "/ajax/mypet.json",
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
                $animalList.html(mypetTemplate({animalList: json}));

            }
    	});
    }//getMypetsList end
    

    //진료명검색템플릿
    const searchDiagnosis = _.template($("#searchDiagnosisTemplate").html());
    //진료명검색목록(ul)
    const $diagnosisList = $(".popup_subjects ul");
    //진료명템플릿
    const diagnosisName = _.template($("#diagnosisNameTemplate").html());
    //진료명목록(ul)
    const $diagnosisNameList = $("#diagnosisBox ul");
    //입력할때마다 json리스트 불러오기
    $(".popup_subjects input").on("keyup", function () {
        getDiagnosisList($(this).val());
    });
    $("#hospitalFilter :nth-child(2)").click(function () {
        getDiagnosisList($(this).val());
    });
    function getDiagnosisList(search) {
        $.ajax({
            url: "/ajax/medicals.json",
          	//넘겨주는 방식
            type:"get",
            //넘겨주는 데이터 형식
			dataType:"json",
			data:{search : search},
            error: function () {
                alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
            },
            success: function (json) {
                $diagnosisList.html(searchDiagnosis({diagnosisList: json}));
            }
        });
    }//getDiagnosisList end
    
    


//////////////동물 필터

    //내 동물
    const $myAnimal = $("#animalList li");
    
    $(document).on('click', '#animalList li', function () {
    	$(".selectAnimal").removeClass("selectAnimal");
    	$(this).children().addClass("selectAnimal");
        species = this.dataset.speciesNo;
        mypetNo = this.dataset.myPetNo;
        page=1;
        getHospitalDiagnosisList(species,emergency,diagnosis,date,facilityArr,minPrice,maxPrice,page);
    });//.animalProfileBox end
    
//////////////응급진료 필터

	//응급진료 필터 클릭시
    $(".btn_hospitalFilter").eq(0).click(function () {
        $(this).toggleClass("btn_emergency");
        if($(this).hasClass("btn_emergency")){
        	emergency = "t";
        }else{
        	emergency = "f";
        };
        page=1;
        getHospitalDiagnosisList(species,emergency,diagnosis,date,facilityArr,minPrice,maxPrice,page);
    });
	
//////////////진료과목 필터

	var $diagnosisPopupBtn = $("#hospitalFilter :nth-child(2)");
    //진료과목 필터 클릭 시
    $("#hospitalFilter :nth-child(2)").click(function () {
        // $(".popup_on").removeClass("popup_on");

        clickFilterBtn($(this), $(".popup_subjects"));
        // alert($(".popup_priceFilter").index());
        //setPricePopup();//가격필터 팝업 설정
    });
    const $diagnosisInput = $("#menu_wrap .option input");
    //진료과목 클릭 시
    $(document).on('click', '.popup_subjects ul li', function () {
        $(".popup_on").removeClass("popup_on");
        diagnosis = $(this).text();
        $("#hospitalFilter :nth-child(2) span").text($(this).text());
        $("#menu_wrap input").val(diagnosis);
        $diagnosisInput.val($("#addFilter ul:last-child()").text().trim());
        page=1;
        getHospitalDiagnosisList(species,emergency,diagnosis,date,facilityArr,minPrice,maxPrice,page);
    });//.popup_subjects ul li click

    
//////////////달력 필터

    //달력 필터 클릭 시
    $("#hospitalFilter :nth-child(3)").click(function () {
        // $(".popup_on").removeClass("popup_on");

        clickFilterBtn($(this), $(".popup_date"));
        // alert($(".popup_priceFilter").index());
        //setPricePopup();//가격필터 팝업 설정

    });

    //진료가능날짜 팝업
    const datepicker = new tui.DatePicker('#wrapper', {
        date: new Date(),
        input: {
            element: '#btn_diagnosisDate',
            format: 'yyyy년MM월dd일',
        },
        showAlways: true,
        language: 'ko',
        selectableRanges: [
            [today, new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())]
        ]
    });
    $(".tui-calendar-date.tui-is-selectable").click(function(){
    	date = this.dataset.timestamp;
    	clickFilterBtn($("#hospitalFilter :nth-child(3)"), $(".popup_date"));
    	page=1;
    	getHospitalDiagnosisList(species,emergency,diagnosis,date,facilityArr,minPrice,maxPrice,page);
    });
    
	
//////////////주소 필터
    //주소검색 필터 클릭시
    $("#hospitalFilter :nth-child(4)").click(function () {
        $(".popup_on").removeClass("popup_on");
        $(".btn_FilterClick").removeClass("btn_FilterClick");
        var width = 400; //팝업의 너비
        var height = 500;
        new daum.Postcode({
            width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
            height: height,
            oncomplete: function (data) {
                var geocoder = new kakao.maps.services.Geocoder();
                geocoder.addressSearch(data.roadAddress, function (result, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === kakao.maps.services.Status.OK) {
                        // var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                        latitude = result[0].y;
                        longitude = result[0].x;
                        setKakaoMap(latitude, longitude);
                    }
                });
            }
        }).open({
        	left: ((window.screen.width / 2) - (width / 2)),
            top: ((window.screen.height / 2) - (height / 2))
        });
    });
    
//////////////시설/서비스 필터

	//시설/서비스 필터 클릭시
    $("#hospitalFilter :nth-child(5)").click(function () {
        // $(".popup_on").removeClass("popup_on");
        // $(".popup_service").toggleClass("popup_on");
        clickFilterBtn($(this), $(".popup_service"));

    });
    //서비스 필터추가 삭제
    $(".btn_service").click(function () {
    	facilityArr.splice(0);
        $(".popup_on").removeClass("popup_on");
        const $serviceCheckBox = $(".popup_service input");
        $serviceCheckBox.each(function (index, item) {
            if ($(item).prop("checked")) {
                const addFilterName = $(this).parent().text();
                $(".addFilterItem").each(function (index, item) {
                    if ($(this).text() == addFilterName) {
                        $(this).remove();
                        //facilityArr.push(0);
                    }
                });
                facilityArr.push(index+1);
                $addFilterList.append("<li class=\"addFilterItem\">" + addFilterName + "<button class='delFilter'><i class=\"fas fa-minus-circle\"></i></button></li>");
            } else {
                const addFilterName = $(this).parent().text();
                $(".addFilterItem").each(function (index, item) {
                    if ($(this).text() == addFilterName) {
                        $(this).remove();
                        //facilityArr.push(0);
                    }
                });
            }//if else
            
		});//$serviceCheckBox
		$(".delFilter").click(function () {
	        const addFilterName = $(this).parent().text();
	        facilityArr.splice(0);
	        $(".addFilterItem").each(function (index) {
	            if ($(this).text() == addFilterName) {
	                $(this).remove();
	                //facilityArr.push(0);
	            }
	        });
	        $(".popup_service label").each(function (index) {
	            if ($(this).text() == addFilterName) {
	                $(this).children('input').prop("checked", false);
	                //facilityArr.push(0);
	            }
	        });
	        $serviceCheckBox.each(function (index, item) {
	            if ($(item).prop("checked")) {
	            	facilityArr.push(index+1);
	                }
	        });
	        page=1;
	        getHospitalDiagnosisList(species,emergency,diagnosis,date,facilityArr,minPrice,maxPrice,page);
	    });//.delFilter click
	    
	    
	    page=1;
	    getHospitalDiagnosisList(species,emergency,diagnosis,date,facilityArr,minPrice,maxPrice,page);
    });//.btn_service click


//////////////가격 필터
    var rangeSlider;
    var $pricePopupBtn = $("#hospitalFilter :nth-child(6)");

    //가격 최저,최고 필터버튼에 표시
    $("#btn_price").click(function () {
        $pricePopupBtn.text(rangeSlider.getValue());
        $(".popup_priceFilter").toggleClass("popup_on");
        page=1;
        getHospitalDiagnosisList(species,emergency,diagnosis,date,facilityArr,minPrice,maxPrice,page);
    });

    //가격 필터버튼 클릭시
    $pricePopupBtn.click(function () {
        $(".rs-container").remove();
        clickFilterBtn($(this), $(".popup_priceFilter"));
        if ($(this).text() == "가격") {
            setPricePopup(0, "1500000");
        } else {
            var priceText = $(this).text().split(',');
            setPricePopup(priceText[0], priceText[1]);
        }//if~else end
    });//.$pricePopupBtn end
    
    //가격 팝업 설정
    function setPricePopup(min, max) {
        rangeSlider = new rSlider({
            target: '#rangeSlider',
            values: setPriceArr(),
            width: 400,
            range: true,
            // tooltip: true,
            // scale: true,
            labels: false,
            set: [parseInt(min), parseInt(max)],
            onChange: function (val) {
            	$(".rs-container ins").text("");
                var nowPrice = val.split(',');
                $("#minPrice").val(nowPrice[0]);
                $("#maxPrice").val(nowPrice[1]);
                minPrice=nowPrice[0];
                maxPrice=nowPrice[1];
            }
        });
    }//setPricePopup
    
    //가격필터 가격 범위 설정
    function setPriceArr() {
    	var priceArr = [];
        for (var i = 0; i <= 15; i++) {
            priceArr[i] = i*10000;
        }
        return priceArr;
       // return priceArr[priceArr.length + 1] = "1500000+";
    }//setPriceArr
    
    function clickFilterBtn($btn, $popup) {
        $(".popup_on").not($popup).removeClass("popup_on");
        $(".btn_FilterClick").not($btn).removeClass("btn_FilterClick");
        $btn.toggleClass("btn_FilterClick");
        $popup.toggleClass("popup_on");
    }
    
	//필터 팝업창 x표시 눌렀을 때
    $("#hospitalFilterInfo .im-x-mark").click(function () {
        $(".popup_on").removeClass("popup_on");
       
    });
	

	

	//진료별 병원리스트 템플릿
    const searchHospitaDiagnosis = _.template($("#hospitalTemplate").html());
    //병원리스트
    const $hospitalDiagnosisList = $("#hospitalList ul");

    let markers = [];
    
    let hospitals = null;
    
    //페이징처리
    $(document).on("click",".paginate a",function(e){
    	e.preventDefault();
    	page = $(this).text();
    	getHospitalDiagnosisList(species,emergency,diagnosis,date,facilityArr,minPrice,maxPrice,page);
    });
    
    //진단 리스트 클릭 시 페이지이동
    function goWriteQuestion(hospitalNo,hmNo){
    	//let petNo = $('#myPetList .mypet.toggle').data("petNo");
    	if(mypetNo!=null)
    	location.href="/받을주소?hospitalNo="+hospitalNo+"mypetNo="+mypetNo+"diagnosisNo="+hmNo;
    	
    	
    };
    /*
    //새로고침없이 주소창 쿼리스트링 변경
	function resetQueryString(mypetNo){
        let URLSearch = new URLSearchParams(window.location.search);
    	URLSearch.set('mypetNo', String(mypetNo));

    	let newParam = URLSearch.toString();
    	let queryString = location.pathname + '?' + newParam;
    	history.pushState('','',queryString);
  	}
    */
    
    //필터처리 및 페이징처리된 병원별 진단리스트 불러오기
    function getHospitalDiagnosisList(species,emergency,diagnosis,date,facilityArr,minPrice,maxPrice,page) {
    	//resetQueryString(mypetNo);
        $.ajax({
        	//연결할 서블릿
            url: "/ajax/hospitalMedicals.json",
          	//넘겨주는 방식
            type:"get",
            //넘겨주는 데이터 형식
			dataType:"json",
			//배열 및 리스트로 넘기는 값이 있을때 선언
            //traditional : true,
			//서블릿으로 넘겨줄 값 data:{서블릿에서 사용할 변수명 : 서블릿으로 넘길 데이터 값}
			data:{
				//필터처리
				species : species,
				emergency : emergency,
				diagnosis : diagnosis,
				date : date,
				facility : facilityArr,
				minPrice : minPrice,
				maxPrice : maxPrice,
				pageNo : page
				},
            error: function () {
                alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
            },
            success: function (json) {
            	console.log(json);
            	//템플릿으로 넘겨줄 값(템플릿 이름({each 함수명 : 받아온 json}))을 리스트에 붙임
            	$hospitalDiagnosisList.html(searchHospitaDiagnosis({hospitalss:json})); 	
            	hospitals = json.list;
            	setKakaoMap(latitude, longitude);

            	
           		//차트생성
           	    $.each($hospitalList.find('li'), function (index, item) {
           	        var data = {
           	            labels: ['친절도', '깔끔함', '전문성', '가성비', '접근성'],
           	            datasets: [{
           	                data: [
           	                	this.dataset.kindnessScore,
           	                	this.dataset.cleanlinessScore,
           	                	this.dataset.speciatyScore,
           	                	this.dataset.priceScore,
           	                	this.dataset.accessibilityScore],
           	                backgroundColor: "transparent",
           	                borderColor: "rgb(38, 153, 247)",
           	                pointRadius: 3,
           	                pointBackgroundColor: "rgb(38, 153, 247)",
           	                borderWidth: 2,
           	            }]
           	        };
           	        var options = {
           	            legend: false,
           	            scale: {
           	                ticks: {
           	                    min: 0,
           	                    max: 100,
           	                    stepSize: 25,
           	                    display: false
           	                },
           	                gridLines: {
           	                    color: "gray",
           	                },
           	            },
           	            tooltips: true,
           	            responsive: false,//절대적으로 지정
           	        };
           	        //var ctx = document.getElementsByClassName('hospitalChart');
           	        var ctx = $(item).find('canvas');
           	        var chart = new Chart(ctx, {
           	            type: 'radar',
           	            data: data,
           	            options: options
           	        });
           	    });//end chart create
            }
        });
        window.scrollTo({top:0, left:0, behavior:'smooth'});
    }//getDiagnosisList end
    
    

    //찜하기
    $(".pointPercent i").click(function () {
        $(this).toggleClass("far fas");

    });
    


    //스크롤 감지지
    $(window).scroll(function (event) {
        scrollTopValue = $(this).scrollTop();
        scrollLeftValue = $(this).scrollLeft();
        
        //console.log(scrollTopValue);
        //console.log(scrollLeftValue);

        var scrollBottom = $("body").height() - $(window).height() - $(window).scrollTop();
        
        if (scrollTopValue < 296) {
            $hospitalList_map.animate({
                'top': 267 - scrollTopValue
            }, 0);
        } else if (scrollTopValue > 296) {
            $hospitalList_map.animate({
                'top': 0
            }, 0);
        }
        if (scrollLeftValue > 0){
        	$hospitalList_map.animate({
        		'left': 681-scrollLeftValue
        	}, 0);
        }
        if (scrollBottom < 100) {
            $hospitalList_map.animate({
                'top': -(100 - scrollBottom)
            }, 0);
        }
    });
    
    var $hospitalList_map = $("#hospitalList_map")

    //지도 높이 설정
    var mapHeight = browserHeight;
    var latitude = 33.450701;
    var longitude = 126.570667;


    $hospitalList_map.height(mapHeight);

        // Geolocation API에 액세스할 수 있는지를 확인
        if (navigator.geolocation) {
            //위치 정보를 얻기
            navigator.geolocation.getCurrentPosition(function (pos) {
            	
            	//console.log("geolocation");
                latitude = pos.coords.latitude;     // 위도
                longitude = pos.coords.longitude; // 경도
                
                
                map.setCenter( new kakao.maps.LatLng(latitude, longitude));
                
              //  setKakaoMap(latitude, longitude);
            });
        } else {
            alert("서버점검중")
           // setKakaoMap(latitude, longitude);
        }
    
    var options = {
        legend: false,
        tooltips: true,
        responsive: false,//절대적으로 지정.
    };
    
    var map = null;

    //지도 세팅
    function setKakaoMap(latitude, longitude) {
    	
    	// 지도를 표시할 div 
        var container = document.getElementById('hospitalList_map');

        //맵을 만들때 옵션들
        var options = {
            center: new kakao.maps.LatLng(latitude, longitude),// 지도의 중심좌표
            level: 3 // 지도의 확대 레벨

        };

     	// 지도를 생성합니다   
         map = new kakao.maps.Map(container, options);

        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();

        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.BOTTOMLEFT);

        // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
        map.setZoomable(false);  
        
        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        
        var bounds = new kakao.maps.LatLngBounds();

    	$(hospitals).each(function(idx) {		
         
         // 중심마커가 표시될 위치입니다
         var markerPosition = new kakao.maps.LatLng(this.latitude, this.longitude);

         // 마커를 생성합니다
 	     var marker = new kakao.maps.Marker({
 	         position: markerPosition,
 	         text : '내 위치'
 	         
 	     });
 	
 	     // 마커가 지도 위에 표시되도록 설정합니다
 	    marker.setMap(map);
 	    bounds.extend(markerPosition);
 	    
         
    	});
        
    	
    	
    	if(hospitals.length > 0)
    	map.setBounds(bounds);

        
    }
</script>
</body>
</html>