//랜덤한 색상을 리턴하는 함수 getRandomColor
function getRandomColor() {
    const r = Math.floor(Math.random()*240);
    // const g = Math.floor(Math.random()*256);
    // const b = Math.floor(Math.random()*256);

    return "rgb("+r+","+r+","+r+")";
}//getRandomColor() end