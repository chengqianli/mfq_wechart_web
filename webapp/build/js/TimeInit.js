// 日期初始化js
$(document).ready(
    function () {
        var beginTimeStore = '';
        var endTimeStore = '';
        $('#reservation_table').daterangepicker(
            {
                "linkedCalendars": false,
                "autoUpdateInput": false,
                "locale": {
                    format: 'YYYY-MM-DD',
                    separator: ' ~ ',
                    applyLabel: "应用",
                    cancelLabel: "清除",
                },
            },
            function (start, end, label) {
                beginTimeStore = start;
                endTimeStore = end;
                console.log(this.startDate.format(this.locale.format));
                console.log(this.endDate.format(this.locale.format));
                if (!this.startDate) {
                    this.element.val('');
                } else {
                    this.element.val(this.startDate
                            .format(this.locale.format)
                        + this.locale.separator
                        + this.endDate.format(this.locale.format));
                }
            });

    })

// 日期格式的格式化

$(document).ready(function () {
    var beginTimeTake;
    $('#single_cal3_table').daterangepicker({
        singleDatePicker: true,
        // showDropdowns: true,
        "locale": {
            format: 'YYYY-MM-DD',
        }
    }, function (start, end, label) {
        beginTimeTake = start;
        if (!this.startDate) {
            this.element.val('');
        } else {
            this.element.val(this.startDate.format(this.locale.format));
        }
    })
})