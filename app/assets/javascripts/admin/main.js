$(document).ready(function () {
    $(".select2").select2({
        theme: "bootstrap",
        "language": {
            "noResults": function(){
                return I18n.translate('select2_noResults');
            }
        }
    });
})