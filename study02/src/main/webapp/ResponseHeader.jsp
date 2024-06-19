<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.text.ParseException" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
  Time: 오후 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
//  SimpleDateFormat : 자바에서 제공하는 시간 관련 클래스, 사용자가 원하는 형식대로 날짜 및 시간을 표현할 수 있음
  SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  long addDate = 0;
  try {
    addDate = s.parse(request.getParameter("add_date")).getTime();
  } catch (ParseException e) {
    throw new RuntimeException(e);
  }
//  클라이언트에서 전달받은 데이터를 정수 타입으로 변환
  int addInt = Integer.parseInt(request.getParameter("add_int"));
  String addStr = request.getParameter("add_str");

//  response 객체를 사용하여 문서의 헤더에 데이터를 추가
//  addDateHeader(key, value) : 지정한 키와 값을 헤더에 날짜 타입으로 저장
//  addHeader(key, value) : 지정한 키와 값을 헤더에 저장
//  addIntHeader(key, value) : 지정한 키와 값을 정수형으로 저장
  response.addDateHeader("myBirthday", addDate);
//  동일한 key로 데이터를 2개 이상 저장 시 실제로는 데이터가 2개 이상 저장됨
//  getHeader() 를 통해서 데이터를 가져올 경우 첫번째로 검색되는 데이터만 출력됨
//  두번째 세번째와 같이 다른 데이터도 함께 출력하고자할 경우 getHeaders() 를 통해서 가져와야 함
  response.addIntHeader("myNumber", addInt);
  response.addIntHeader("myNumber", 1004);
  response.addHeader("myName", addStr);
//  setHeader(key, value) : 지정한 키를 가지고 있는 데이터를 수정함
  response.setHeader("myName", "안중근");
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
  <h2>응답 헤더 정보 출력하기</h2>
  <ul class="list-group">
    <%
      Collection<String> headerNames = response.getHeaderNames();
      for (String hName : headerNames) {
        String hValue = response.getHeader(hName);
    %>
    <li class="list-group-item"><%= hName%> : <%= hValue %></li>
    <%
      }
    %>
  </ul>

  <hr>

  <h2>myNumber 만 출력하기</h2>
  <ul class="list-group">
  <%
//    getHeaders(key) : 지정한 키로 저장된 모든 헤더의 데이터를 가져옴
    Collection<String> myNumber = response.getHeaders("myNumber");

    for (String myNum : myNumber) {
      %>
    <li class="list-group-item">myNumber : <%= myNum %></li>
      <%
    }
  %>

  </ul>
</div>
</body>
</html>











