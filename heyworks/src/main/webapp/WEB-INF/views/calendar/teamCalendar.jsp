<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css">
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
    <link rel="stylesheet" type="text/css" href="resources/calendar/dist/tui-calendar.css">
    <link rel="stylesheet" type="text/css" href="resources/calendar/css/default.css">
    <link rel="stylesheet" type="text/css" href="resources/calendar/css/icons.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
    <script src="https://uicdn.toast.com/tui.time-picker/v2.0.3/tui-time-picker.min.js"></script>
    <script src="https://uicdn.toast.com/tui.date-picker/v4.0.3/tui-date-picker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chance/1.0.13/chance.min.js"></script>
	<script src="resources/calendar/dist/tui-calendar.js"></script>
 <style>
    .outer{
        width:1200px;
        height:1200px;
        margin:auto;
    }
    .outer>div{float:left;}
    .contents{
    position: relative;
        margin: auto;
        width: 1130px;
        height:800px;
        border: 1px solid lightgray;
    }
   #header{
        width: 1200px;
        height: 50px;
        margin-top: 20px;
        border: 1px solid lightgray;
        margin:auto;
    }
    #header>div{float: left; height: 100%;}
    #logo{width: 252px;}
    #main{width: 800px;}
    #main *{float: left;}
    #main img{
        margin-top: 15px;
        width: 25px;
        height: 25px;
    }
    #main p{
        margin-top: 10px;
        margin-left: 10px;
        font-size: 24px;
        font-weight: 700;
        color: black;
    }
    #icon{width: 145px;}
    #icon *{float: left;}
    #icon>a{
        width: 50%;
        height: 100%;
    }
    #icon img{
        width: 30px;
        height: 30px;
        margin-top: 10px;
        margin-left: 30px;
    }
    #sidebar{
        width: 70px;
        height: 800px; 
        margin:auto;      
    }
    #sidebar>div{float: left; height: 100%;}
    #mini{
        width: 70px;
        background-color: rgb(63, 145, 213)
    }
    #mini>ul{padding: 0px;}
    #mini li{
        width: 100%;
        height: 65px;
        list-style-type: none;
        padding: 0px;
        margin: 0px;
    }
    #mini img{    
        width: 100%;
        height: 100%;
        padding: 18px;
    }
    
    #logout{
    position: relative;
     width: 100%;
        height: 65px;
        list-style-type: none;
        top:130px;       
    }      
     #logout img{
    	width: 100%;
        height: 100%;
        padding: 13px;  
    }
    
  
 	#profile{
		border-radius:100%; 	
 	}
 	
 	#team a{
 	text-decoration:none; 
 	color:black; 
 	font-size:15px;
 	font-weight:bold;
 	}
 	
 	#team{
        
        background-color: rgba(24, 121, 201, 0.2);
    }
    
</style>
 
 </head>
 <body>
 
