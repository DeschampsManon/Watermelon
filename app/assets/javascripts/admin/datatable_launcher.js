function datatable_params(){
    $('.datatable').DataTable({
        responsive: true,
        "language" : {
            search:         "",
            info:           I18n.translate('datatable_info'),
            paginate: {
                previous:   '<',
                next:       '>',
            },
        }
    });
    // $('.datatable').DataTable({
    //     "language" : {
    //         processing:     I18n.datatable_processing,
    //         search:         "",
    //         lengthMenu:     I18n.datatable_lengthMenu,
    //         info:           I18n.datatable_info,
    //         infoEmpty:      I18n.datatable_infoEmpty,
    //         infoFiltered:   I18n.datatable_infoFiltered,
    //         infoPostFix:    "",
    //         loadingRecords: I18n.datatable_loadingRecords,
    //         zeroRecords:    I18n.datatable_zeroRecords,
    //         emptyTable:     I18n.datatable_emptyTable,
    //         paginate: {
    //             first:      I18n.datatable_paginate_first,
    //             previous:   '<i class="fa fa-arrow-left"></i>',
    //             next:       '<i class="fa fa-arrow-right"></i>',
    //             last:       I18n.datatable_paginate_last
    //         },
    //         aria: {
    //             sortAscending:  I18n.datatable_aria_sortAscending,
    //             sortDescending: I18n.datatable_aria_sortDescending
    //         },
    //     },
    //     stateSave: true,
    // });
}

$(document).ready(function() {
    datatable_params();
});
