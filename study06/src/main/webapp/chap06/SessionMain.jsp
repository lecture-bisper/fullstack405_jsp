<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 25.
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
  SimpleDateFormat sdf = new SimpleDateFormat();

//  세션 유지 시간 설정
  session.setMaxInactiveInterval(30);
  long createTime = session.getCreationTime();
  String createTimeStr = sdf.format(new Date(createTime));

  long lastTime = session.getLastAccessedTime();
  String lastTimeStr = sdf.format(new Date(lastTime));

//  세션 관련 메소드
//  getAttribute(이름) : 세션에 저장된 데이터 가져오기
//  getAttributeNames() : 세션에 저장된 데이터 이름을 모두 가져오기
//  getCreationTime() : 서버에 세션이 최초로 생성된 시간을 출력
//  getId() : 서버에 생성된 세션 ID를 출력
//  getLastAccessedTime() : 서버에 세션이 마지막으로 사용된 시간 출력
//  getMaxInactiveInterval() : 설정된 세션 유지 시간 출력
//  isNew() : 현재 세션이 새로 만들어진 세션인지 여부 확인
//  removeAttribute(이름) : 세션에 저장된 데이터를 삭제
//  setAttribute(이름, 값) : 세션에 데이터 저장, 동일한 이름이 있으면 수정, 없으면 추가, Object 타입으로 데이터 저장
//  setMaxInactiveInterval(시간) : 세션 유지 시간 설정
//  invalidate() : 세션에 저장된 모든 데이터 삭제
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
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">Session</h2>

  <ul class="list-group">
    <li class="list-group-item">세션 유지 시간 : <%=session.getMaxInactiveInterval()%></li>
    <li class="list-group-item">세션 아이디 : <%=session.getId()%></li>
    <li class="list-group-item">최초 요청 시간 : <%=createTimeStr%></li>
    <li class="list-group-item">마지막 요청 시간 : <%=lastTimeStr%></li>
  </ul>
</div>
</body>
</html>