<div class="outer">
 
       <c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>


	<div id="header">
        <div id="logo">
            <a href="main.do">
                <img src="resources/images/LOGO.JPG" width="180px" height="35px" style="margin-left:20px; margin-top: 10px;">
            </a>
        </div>
        <div id="main">
            <a href="">
                <img src="resources/images/dots.png">
                <p>MAIN</p>
            </a>
        </div>
        <div id="icon">
            <a href="">
                <img src="resources/images/miniletter.png" id="letter">
            </a>
            <a href="myPage.em">
                <img src="resources/images/user.jpg" id="profile">
            </a>
        </div>
    </div>

    <div id="sidebar">
        <div id="mini">
            <ul>
                <li><a href="">
                    <img src="resources/images/letter.png">
                </a></li>
                <li><a href="main.wo">
                    <img src="resources/images/bag.png">
                </a></li>
                <li><a href="main.el">
                    <img src="resources/images/approval.png">
                </a></li>
                <li><a href="">
                    <img src="resources/images/board.png">
                </a></li>
                <li><a href="myCalendar.ca">
                    <img src="resources/images/calendar.png">
                </a></li>
                
                <li>
                	<div id="todoplus">
                		<a href="todolist.to"> <img src="resources/images/todo.png"></a>
                	</div>
                </li>
                
                	
                <li>
                	<div id="reservation">
                	<a href="myReserve.re"> <img src="resources/images/key.png"></a>
                    </div>
                </li>
                
                <li>
                	<div id="addressbook">
               		 <a href="likeAddress.ad"><img src="resources/images/addressbook.png"></a>
                    </div>
                </li>
                <li><a href="list.organ">
                    <img src="resources/images/coperation.png">
                </a></li>        
                
                   	 
            </ul>
            
            <div id="logout">
                <a href="logout.em">
                    <img src="resources/images/logout1.png">
                </a>
            </div>
        </div>
       
    </div>
  <div class="contents"> 
    <div id="lnb">
        <div class="lnb-new-schedule">
            <button id="btn-new-schedule" type="button" class="btn btn-primary btn-block" data-toggle="modal">
                New schedule</button>
        </div>
        <div id="lnb-calendars" class="lnb-calendars">
            <div>
                <div class="lnb-calendars-item">
                    <label>
                        <input class="tui-full-calendar-checkbox-square" type="checkbox" value="all" checked>
                        <span></span>
                        <strong>View all</strong>
                    </label>
                </div>
            </div>
            <div id="calendarList" class="lnb-calendars-d1">
            </div>
            <div id="team">                   
                       <a href="teamCalendar.ca"><i class="bi bi-calendar-range"></i> TEAM</a>                   
            </div>
        </div>        
    </div>
    <div id="right">
        <div id="menu">
            <span class="dropdown">
                <button id="dropdownMenu-calendarType" class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="true">
                    <i id="calendarTypeIcon" class="calendar-icon ic_view_month" style="margin-right: 4px;"></i>
                    <span id="calendarTypeName">Dropdown</span>&nbsp;
                    <i class="calendar-icon tui-full-calendar-dropdown-arrow"></i>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-calendarType">
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-daily">
                            <i class="calendar-icon ic_view_day"></i>Daily
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weekly">
                            <i class="calendar-icon ic_view_week"></i>Weekly
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-monthly">
                            <i class="calendar-icon ic_view_month"></i>Month
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weeks2">
                            <i class="calendar-icon ic_view_week"></i>2 weeks
                        </a>
                    </li>
                    <li role="presentation">
                        <a class="dropdown-menu-title" role="menuitem" data-action="toggle-weeks3">
                            <i class="calendar-icon ic_view_week"></i>3 weeks
                        </a>
                    </li>
                    <li role="presentation" class="dropdown-divider"></li>
                    <li role="presentation">
                        <a role="menuitem" data-action="toggle-workweek">
                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-workweek" checked>
                            <span class="checkbox-title"></span>Show weekends
                        </a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" data-action="toggle-start-day-1">
                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-start-day-1">
                            <span class="checkbox-title"></span>Start Week on Monday
                        </a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" data-action="toggle-narrow-weekend">
                            <input type="checkbox" class="tui-full-calendar-checkbox-square" value="toggle-narrow-weekend">
                            <span class="checkbox-title"></span>Narrower than weekdays
                        </a>
                    </li>
                </ul>
            </span>
            <span id="menu-navi">
                <button type="button" class="btn btn-default btn-sm move-today" data-action="move-today">Today</button>
                <button type="button" class="btn btn-default btn-sm move-day" data-action="move-prev">
                    <i class="calendar-icon ic-arrow-line-left" data-action="move-prev"></i>
                </button>
                <button type="button" class="btn btn-default btn-sm move-day" data-action="move-next">
                    <i class="calendar-icon ic-arrow-line-right" data-action="move-next"></i>
                </button>
            </span>
            <span id="renderRange" class="render-range"></span>
        </div>
        <div id="calendar"></div>
    </div>
    </div>
</div>
<script type="text/javascript">

var CalendarList = [];

function CalendarInfo() {
    this.id = null;
    this.name = null;
    this.checked = true;
    this.color = null;
    this.bgColor = null;
    this.borderColor = null;
    this.dragBgColor = null;
    
}

