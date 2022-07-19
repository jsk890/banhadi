function getShuffle(length) {

    let numbers = [];

    //for문으로 1~length+1까지의 수를 0~length번지까지 입력
    for( let i = 0 ; i < length  ; i++ ) {
        numbers.push(i+1);
    }//for end

    //섞음
    for(let i = 0 ; i < length ; i++ ) {
        //해당번지의 수를 임시저장
        let tmp = numbers[i];
        //0~length-1까지의 난수 발생
        let idx = Math.floor(Math.random()*length);

        console.log(idx);

        //랜덤한 번지수를 i번지에 대입
        numbers[i] = numbers[idx];
        //랜덤한 번지수에 i번지의 값을 대입
        numbers[idx] = tmp;

        console.log(numbers);
        
    }//for end


    return numbers;
}//getShuffle() end