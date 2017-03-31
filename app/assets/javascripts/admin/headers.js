function page_width(){
    var main_header_width = $("#main-header").width();
    var window_width = $(window).width();
    var calc_width = window_width - main_header_width;
    if( $("#main-header").position().left == 0){
        $(".page").css("width", calc_width+"px");
    } else {
        $(".page").css("width", "100%");
    }
}

function change_main_nav_width(){
    if( $(window).width() >= 1300 ){
        max_nav(false);
    } else if ( $(window).width() <= 1300 && $(window).width() >= 760 ) {
        min_nav(false);
    } else {
        mobile_nav();
    }
}

function max_nav(btn_clicked){
    var main_header = $("#main-header");
    main_header.animate({ width : "30rem"}, {duration: 300, easing: 'easeOutBack'}, function(){
        page_width();
    });
    main_header.removeClass("min-nav");
    main_header.css({ left : 0 });
    $("#min-nav-btn").removeClass("active");
    if(btn_clicked == true){
        $("#min-nav-btn").html("format_indent_decrease");
        $("#company-data > div").first().removeClass("hidden");
    }
}

function min_nav(btn_clicked){
    var main_header = $("#main-header");
    main_header.addClass("min-nav");
    main_header.animate({ width : "10rem"}, {duration: 300, easing: 'easeOutBack'}, function(){
        page_width();
    });
    main_header.css({ left : 0 });
    if(btn_clicked == true){
        $("#min-nav-btn").addClass("active").html("format_indent_increase");
        $("#company-data > div").first().addClass("hidden");
    }
}

function mobile_nav(){
    var main_header = $("#main-header");
    main_header.removeClass("min-nav");
    main_header.animate({ width : "100%"}, 150, function(){
        page_width();
    });
    main_header.css({ left : "-100%" });
}

$(document).ready(function () {
    change_main_nav_width();
    $("#min-nav-btn").click(function(){
        if($("#main-header").hasClass("min-nav")){
            max_nav(true);
        } else {
            min_nav(true);
        }

    });
})

$(window).resize(function () {
    change_main_nav_width();
})