function addCalendar(calendar) {
    CalendarList.push(calendar);
}

function findCalendar(id) {
    var found;

    CalendarList.forEach(function(calendar) {
        if (calendar.id === id) {
            found = calendar;
        }
    });

    return found || CalendarList[0];
}

function hexToRGBA(hex) {
    var radix = 16;
    var r = parseInt(hex.slice(1, 3), radix),
        g = parseInt(hex.slice(3, 5), radix),
        b = parseInt(hex.slice(5, 7), radix),
        a = parseInt(hex.slice(7, 9), radix) / 255 || 1;
    var rgba = 'rgba(' + r + ', ' + g + ', ' + b + ', ' + a + ')';

    return rgba;
}

(function() {
    var calendar;
    var id = 0;

    calendar = new CalendarInfo();
    id += 1;
    calendar.id = String(id);
    calendar.name = '세미나';
    calendar.color = '#ffffff';
    calendar.bgColor = '#9e5fff';
    calendar.dragBgColor = '#9e5fff';
    calendar.borderColor = '#9e5fff';
    addCalendar(calendar);

    calendar = new CalendarInfo();
    id += 1;
    calendar.id = String(id);
    calendar.name = '프로젝트';
    calendar.color = '#ffffff';
    calendar.bgColor = '#00a9ff';
    calendar.dragBgColor = '#00a9ff';
    calendar.borderColor = '#00a9ff';
    addCalendar(calendar);
 

    calendar = new CalendarInfo();
    id += 1;
    calendar.id = String(id);
    calendar.name = '프로젝트완료';
    calendar.color = '#ffffff';
    calendar.bgColor = '#03bd9e';
    calendar.dragBgColor = '#03bd9e';
    calendar.borderColor = '#03bd9e';
    addCalendar(calendar);

    calendar = new CalendarInfo();
    id += 1;
    calendar.id = String(id);
    calendar.name = '휴가';
    calendar.color = '#ffffff';
    calendar.bgColor = '#bbdc00';
    calendar.dragBgColor = '#bbdc00';
    calendar.borderColor = '#bbdc00';
    addCalendar(calendar);

    calendar = new CalendarInfo();
    id += 1;
    calendar.id = String(id);
    calendar.name = '회의';
    calendar.color = '#ffffff';
    calendar.bgColor = '#ffbb3b';
    calendar.dragBgColor = '#ffbb3b';
    calendar.borderColor = '#ffbb3b';
    addCalendar(calendar);

/*     calendar = new CalendarInfo();
    id += 1;
    calendar.id = String(id);
    calendar.name = '개인작업';
    calendar.color = '#ffffff';
    calendar.bgColor = '#9d9d9d';
    calendar.dragBgColor = '#9d9d9d';
    calendar.borderColor = '#9d9d9d';
    addCalendar(calendar);   */

})();


