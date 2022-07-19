<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
	//User user = (User)session.getAttribute("loginUser");
	//int userNo = user.getNo();
	String questionNo = request.getParameter("questionNo");
	int userNo = 3;

	
%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
   <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/quill.snow.css"/>
    <link rel="stylesheet" href="/css/expertAnswer.css"/>

</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
    <div id="banner">
        <img id="bannerLogo" src="img/img_footerlogo.png">
        <div id="bannerIntro">
             <h2>반하디만의</h2>
             <h1>전문가상담</h1>
        </div>
        <img id="question" src="img/question.png">
        <img id="answer" src="img/banneranswer.png">
    </div><!--banner end-->

<form id="writeForm" action="/writeAnswer.coco" method="post" onkeydown="return captureReturnKey(event)">
    <!-- 실제 서버로 넘어가는 파라미터는 이놈!! -->
    <input type="hidden" id="contents" name="contents" />
	<input type="hidden" id="userNo" name="userNo" value="<%=userNo %>"/>
	<input type="hidden" id="questionNo" name="questionNo" value="<%=questionNo %>"/>

    <!--전문가 답변 작성 폼-->
    <div id="answerForm">


        <!--전문가답변 작성 내용-->
        <div class="answer_contents">
            <div id="standalone-container">
                <div id="toolbar-container">
                    <span class="ql-formats">
                        <select class="ql-size">
                            <option>10px</option>
                            <option>15px</option>
                            <option>20px</option>
                            <option>28px</option>
                            <option>36px</option>
                            <option>48px</option>
                        </select>
                    </span>
                    <span class="ql-formats">
                        <button class="ql-bold"></button>
                        <button class="ql-italic"></button>
                        <button class="ql-underline"></button>
                        <button class="ql-strike"></button>
                    </span>
                    <span class="ql-formats">
                        <select class="ql-color"></select>
                        <select class="ql-background"></select>
                    </span>
                    <span class="ql-formats">
                        <button class="ql-list" value="ordered"></button>
                        <button class="ql-list" value="bullet"></button>
                        <button class="ql-indent" value="-1"></button>
                        <button class="ql-indent" value="+1"></button>
                    </span>

                    <span class="ql-formats">
                        <button class="ql-link"></button>
                        <button class="ql-image"></button>
                    </span>
                </div>
                <div id="editor-container"></div>
            </div>
        </div><!--.answer_contents end-->
        
        <!--전문가답변 작성 footer-->
        <div class="answer_footer">
            <!--추천 진료과목 선택-->
            <div class="recommended_treatment">
                <!--여기에 추천진료과목 추가-->
                <ul class="recommended_treatment_list">

                </ul>
                <!--검색 드롭다운-->
                <div class="dropdown">
                    <button class="dropbtn" type="button">추천 진료과목</button>
                    <div id="myDropdown" class="dropdown_content">
                        <input type="text" placeholder="추천 진료과목" id="myInput" autocomplete="off">
                        <ul>
                        </ul>
                    </div>
                </div>
            </div>
        </div><!--.answer_footer end-->

    </div><!--#answerForm end-->

    <!--임시저장, 답변등록, 질문목록 버튼-->
    <div class="btn_area double">
        <button id="tempSaveBtn">임시저장</button>
        <button id="questionBtn">답변등록</button>
    </div>

</form>
<%@ include file="/WEB-INF/template/footer.jsp" %>

<script type="text/template" id="treatmentTmpl">
	<input type="hidden" id="medicalsNo" name="medicalsNo" value=<@=no@> />
    <li><@=name @><i class="far fa-times-circle"></i></li>
    <!--해당하는 이름 넣기-->
</script>

<script type="text/template" id="search_treatmentTmpl">
    <@ _.each(diagnosisList, function(diagnosis){ @>
    
    	<li data-no = <@=diagnosis.no@>><@= diagnosis.name @></li>
    
    <@ }); @>
</script>

