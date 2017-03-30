function get_domain_name(){
    var domain_name = document.domain;
    $("#browser-preview .domain-name").html($.trim(domain_name)+"/");
}

function browser_search_result_preview() {
    var value = $(this).val();
    var limit, target;

    if ($(this).attr("id") == "admin_page_page_title"){
        target = $("#browser-preview .page-title");
        limit = 70;
    } else if ($(this).attr("id") == "admin_page_meta_description"){
        target = $("#browser-preview .page-description");
        limit = 156;
    } else if ($(this).attr("id") == "admin_page_name"){
        target = $("#browser-preview .page-name-slug");
        value = value.replace(/\s+/g, '_')
    }

    if (value.length > limit) {
        var new_value =  value.substring(0, limit)+"...";
        target.html(new_value);
        $(this).parent().find(".chars-count").addClass("error");
    } else {
        target.html(value);
        $(this).parent().find(".chars-count").removeClass("error");
    }

    $(this).parent().find(".chars-count span").text(limit - value.length);
}

$(document).ready(function () {
    get_domain_name()
    $("#admin_page_page_title, #admin_page_meta_description, #admin_page_name").keyup(browser_search_result_preview);
})