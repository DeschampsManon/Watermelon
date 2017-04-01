$(document).ready(function(){
    dataConfirmModal.setDefaults({
        title: I18n.translate('confirm_delete_title'),
        commit: I18n.translate('confirm_delete_accept'),
        cancel: I18n.translate('confirm_delete_refuse')
    });
})