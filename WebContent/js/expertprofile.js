

const profileCareerTmpl = _.template($("#profileCareerTmpl").html());
const $careerList = $(".career_list ul");

const $badgePopup = $(".popup_badge_total_btn");
const $popupArea = $(".popup_badge_total_bg");
const $popupContent = $(".popup_badge_total");

// 뱃지 전체보기 버튼을 클릭했을때
$badgePopup.click(function () {
    $popupArea.toggleClass("on");
    $popupContent.toggleClass("on");
    $("html").css({
        overflow:"hidden"
    });
    $("#content, #header").css({
        paddingRight:"17px"
    });
    $(".aux").css({
        left:"-8px"
    })
});//#btn_career_list_plus click()

$popupArea.click(function (){
    $popupArea.toggleClass("on");
    $popupContent.toggleClass("on");
    $("html").css({
        overflow:"visible"
    });
})

// 컨텐트 탭을 눌렀을 때
$(".masterProfileTap li").click(function (e) {
    e.preventDefault();
    $(".on").removeClass("on");
    $(this).addClass("on");
    const idx = $(this).index();
    $(".tab").eq(idx).addClass("on");
});//.shop_tab li click() end


// 추가버튼을 클릭했을때
$(".btn_career_list_plus").click(function () {

    $(".career_input_area").toggleClass("on");
    if($(".career_input_area").hasClass("on")){
        $(".btn_career_list_plus").text("저장");
        $(".career_list").css({height:"266px",});
    }else{
        let startYearValue = $(".select_start_year").val();
        let endYearValue = $(".select_end_year").val();
        let placeValue = $(".input_place").val();
        $(".btn_career_list_plus").text("추가");
        $(".career_list").css({height:"330px",});
        $careerList.append(profileCareerTmpl({startYear: startYearValue, endYear: endYearValue,placeName: placeValue}));
    }
});//#btn_career_list_plus click()


//새로 생성된 요소는 3개짜리를 쓴다
// 세번째가 새로 생성된 애를 넣는 부분
$(".career_list").on("click",".career_detail",function () {
    $(this).parent().remove();
});//#btn_career_list_plus click()

let phoneNumValue = $(".doctor_info .phone_num");

phoneNumValue.click(function () {

})


