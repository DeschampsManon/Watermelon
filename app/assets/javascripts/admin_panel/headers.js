function page_width(){
    var main_header_width = $("#main-header").width();
    var window_width = $(window).width();
    var calc_width = window_width - main_header_width;
    $(".page").css("width", calc_width+"px");
}

$(document).ready(function () {
    page_width();
})

$(window).resize(function () {
    page_width();
})