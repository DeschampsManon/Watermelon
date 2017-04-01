function select2_params(){
    $(".select2").select2({
        theme: "bootstrap",
        "language": {
            "noResults": function(){
                return I18n.translate('select2_noResults');
            }
        }
    });
}

$(document).ready(function() {
    select2_params();
});