$(document).ready(function(){
	var ScheduleList = [];
    var cal, resizeThrottled;
    var useCreationPopup = true;
    var useDetailPopup = true;
    var datePicker, selectedCalendar;

  cal = new tui.Calendar(document.getElementById('calendar'), {
  defaultView: 'month',
  useCreationPopup: true,
  useDetailPopup: true,
  calendars: CalendarList,
  taskView: false,
  template: {
      milestone: function(model) {
          return '<span class="calendar-font-icon ic-milestone-b"></span> <span style="background-color: ' + model.bgColor + '">' + model.title + '</span>';
      },
      allday: function(schedule) {
          return getTimeTemplate(schedule, true);
      },
      time: function(schedule) {
          return getTimeTemplate(schedule, false);
      }
  },
  
  
  month: {
   daynames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
   startDayOfWeek: 0,
   narrowWeekend: true
  },
  week: {
   daynames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
   startDayOfWeek: 0,
   narrowWeekend: true
  }
 });
  
  
  cal.createSchedules([
	    {
	        id: '1',
	        calendarId: '1',
	        title: 'GDG Korea WebTech Online Lightning Talk 2022',
	        category: 'time',
	        location: 'gather town',
	        dueDateClass: '',
	        start: '2022-03-12T14:30:00+09:00',
	        end: '2022-03-12T17:30:00+09:00',	        
	        isReadOnly: true,
	        attendees:['신누리']
	        
	    },
	 {
	        id: '2',
	        calendarId: '2',
	        title: '홈페이지 개편',
	        category: 'allday',
	        dueDateClass: '',
	        start: '2022-01-15T09:30:00+09:00',
	        end: '2022-03-21T12:30:00+09:00',
	        isReadOnly: true,
	        attendees:['최지은']
	       
	    },
	 {
	        id: '3',
	        calendarId: '1',
	        title: 'Block Chain Seoul 2022',
	        category: 'time',
	        location: '코엑스',
	        dueDateClass: '',
	        start: '2022-03-14T13:30:00+09:00',
	        end: '2022-03-14T18:30:00+09:00',
	        attendees:['이해랑']
	    },
	 {
	        id: '4',
	        calendarId: '5',
	        title: '아침회의',
	        category: 'time',
	        dueDateClass: '',
	        start: '2022-02-28T09:30:00+09:00',
	        end: '2022-02-28T11:30:00+09:00',
	        isReadOnly: true,
	        attendees:['주세현']
	    },
	 {
	        id: '5',
	        calendarId: '4',
	        title: '쥬세현 휴가',
	        category: 'allday',
	        dueDateClass: '',
	        start: '2022-02-15T09:30:00+09:00',
	        end: '2022-02-17T11:30:00+09:00',
	        isReadOnly: true,
	        attendees:['주세현']
	    },
	 {
	        id: '6',
	        calendarId: '4',
	        title: '최지은 휴가',
	        category: 'allday',
	        dueDateClass: '',
	        start: '2022-02-03T09:30:00+09:00',
	        end: '2022-02-04T11:30:00+09:00',
	        isReadOnly: true,
	        attendees:['최지은']
	    },
	 {
	        id: '7',
	        calendarId: '4',
	        title: '신누리 휴가',
	        category: 'allday',
	        dueDateClass: '',
	        start: '2022-03-04T09:30:00+09:00',
	        end: '2022-03-04T11:30:00+09:00',
	        isReadOnly: true,
	        attendees:['신누리']
	    },
	 {
	        id: '8',
	        calendarId: '4',
	        title: '이해랑 휴가',
	        category: 'allday',
	        dueDateClass: '',
	        start: '2022-03-08T09:30:00+09:00',
	        end: '2022-03-08T11:30:00+09:00',
	        attendees:['이해랑']
	    },
	 {
	        id: '9',
	        calendarId: '4',
	        title: '권한나 휴가',
	        category: 'allday',
	        dueDateClass: '',
	        start: '2022-03-10T09:30:00+09:00',
	        end: '2022-03-10T11:30:00+09:00',
	        isReadOnly: true,
	        attendees:['권한나']
	    },
	 {
	        id: '10',
	        calendarId: '4',
	        title: '안수현 휴가',
	        category: 'allday',
	        dueDateClass: '',
	        start: '2022-03-22T09:30:00+09:00',
	        end: '2022-03-23T11:30:00+09:00',
	        isReadOnly: true,
	        attendees:['안수현']
	    }

	]);
 
  // event handlers
  cal.on({
      'clickMore': function(e) {
          console.log('clickMore', e);
      },
      'clickSchedule': function(e) {
          console.log('clickSchedule', e);
      },
      'clickDayname': function(date) {
          console.log('clickDayname', date);
      },
      'beforeCreateSchedule': function(e) {
          console.log('beforeCreateSchedule', e);
          saveNewSchedule(e);
      },
      'beforeUpdateSchedule': function(e) {
          var schedule = e.schedule;
          var changes = e.changes;

          console.log('beforeUpdateSchedule', e);

          if (changes && !changes.isAllDay && schedule.category === 'allday') {
              changes.category = 'time';
          }

          cal.updateSchedule(schedule.id, schedule.calendarId, changes);
          refreshScheduleVisibility();
      },
      'beforeDeleteSchedule': function(e) {
          console.log('beforeDeleteSchedule', e);
          cal.deleteSchedule(e.schedule.id, e.schedule.calendarId);
      },
      'afterRenderSchedule': function(e) {
          var schedule = e.schedule;
          // var element = cal.getElement(schedule.id, schedule.calendarId);
          // console.log('afterRenderSchedule', element);
      },
      'clickTimezonesCollapseBtn': function(timezonesCollapsed) {
          console.log('timezonesCollapsed', timezonesCollapsed);

          if (timezonesCollapsed) {
              cal.setTheme({
                  'week.daygridLeft.width': '77px',
                  'week.timegridLeft.width': '77px'
              });
          } else {
              cal.setTheme({
                  'week.daygridLeft.width': '60px',
                  'week.timegridLeft.width': '60px'
              });
          }

          return true;
      }
  });

  /**
   * Get time template for time and all-day
   * @param {Schedule} schedule - schedule
   * @param {boolean} isAllDay - isAllDay or hasMultiDates
   * @returns {string}
   */
  function getTimeTemplate(schedule, isAllDay) {
      var html = [];
      var start = moment(schedule.start.toUTCString());
      if (!isAllDay) {
          html.push('<strong>' + start.format('HH:mm') + '</strong> ');
      }
      if (schedule.isPrivate) {
          html.push('<span class="calendar-font-icon ic-lock-b"></span>');
          html.push(' Private');
      } else {
          if (schedule.isReadOnly) {
              html.push('<span class="calendar-font-icon ic-readonly-b"></span>');
          } else if (schedule.recurrenceRule) {
              html.push('<span class="calendar-font-icon ic-repeat-b"></span>');
          } else if (schedule.attendees.length) {
              html.push('<span class="calendar-font-icon ic-user-b"></span>');
          } else if (schedule.location) {
              html.push('<span class="calendar-font-icon ic-location-b"></span>');
          }
          html.push(' ' + schedule.title);
      }

      return html.join('');
  }

  /**
   * A listener for click the menu
   * @param {Event} e - click event
   */
  function onClickMenu(e) {
      var target = $(e.target).closest('a[role="menuitem"]')[0];
      var action = getDataAction(target);
      var options = cal.getOptions();
      var viewName = '';

      console.log(target);
      console.log(action);
      switch (action) {
          case 'toggle-daily':
              viewName = 'day';
              break;
          case 'toggle-weekly':
              viewName = 'week';
              break;
          case 'toggle-monthly':
              options.month.visibleWeeksCount = 0;
              viewName = 'month';
              break;
          case 'toggle-weeks2':
              options.month.visibleWeeksCount = 2;
              viewName = 'month';
              break;
          case 'toggle-weeks3':
              options.month.visibleWeeksCount = 3;
              viewName = 'month';
              break;
          case 'toggle-narrow-weekend':
              options.month.narrowWeekend = !options.month.narrowWeekend;
              options.week.narrowWeekend = !options.week.narrowWeekend;
              viewName = cal.getViewName();

              target.querySelector('input').checked = options.month.narrowWeekend;
              break;
          case 'toggle-start-day-1':
              options.month.startDayOfWeek = options.month.startDayOfWeek ? 0 : 1;
              options.week.startDayOfWeek = options.week.startDayOfWeek ? 0 : 1;
              viewName = cal.getViewName();

              target.querySelector('input').checked = options.month.startDayOfWeek;
              break;
          case 'toggle-workweek':
              options.month.workweek = !options.month.workweek;
              options.week.workweek = !options.week.workweek;
              viewName = cal.getViewName();

              target.querySelector('input').checked = !options.month.workweek;
              break;
          default:
              break;
      }

      cal.setOptions(options, true);
      cal.changeView(viewName, true);

      setDropdownCalendarType();
      setRenderRangeText();
  }

  function onClickNavi(e) {
      var action = getDataAction(e.target);

      switch (action) {
          case 'move-prev':
              cal.prev();
              break;
          case 'move-next':
              cal.next();
              break;
          case 'move-today':
              cal.today();
              break;
          default:
              return;
      }

      setRenderRangeText();
  }

  function onNewSchedule() {
      var title = $('#new-schedule-title').val();
      var location = $('#new-schedule-location').val();
      var isAllDay = document.getElementById('new-schedule-allday').checked;
      var start = datePicker.getStartDate();
      var end = datePicker.getEndDate();
      var calendar = selectedCalendar ? selectedCalendar : CalendarList[0];
      if (!title) {
          return;
      }

      cal.createSchedules([{
          id: String(chance.guid()),
          calendarId: calendar.id,
          title: title,
          isAllDay: isAllDay,
          location: location,
          start: start,
          end: end,          
          category: isAllDay ? 'allday' : 'time',
          dueDateClass: '',
          color: calendar.color,
          bgColor: calendar.bgColor,
          dragBgColor: calendar.bgColor,
          borderColor: calendar.borderColor,
          state: 'Busy',
          attendees:['${loginUser.userName}']
      }]);

      $('#modal-new-schedule').modal('hide');
  }

  function onChangeNewScheduleCalendar(e) {
      var target = $(e.target).closest('a[role="menuitem"]')[0];
      var calendarId = getDataAction(target);
      changeNewScheduleCalendar(calendarId);
  }

  function changeNewScheduleCalendar(calendarId) {
      var calendarNameElement = document.getElementById('calendarName');
      var calendar = findCalendar(calendarId);
      var html = [];

      html.push('<span class="calendar-bar" style="background-color: ' + calendar.bgColor + '; border-color:' + calendar.borderColor + ';"></span>');
      html.push('<span class="calendar-name">' + calendar.name + '</span>');

      calendarNameElement.innerHTML = html.join('');

      selectedCalendar = calendar;
  }

  function createNewSchedule(event) {
      var start = event.start ? new Date(event.start.getTime()) : new Date();
      var end = event.end ? new Date(event.end.getTime()) : moment().add(1, 'hours').toDate();

      if (useCreationPopup) {
          cal.openCreationPopup({
              start: start,
              end: end
          });
      }
  }
  function saveNewSchedule(scheduleData) {
      var calendar = scheduleData.calendar || findCalendar(scheduleData.calendarId);
      var schedule = {
          id: String(chance.guid()),
          title: scheduleData.title,
          isAllDay: scheduleData.isAllDay,
          start: scheduleData.start,
          end: scheduleData.end,
          category: scheduleData.isAllDay ? 'allday' : 'time',
          dueDateClass: '',
          color: calendar.color,
          bgColor: calendar.bgColor,
          dragBgColor: calendar.bgColor,
          borderColor: calendar.borderColor,
          location: scheduleData.location,
          isPrivate: scheduleData.isPrivate,
          state: scheduleData.state,
          attendees:['${loginUser.userName}']
      };
      if (calendar) {
          schedule.calendarId = calendar.id;
          schedule.color = calendar.color;
          schedule.bgColor = calendar.bgColor;
          schedule.borderColor = calendar.borderColor;
      }

      cal.createSchedules([schedule]);

      refreshScheduleVisibility();
  }

  function onChangeCalendars(e) {
      var calendarId = e.target.value;
      var checked = e.target.checked;
      var viewAll = document.querySelector('.lnb-calendars-item input');
      var calendarElements = Array.prototype.slice.call(document.querySelectorAll('#calendarList input'));
      var allCheckedCalendars = true;

      if (calendarId === 'all') {
          allCheckedCalendars = checked;

          calendarElements.forEach(function(input) {
              var span = input.parentNode;
              input.checked = checked;
              span.style.backgroundColor = checked ? span.style.borderColor : 'transparent';
          });

          CalendarList.forEach(function(calendar) {
              calendar.checked = checked;
          });
      } else {
          findCalendar(calendarId).checked = checked;

          allCheckedCalendars = calendarElements.every(function(input) {
              return input.checked;
          });

          if (allCheckedCalendars) {
              viewAll.checked = true;
          } else {
              viewAll.checked = false;
          }
      }

      refreshScheduleVisibility();
  }

  function refreshScheduleVisibility() {
      var calendarElements = Array.prototype.slice.call(document.querySelectorAll('#calendarList input'));

      CalendarList.forEach(function(calendar) {
          cal.toggleSchedules(calendar.id, !calendar.checked, false);
      });

      cal.render(true);

      calendarElements.forEach(function(input) {
          var span = input.nextElementSibling;
          span.style.backgroundColor = input.checked ? span.style.borderColor : 'transparent';
      });
  }

  function setDropdownCalendarType() {
      var calendarTypeName = document.getElementById('calendarTypeName');
      var calendarTypeIcon = document.getElementById('calendarTypeIcon');
      var options = cal.getOptions();
      var type = cal.getViewName();
      var iconClassName;

      if (type === 'day') {
          type = 'Daily';
          iconClassName = 'calendar-icon ic_view_day';
      } else if (type === 'week') {
          type = 'Weekly';
          iconClassName = 'calendar-icon ic_view_week';
      } else if (options.month.visibleWeeksCount === 2) {
          type = '2 weeks';
          iconClassName = 'calendar-icon ic_view_week';
      } else if (options.month.visibleWeeksCount === 3) {
          type = '3 weeks';
          iconClassName = 'calendar-icon ic_view_week';
      } else {
          type = 'Monthly';
          iconClassName = 'calendar-icon ic_view_month';
      }

      calendarTypeName.innerHTML = type;
      calendarTypeIcon.className = iconClassName;
  }

  function currentCalendarDate(format) {
    var currentDate = moment([cal.getDate().getFullYear(), cal.getDate().getMonth(), cal.getDate().getDate()]);

    return currentDate.format(format);
  }

  function setRenderRangeText() {
      var renderRange = document.getElementById('renderRange');
      var options = cal.getOptions();
      var viewName = cal.getViewName();

      var html = [];
      if (viewName === 'day') {
          html.push(currentCalendarDate('YYYY.MM.DD'));
      } else if (viewName === 'month' &&
          (!options.month.visibleWeeksCount || options.month.visibleWeeksCount > 4)) {
          html.push(currentCalendarDate('YYYY.MM'));
      } else {
          html.push(moment(cal.getDateRangeStart().getTime()).format('YYYY.MM.DD'));
          html.push(' ~ ');
          html.push(moment(cal.getDateRangeEnd().getTime()).format(' MM.DD'));
      }
      renderRange.innerHTML = html.join('');
  }
  
  function setSchedules() {
      cal.clear();
      cal.createSchedules(ScheduleList);

  }
  
  function setEventListener() {
      $('#menu-navi').on('click', onClickNavi);
      $('.dropdown-menu a[role="menuitem"]').on('click', onClickMenu);
      $('#lnb-calendars').on('change', onChangeCalendars);

      $('#btn-save-schedule').on('click', onNewSchedule);
      $('#btn-new-schedule').on('click', createNewSchedule);

      $('#dropdownMenu-calendars-list').on('click', onChangeNewScheduleCalendar);

      window.addEventListener('resize', resizeThrottled);
  }
  
  function getDataAction(target) {
      return target.dataset ? target.dataset.action : target.getAttribute('data-action');
  }
  
  resizeThrottled = tui.util.throttle(function() {
      cal.render();
  }, 50);

  window.cal = cal;

  setDropdownCalendarType();
  setRenderRangeText();
  setEventListener();
  
  
  (function() {
	    var calendarList = document.getElementById('calendarList');
	    var html = [];
	    CalendarList.forEach(function(calendar) {
	        html.push('<div class="lnb-calendars-item"><label>' +
	            '<input type="checkbox" class="tui-full-calendar-checkbox-round" value="' + calendar.id + '" checked>' +
	            '<span style="border-color: ' + calendar.borderColor + '; background-color: ' + calendar.borderColor + ';"></span>' +
	            '<span>' + calendar.name + '</span>' +

	            '</label></div>'
	        );
	    });
	    calendarList.innerHTML = html.join('\n');
	})();



 });


 </script>

 </body>
</html>
