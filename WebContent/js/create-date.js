
	const $year = $("#year");
	const $month = $("#month");
	const $date = $("#date");
	
	//년과 월을 생성하는 함수
	function createYearMonth(){
		
		const now = moment();//현재
		
		//월을 생성
		for (let i = 1; i < 13; i++) {
			$("<option>").text(i).appendTo($month);			
		}//for end
		
		//년을 생성
		for(let i = now.year();i>=now.year()-120 ;i-- ){
			$("<option>").text(i).appendTo($year);
		}
		
		//마지막 날짜 계산하여 생성
		createDate();
		
	}//createYearMonth() end
	
	createYearMonth();
	
	//유저가 선택한 현재 년도와 월을 가지고 해당하는 날짜를 생성하는 함수
	function createDate(){
		
		//유저가 선택한 년도
		const year = $year.val();
		//유저가 선택한 월
		const month = $month.val();
		//유저가 선택한 날짜
		const date = $date.val();
		
		//마지막일자
		const lastDate = moment([year,month-1]).daysInMonth();
		
		//갱신될때마다 비워주기
		$date.empty();
		
		//구한 마지막 일자까지 날짜 생성
		for(let i = 1; i<=lastDate ; i++){
			$("<option>").text(i).appendTo($date);
		} 
		
	}//createDate() end
	
	$year.change(createDate);
	$month.on("change",createDate);
