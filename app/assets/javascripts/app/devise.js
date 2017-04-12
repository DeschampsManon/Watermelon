function devise_form(){
    var input = ($("#admin-devise .input-container input"));

    input.each(function(){
        $(this).after("<div class='input-border-focus'></div>")
        if( $(this).val() ){
            $(this).parent().find("label").animate({ bottom: "3.5rem" }, 400 );
            $(this).parent().addClass("active");
            console.log($(this).val());
        }
    });

    input.focus(function(){
        $(this).parent().find(".input-border-focus").animate({ left : 0 }, 400);
        $(this).parent().find("label").animate({ bottom: "3.5rem" }, 400 );
        $(this).parent().addClass("active");

    });

    input.blur(function(){
        $(this).parent().find(".input-border-focus").animate({ left : "-100%" }, 400);
        if( !$(this).val() ){
            $(this).parent().find("label").animate({ bottom: ".45rem" }, 400 );
            $(this).parent().removeClass("active");
        }
    })
}

$(document).ready(function(){
    devise_form();
});