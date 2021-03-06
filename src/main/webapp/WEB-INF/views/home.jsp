<%@page import="com.kms.bysl.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO member = (MemberDTO) session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BYSL</title>
<link rel="stylesheet" href="/bysl/resources/css/calendar.css">
<link rel="stylesheet" type="text/css" href="/bysl/resources/css/mainCalendarPopup.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/templates/top.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/templates/leftSideBar.jsp"></jsp:include>
    <section id="main" class="workspace_section">
		<div class="calendar-button">
	        <div class="nav">
	            <button id="calendar-prev-btn" class="nav-btn" onclick="goPrevCalendar()">&lt;</button>
	            <div class="this_day">
	                <div class="year-month"></div>
	                <button id="calendar-now-btn" class="nav-btn" onclick="goTodayCalendar()">Today ✔</button>
	            </div>
	            <button id="calendar-next-btn" class="nav-btn" onclick="goNextCalendar()">&gt;</button>
	        </div>
	        <div style="display: flex; justify-content: space-between; align-items: center;">
	            <ul class="calendar-nav">
	                <li class="calendar-nav-item"><button class="calendar-nav-btn selected" onclick="btn_MealSchedule(this)" id="meal_schedule">학사일정, 급식</button></li>
	                <li class="calendar-nav-item"><button class="calendar-nav-btn" onclick="btn_AllSchedule(this)" id="all_schedule">전체일정</button></li>
	            </ul>
	            <div>
	                <span style="margin-right: 10px; font-family: 'Noto Sans KR', sans-serif; font-weight: bolder; color: rgb(66, 65, 65);"><%= member.getSchoolName() %></span>
	            </div>
	        </div>
	    </div>
	    <div class="meal_dim-layer">
	        <div class="meal_dimBg"></div>
	        <div id="meal_layer" class="meal_pop-layer">
	            <div class="meal_pop-container">
	                <div class="meal_pop-conts">
	                    <div class="btn-c">
	                        <a href="#" class="btn-close">Close ✖</a>
	                    </div>
	                    <div class="meal_info_text">☁  급식 정보  ☁</div>
	                    <table style="margin-right: 50px;">
	                        <colgroup>
	                            <col style="width: 25%">
	                            <col style="width: 75%">
	                        </colgroup>
	                        <tbody class="meal_tbody">
	                            <tr>
	                                <th scope="row">급식</th>
	                                <td><p id="meal_type">점심</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">날짜</th>
	                                <td><p id="meal_ymd">점심</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">식단</th>
	                                <td><p id="meal_diet">점심</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">칼로리</th>
	                                <td><p id="meal_cal">점심</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">원산지</th>
	                                <td><p id="meal_origin">점심</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">영양정보</th>
	                                <td><p id="meal_ntr">점심</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">알레르기정보</th>
	                                <td><p>1.난류, 2.우유, 3.메밀, 4.땅콩, 5.대두, 6.밀, 7.고등어, 8.게, 9.새우, 10.돼지고기, 11.복숭아, 12.토마토, 13.아황산염, 14.호두, 15.닭고기, 16.쇠고기, 17.오징어, 18.조개류(굴,전복,홍합 등)</p></td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="schedule_dim-layer">
	        <div class="schedule_dimBg"></div>
	        <div id="schedule_layer" class="schedule_pop-layer">
	            <div class="schedule_pop-container">
	                <div class="schedule_pop-conts">
	                    <div class="btn-c">
	                        <a href="#" class="btn-close">Close ✖</a>
	                    </div>
	                    <div class="school_info_text">☁  학사 일정  ☁</div>
	                    <table>
	                        <colgroup>
	                            <col style="width: max-content">
	                            <col style="width: max-content;">
	                        </colgroup>
	                        <tbody class="schedule_tbody">
	                            <tr>
	                                <th scope="row">대상 학년</th>
	                                <td><p id="schedule_ay">대상 학년</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">학사 일자</th>
	                                <td><p id="schedule_ymd">학사 일자</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">행사명</th>
	                                <td><p id="schedule_nm">행사명</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">휴무여부</th>
	                                <td><p id="schedule_sbtr">휴무여부</p></td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="my_schedule_dim-layer">
	        <div class="my_schedule_dimBg"></div>
	        <div id="my_schedule_layer" class="my_schedule_pop-layer">
	            <div class="my_schedule_pop-container">
	                <div class="my_schedule_pop-conts">
	                    <div class="btn-c">
	                        <a href="#" class="btn-close">Close</a>
	                    </div>
	                    <div class="my_schedule_info_text">☁  전체 일정  ☁</div>
	                    <table class="my_schedule_info_table">
	                        <colgroup>
	                            <col style="width: max-content">
	                            <col style="width: max-content">
	                        </colgroup>
	                        <tbody class="my_schedule_tbody">
	                            <tr>
	                                <th scope="row">워크스페이스 이름</th>
	                                <td><p id="my_schedule_workspacename">워크스페이스 이름</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">제목</th>
	                                <td><p id="my_schedule_subject">제목</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">내용</th>
	                                <td><p id="my_schedule_content">내용</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">시작 날짜</th>
	                                <td><p id="my_schedule_start_date">시작 날짜</p></td>
	                            </tr>
	                            <tr>
	                                <th scope="row">끝 날짜</th>
	                                <td><p id="my_schedule_end_date">끝 날짜</p></td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div id="calendar">
	        <!-- 캘린더 -->
	    </div>
	    <div id="detail" style="margin-top: 50px; display:none;">
	        <h3 id="detail_h3" style="text-align:center;">~~일의 일정</h3>
	        <div>
	            <div style="background-color: rgb(242, 242, 242); border-radius: 5px;">
	                <table order='1px solid black' id="detail_table">
	                    <colgroup>
	                        <col style="width: 20%">
	                        <col style="width: 60%">
	                        <col style="width: 20%">
	                    </colgroup>
	                    <thead>
	                        <tr id="table_title">
	                            <td>종류</td>
	                            <td>내용</td>
	                            <td>자세히보기</td>
	                        </tr>
	                    </thead>
	                    <tbody id="detail_tbody">
	                    </tbody>
	                </table>
	            </div>
	        </div>
	    </div>
	</section>
	<script src="/bysl/resources/javascript/mainCalendar.js"></script>
</body>
</html>