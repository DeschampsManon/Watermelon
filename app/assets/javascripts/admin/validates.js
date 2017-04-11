function validate_params() {
    $.extend($.validator.messages, {
        required: I18n.translate('validate_required'),
        maxlength: I18n.translate('validate_maxlength'),
        minlength: I18n.translate('validate_minlength'),
        equalTo: I18n.translate('validate_equalTo'),
        remote: "Please fix this field.",
        email: I18n.translate('validate_email'),
        url: "Please enter a valid URL.",
        date: "Please enter a valid date.",
        dateISO: "Please enter a valid date (ISO).",
        number: "Please enter a valid number.",
        digits: "Please enter only digits.",
        creditcard: "Please enter a valid credit card number.",
        accept: "Please enter a value with a valid extension.",
        rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
        range: jQuery.validator.format("Please enter a value between {0} and {1}."),
        max: jQuery.validator.format("Please enter a value less than or equal to {0}."),
        min: jQuery.validator.format("Please enter a value greater than or equal to {0}.")
    });
}

$(document).ready(function () {
    validate_params();
    $("#user-form").validate({
        rules: {
            "user[email]": {
                email: true
            }
        },
        messages: {
        },
        errorElement: "span",
        highlight: function(element) {
            $(element).wrap("<div class='form-error-container'></div>");
        },
        unhighlight: function(element) {
            //$(element).parents().removeClass("form-error-container");
        }
    });
    $("#category-form").validate({
        rules: {
        },
        messages: {
        },
        errorElement: "span",
        highlight: function(element) {
            $(element).wrap("<div class='form-error-container'></div>");
        },
        unhighlight: function(element) {
            //$(element).parents().removeClass("form-error-container");
        }
    });
    $("#post-form").validate({
        rules: {

        },
        messages: {
        },
        errorElement: "span",
        highlight: function(element) {
            $(element).wrap("<div class='form-error-container'></div>");
        },
        unhighlight: function(element) {
            //$(element).parents().removeClass("form-error-container");
        }
    });
    $("#update-password-form").validate({
        rules: {
            "user[current_password]" : {
                minlength: 8
            },
            "user[password]" : {
                minlength: 8
            },
            "user[password_confirmation]" : {
                minlength: 8,
                equalTo: "#user_password"
            }
        },
        messages: {
        },
        errorElement: "span",
        highlight: function(element) {
            $(element).wrap("<div class='form-error-container'></div>");
        },
        unhighlight: function(element) {
            //$(element).unwrap("<div class='form-error-container'></div>");
        }
    });
});