<script src="js/underscore-min.js"></script>
<script src="js/quill.min.js"></script>
<script src="js/jquery.js"></script>
<script>
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };

    //템플릿
    const treatmentTmpl = _.template($("#treatmentTmpl").html());
    const $recommendedTreatment = $(".recommended_treatment_list");
    const searchTreatmentTmpl = _.template($("#search_treatmentTmpl").html());
    const dropdownList = $(".dropdown ul");
    const $myDropdown = $("#myDropdown");
    const $myInput = $("#myInput");   //자동완성 드롭다운 안에 있는 li요소를 클릭하면 추가된다.
    $(document).on("click","#myDropdown li",function (e) {
    	$myDropdown.removeClass("show");
    	$myInput.val("");
        e.preventDefault();
        // alert();
        if($(".recommended_treatment_list li").length>3) {
            alert("진료선택은 4개까지 가능합니다!")
        }else {
            // $recommendedTreatment.append(treatmentTmpl());
            $recommendedTreatment.append(treatmentTmpl({no: $(this).data("no"), name: $(this).text()}));
           	console.log();
        }
    });//button click end

    //추천진료 클릭 시 삭제
    $(document).on("click",".recommended_treatment_list li",function () {
        $(this).remove();
    });
   
    const $contents = $("#contents");

    //글 작성 에디터 툴바리스트
    $("#writeForm").submit(function (e) {


        const contents = quill.getContents();
    
    
        // 첫번째 값이 엔터면 아무것도 글자를 쓰지 않았음
        if(contents.ops[0].insert=="\n") {
            alert("글자를 입력해주세요!");
            $contents.focus();
            return false;
        }else {

            const contentString =JSON.stringify(contents);
            //input type=hidden에 value로 세팅
            $("#contents").val($(".ql-editor").html());
 
            return true;
        }

    });//#writeForm submit() end

    var quill = new Quill('#editor-container', {
        modules: {
            toolbar: {container:'#toolbar-container',
                //이미지 선택시 파일 업로드를 위해서
                handlers: {
                    'image': selectLocalImage
                }
            }
        },
        theme: 'snow'
    });

    function selectLocalImage() {

        const input = $("<input type='file'>");
        input.click();

        input.on("change",function() {

            const file = this.files[0];

            if (/^image\//.test(file.type)) {

                //alert("여기에 오면 파일이 있고 사진임");

                //multipart/form-data에 필요함
                const formData = new FormData();
			
                formData.append("uploadImage", file, file.name);
			

                //여기서 ajax로 파일 업로드 수행
                $.ajax({
                    url:"/ajax/uploadAnswerImage.json",
                    processData : false,//multipart/form-data
                    contentType : false,//multipart/form-data
                    data : formData,//multipart/form-data
                    type : 'POST',//multipart/form-data
                    dataType : "json",
                    error : function(xhr, error, code) {
                        alert("에러:" + code);
                    },
                    success:function(json) {
                        const range = quill.getSelection();
                        console.log(range);

                        let idx = 0;
                        if(range!=null) {
                            idx = range.index;
                        }

                        quill.insertEmbed(idx, "image", "/imgAnswer/"+json.imageName);
                        quill.insertText( quill.getSelection() + 1, ' ', Quill.sources.SILENT);

                    }
                });


            } else {
                alert("이미지를 선택해주세요!");
            }
        })
    }//selectLocalImage() end


    var Size = Quill.import('attributors/style/size');
    Size.whitelist = ['10px','15px','20px', '28px', '36px','48px'];
    Quill.register(Size, true);




    function captureReturnKey(e) { 
        if(e.keyCode==13 && e.srcElement.type != 'textarea') 
        return false; 
    } 



    //자동완성 드롭다운 버튼
    /* When the user clicks on the button,
	toggle between hiding and showing the dropdown content */
	
    $(".dropbtn").on("click",function () {
        $myDropdown.toggleClass("show")
    });//.dropbtn click end


    $myInput.on("keyup",function () {
        getDiagnosisList($(this).val());
    });//#myInput keyup end

    function getDiagnosisList(searchText) {
	
        $.ajax({
            url:"/ajax/medicals.json",
         	data : {search : searchText},//multipart/form-data
            type : 'GET',//multipart/form-data
            dataType : "json",
            error: function () {
                //alert("해당 서비스 점검중입니다. 나중에 시도해주세요.");
            },
            success: function (json) {
    
                dropdownList.html(searchTreatmentTmpl({diagnosisList: json}));

            }
        });

    }//getDiagnosisList end

    




</script>


</body>
</html>