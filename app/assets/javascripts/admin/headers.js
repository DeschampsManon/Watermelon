var main_header, main_header_width;

function page_width(main_header_width){
    var window_width = $(window).width();
    var calc_width = window_width - main_header_width;
    if( calc_width != 0){
        $(".page").animate({ width : calc_width+"px" }, {duration: 200, easing: 'easeOutBack'});
    } else {
        $(".page").animate({ width : "100%" }, 200);
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
    main_header.animate({ width : "30rem"}, {duration: 300, easing: 'easeOutBack'});
    main_header.removeClass("min-nav");
    main_header.css({ left : 0 });
    $("#min-nav-btn").removeClass("active");
    if(btn_clicked == true){
        $("#min-nav-btn").html("format_indent_decrease");
        $("#company-data > div").first().removeClass("hidden");
    }

    main_header_width = 300
    page_width(main_header_width)
}

function min_nav(btn_clicked){
    main_header.addClass("min-nav");
    main_header.animate({ width : "10rem"}, {duration: 300, easing: 'easeOutBack'});
    main_header.css({ left : 0 });
    if(btn_clicked == true){
        $("#min-nav-btn").addClass("active").html("format_indent_increase");
        $("#company-data > div").first().addClass("hidden");
    }

    main_header_width = 100
    page_width(main_header_width)
}

function mobile_nav(){
    main_header.removeClass("min-nav");
    main_header.animate({ width : "100%"}, 150, function () {
        page_width();
    });
    main_header.css({ left : "-100%" });

    main_header_width = $(window).width();
    page_width(main_header_width)
}

function responsive_nav(boolean){
    if( boolean == true){
        $("#main-header").animate({ left : "0" }, {duration: 800, easing: 'easeOutBack'});
    } else {
        $("#main-header").animate({ left : "-100%" }, {duration: 800, easing: 'easeInBack'});
    }
}

$(document).ready(function () {
    main_header = $("#main-header");
    change_main_nav_width();
    $("#min-nav-btn").click(function(){
        if($("#main-header").hasClass("min-nav")){
            max_nav(true);
        } else {
            min_nav(true);
        }
    });
    $("#burger-menu-open").click(function(){
        responsive_nav(true)
    });
    $("#burger-menu-close").click(function(){
        responsive_nav(false)
    });
})

$(window).resize(function () {
    change_main_nav_width();
})
