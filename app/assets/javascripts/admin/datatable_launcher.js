function datatable_params(){
    $('.datatable').DataTable({
        responsive: true,
        "language" : {
            search:         "",
            info:           I18n.translate('datatable_info'),
            zeroRecords:    I18n.translate('datatable_zeroRecords'),
            infoEmpty:      I18n.translate('datatable_infoEmpty'),
            paginate: {
                previous:   '<',
                next:       '>',
            },
        },
        stateSave: true,
    });
}

$(document).ready(function() {
    datatable_params();
});
