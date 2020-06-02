var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editMemberName = $('#edit-memberName');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editCreateDate = $('#edit-createDate');
var editStartHour = $('#edit-startHour');
var editEndHour = $('#edit-endHour');
var editThumbnail = $('#edit-thumbnail');
var editContent = $('#edit-content');
var editCategory = $('#edit-category');
var editAddress = $('#edit-address');
var editColor = $('#edit-color');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */

function getQueryStringObject() {
    var a = window.location.search.substr(1).split('&');
    if (a == "") return {};
    var b = {};
    for (var i = 0; i < a.length; ++i) {
        var p = a[i].split('=', 2);
        if (p.length == 1)
            b[p[0]] = "";
        else
            b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
    }
    return b;
}

var gq = getQueryStringObject()
var groupNo = gq.groupNo;
console.log(groupNo);
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editCategory.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editContent.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    var eventId = Number(planNo) + 1;
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

        var eventData = {
            _id: eventId,
            title: editTitle.val(),
            startDate: editStart.val(),
            endDate: editEnd.val(),
            startHour: editStartHour.val(),
            endHour: editEndHour.val(),
            content: editContent.val(),
            category: editCategory.val(),
            memberName: editMemberName.val(),
            thumbnail: editThumbnail.val(),
            address: editAddress.val(),
            createDate: editCreateDate.val(),
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        //새로운 일정 저장
        $.ajax({
            type: "get",
            url: "",
            data: {
                //.....
            },
            success: function (response) {
                //DB연동시 중복이벤트 방지를 위한
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            }
        });
        console.log(eventId);
    });
};