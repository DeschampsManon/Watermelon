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

var $iframe, $current_main_container;

function set_layout_config(element){
    layout = element.toString();
    layout_array = layout.split(",");
}

function display_columns_list() {
    var text;
    $("#columns-layout li").each(function(){
        set_layout_config($(this).data("layout"));
        for ($i = 0; $i < layout_array.length; $i++ ){
            var column_width = layout_array[$i];
            var column_class = 'col-md-'+column_width;
            if ( column_width.indexOf(9) > -1 ){
                text = "3/4"
            } else if ( column_width.indexOf(8) > -1 ) {
                text = "2/3"
            } else if ( column_width.indexOf(6) > -1 ) {
                text = "1/2"
            } else if ( column_width.indexOf(4) > -1 ) {
                text = "1/3"
            } else if ( column_width.indexOf(3) > -1 ) {
                text = "1/4"
            } else {
                text = ""
            }
            $(this).find(".pattern").append("<div class='"+column_class+"'><div class='column'>"+text+"</div></div>");
        }
    });
}

function change_colums_layout(){
    var change_column_url = $(this).closest("#columns-layout").data("url");
    set_layout_config($(this).data("layout"));
    $.ajax({
        url: change_column_url,
        data: {
            layout: JSON.stringify(layout_array)
        },
        dataType: "script"
    });
}

function main_container_settings(e) {
    e.preventDefault();
    var setting_clicked = $(this).attr("class");
    $iframe.find(".main-container").removeClass("current-container");
    $(this).closest(".main-container").addClass("current-container");
    $current_main_container = $iframe.find(".current-container");
    if(setting_clicked == "column-main-container") {
        $("#columns-modal").modal('show');
    } else if (setting_clicked == "duplicate-main-container") {
        var clone = $current_main_container.clone();
        $current_main_container.after(clone);
    } else if (setting_clicked == "delete-main-container") {
        $current_main_container.remove();
    }
}

$(document).ready(function () {
    get_domain_name()
    $("#admin_page_page_title, #admin_page_meta_description, #admin_page_name").keyup(browser_search_result_preview);
    display_columns_list();
    $("#columns-layout li").click(change_colums_layout);
    $("iframe#preview-page-builder").on('load', function () {
        $iframe = $(this).contents();
        $iframe.off("click", ".main-container .main-container-settings a").on("click", ".main-container .main-container-settings a", main_container_settings);
    })
});