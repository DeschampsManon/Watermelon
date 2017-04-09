function blocksIt_params() {
    $('.gallery').BlocksIt({
        numOfCol: 5,
        offsetX: 8,
        offsetY: 8
    });
}

var currentWidth = 100;
function blocksIt_responsive() {
    var winWidth = $(window).width();
    var conWidth;
    if(winWidth < 660) {
        conWidth = 440;
        col = 2
    } else if(winWidth < 880) {
        conWidth = 660;
        col = 3
    } else if(winWidth < 1100) {
        conWidth = 880;
        col = 4;
    } else {
        conWidth = 1100;
        col = 5;
    }

    if(conWidth != currentWidth) {
        currentWidth = conWidth;
        $('.gallery').width(conWidth);
        $('.gallery').BlocksIt({
            numOfCol: col,
            offsetX: 8,
            offsetY: 8
        });
    }
}

$(document).ready(function(){
    blocksIt_params();
})

$(window).resize(function() {
    blocksIt_responsive();
});