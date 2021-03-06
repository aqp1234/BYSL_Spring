<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Calendar</title>
    <script src='https://unpkg.com/axios/dist/axios.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="/bysl/resources/css/addCalendar.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@700&display=swap" rel="stylesheet">
</head>
<body>
    <form id="join-form" action="" method="post">
    	<input hidden="hidden">
        <div class="input-group">
            <div class="input-what">Subject</div> <!-- calendar 제목 입력 -->
            <input id="subject" type="text" name="subject"></div>
        </div>
        <div class="input-group">
            <div class="input-what">Content</div> <!-- 세부내용 입력 -->
            <input id="content" type="text" name="content"></div>
        </div>
        <div class="input-group">
            <div class="input-what">Start Date</div> <!-- 시작 날짜 입력 -->
            <input id="start_date" type="date" name="start_date"></div>
        </div>
        <div class="input-group">
            <div class="input-what">End Date</div> <!-- 끝 날짜 입력 -->
            <input id="end_date" type="date" name="end_date"></div>
        </div>
        <button id="calendar-btn" type="button" class="btn">New calendar</button>
    </form>
    <script async src="/bysl/resources/javascript/calendar/add.js"></script>
</body>
</html>