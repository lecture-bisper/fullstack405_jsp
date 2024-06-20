<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 20.
  Time: 오후 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // 현재 popupMode 상태를 나타내는 변수
  String popupMode = "on";

//  request 객체에서 쿠키 정보를 모두 가져옴
//  첫번째 접속 시에는 쿠키가 없음
//  두번째 접속 시 쿠키 정보를 가져올 수 있음
  Cookie[] cookies = request.getCookies();
  if (cookies != null) {
    for (Cookie item : cookies) {
      String cookieName = item.getName();
      String cookieValue = item.getValue();

//      가져온 정보 중 쿠키의 이름이 'PopupClose'와 같을 경우 쿠키값을 변수 popupMode 에 저장
      if (cookieName.equals("PopupClose")) {
        popupMode = cookieValue;
      }
    }
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <style>
      div#popup{
          position: absolute;
          top:100px;
          left:100px;
          color:yellow;
          width:400px;
          height:100px;
          background-color:gray;
      }
      div#popup>div{
          position: relative;
          background-color:#ffffff;
          top:0px;
          border:1px solid gray;
          padding:10px;
          color:black;
      }
  </style>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script>
      // html 태그의 로드가 종료 된 후 아래의 자바스크립트가 동작하도록 이벤트 설정
      $(document).ready(function() {
          // html 태그의 id 값이 'closeBtn' 인 태그를 선택
          // id값이 'closeBtn' 태그에 click 이벤트 설정
          $("#closeBtn").on("click", function() {
              // id값이 'popup'인 태그를 숨김
              $("#popup").hide();

              // html 태그를 검색 후 value 값을 가져오기
              var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();

              if (chkVal == 1) {
                  // ajax 통신 실행, 자바스크립트로 서버와 비동기 통신을 진행함
                  $.ajax({
                      url: 'PopupCookie.jsp', // PopupCookie.jsp 페이지에 접속
                      type: 'get', // 데이터 전달 방식, get 방식 사용
                      data: {inactiveToday: chkVal}, // 서버로 전달할 데이터, 변수명 'inactiveToday'
                      dataType: "text", // 통신 시 전달받을 데이터 타입 설정, text로 받음
                      success: function(data) { // 통신 성공 시 실행할 내용
                          // 통신 성공 시 전달받은 데이터가 빈값이 아닐 경우
                          if (data != '') {
                              // 현재 페이지 새로고침
                              location.reload();
                          }
                      }
                  });
              }
          });
      });
  </script>
</head>
<body>
<h2>팝업 메인 페이지</h2>
<%
  // 단순 화면 컨텐츠 부분
  for (int i = 1; i <= 10; i++) {
    out.print("현재 팝업창은 " + popupMode + " 상태입니다.<br>");
  }

  if (popupMode.equals("on")) {
%>

<%--  팝업창 UI--%>
<div id="popup">
  <h2 class="text-center">공지사항 팝업입니다.</h2>
  <div class="d-flex justify-content-end">
    <form name="popFrm">
      <input type="checkbox" id="inactiveToday" value="1">하루 동안 열지 않음
      <input type="button" value="닫기" id="closeBtn">
    </form>
  </div>
</div>
<%
  }
%>
</body>
</html>











