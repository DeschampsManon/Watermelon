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

function get_current_container(element) {
    $iframe.find(".main-container").removeClass("current-container");
    var $current_container;
    if (element.hasClass("no-module")) {
        $current_container = element.closest("article")
    } else {
        $current_container = element.closest(".main-container");
    }
    $current_container.addClass("current-container");
}

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
    get_current_container($(this));
    $current_main_container = $iframe.find(".current-container");
    if(setting_clicked == "column-main-container") {
        $("#columns-modal").modal('show');
    } else if (setting_clicked == "duplicate-main-container") {
        var clone = $current_main_container.clone();
        clone.find("#settings-blocks").remove();
        $current_main_container.after(clone);
        clone.animate({ top: "5.8rem"});
    } else if (setting_clicked == "delete-main-container") {
        $current_main_container.remove();
    } else if ( setting_clicked == "edit-main-container") {
        $("#form-container-settings").modal('show');
        set_css_properties();
    }
}

function set_css_properties() {
    $element = $("#form-container-settings input");
    $element.each(function () {
        var property = $(this).attr("rel");
        var container_property = $iframe.find(".current-container").css(property)
        if (container_property != "none") {
            if (property == "background-color") {
                if (container_property != "rgba(0, 0, 0, 0)"){
                    rgb2hex($iframe.find(".current-container").css("background-color"));
                    $(this).val(new_color);
                    $("#background-color-preview").css(property,new_color);
                } else {
                    $(this).val("transparent");
                }
            } else {
                $(this).val(container_property);
            }
        }
    })

    $element.keyup(function () {
        var property = $(this).attr("rel");
        var value = $(this).val();
        $iframe.find(".current-container").css(property,value);
        if (property == "background-color") {
            $("#background-color-preview").css(property,value);
        }
    });
}

function add_block(e){
    e.preventDefault();
    var action_clicked = $(this).attr("id");
    var page_id = $(this).closest("ul").data("id");
    get_current_container($(this));
    if(action_clicked == "add-main-container") {
        $.ajax({
            url: "/admin/pages/"+page_id+"/add_section",
            dataType: "script"
        });
    }
}

var new_color;
function rgb2hex(rgb) {
    rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
    function hex(x) {
        return ("0" + parseInt(x).toString(16)).slice(-2);
    }
    new_color = "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}

function choose_module() {
    $("#modules-modal").modal('show');
    get_current_container($(this));
}

function change_module(){
    var change_module_url = $(this).closest("#modules-type").data("url");
    var module_type = $(this).data("type");
    $.ajax({
        url: change_module_url,
        data: {
            module: module_type
        },
        dataType: "script"
    });
}

var module
function module_modal_closed_event() {
    module = $(this).data("module");
    switch(module) {
        case 'text':
            module_text($(this));
            break;
        case n:
            //code block
            break;
    }
    $(this).remove();
    $iframe.find(".current-container").removeClass("current-container");
}

function module_text(element) {
    var content = element.find(".fr-view");
    var new_text;
    if (content.text()) {
        new_text = content.html();
        $iframe.find(".current-container").addClass("present-module")
                                          .removeClass("no-module")
                                          .html(new_text);
    } else {
        module_empty();
    }
}

function module_empty() {
    $iframe.find(".current-container .no-module").addClass("empty-module")
                                                 .removeClass("no-module")
                                                 .html("<p>"+I18n.translate(module)+"<i class='material-icons reset-module'>close</i></p>");
}

function reset_module() {
    $(this).closest(".empty-module").addClass("no-module")
                                    .removeClass("empty-module")
                                    .html("<p>"+I18n.translate('admin.pages.editor.module_container.add_module')+"</p>");
}

function set_page_source() {
    var src = $iframe.find("body").html();
    $("#admin_page_source").val(src);
}

$(document).ready(function () {
    get_domain_name()
    $("#admin_page_page_title, #admin_page_meta_description, #admin_page_name").keyup(browser_search_result_preview);
    display_columns_list();
    $("#columns-layout li").click(change_colums_layout);
    $("#modules-type li").click(change_module);
    $(document).on('hide.bs.modal','#module-choosen', module_modal_closed_event);
    $("#page-builder-form").submit(set_page_source)
    $("iframe#preview-page-builder").on('load', function () {
        $iframe = $(this).contents();
        $iframe.off("click", ".main-container .main-container-settings a").on("click", ".main-container .main-container-settings a", main_container_settings);
        $iframe.off("click", ".add-block a").on("click", ".add-block a", add_block);
        $iframe.off("click", ".module-container .no-module").on("click", ".module-container .no-module", choose_module);
        $iframe.off("click", ".module-container .reset-module").on("click", ".module-container .reset-module", reset_module);
    })
});