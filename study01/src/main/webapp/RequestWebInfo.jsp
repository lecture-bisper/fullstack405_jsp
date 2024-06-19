<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 18.
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - Request (RequestWebInfo.jsp)</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5">
  <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
  <ul class="list-group">
<%--    request : jsp 가 미리 선언하여 사용자가 사용할 수 있도록 해놓은 내장객체, 요청 데이터를 저장 --%>
<%--    getMethod(): 클라이언트가 서버에 데이터 요청 시 데이터를 전달한 방식을 출력 --%>
    <li class="list-group-item">데이터 전송 방식 : <%= request.getMethod() %></li>
<%--  URL과 URI의 차이 : URL은 네트워크 상에서 자원이 어디 있는지 위치를 알려주기 위한 규약, URI 인터넷에 있는 자원을 어디에 있는지 자원 자체를 식별하는 방법, 현재는 거의 같은 의미로 사용됨 --%>
<%--  getRequestURL() : 클라이언트가 서버로 요청한 전체 URL을 출력 --%>
    <li class="list-group-item">URL : <%= request.getRequestURL() %></li>
<%--  getRequestURI() : 클라이언트가 서버로 요청한 주소 중 서버 주소를 제외한 부분 --%>
    <li class="list-group-item">URI : <%= request.getRequestURI() %></li>
<%--  Protocol(프로토콜) : 컴퓨터나 원거리 통신 장비 사이에서 메시지를 주고 받기 위한 통신 규약 --%>
<%--  getProtocol() : 현재 사용하는 프로토콜의 종류를 출력 --%>
    <li class="list-group-item">프로토콜 : <%= request.getProtocol() %></li>
<%--  getServerName() : 현재 접속한 서버 주소를 출력 --%>
    <li class="list-group-item">서버명 : <%= request.getServerName() %></li>
<%--  getServerPort() : 현재 접속한 서버에서 사용하는 port 번호를 출력 --%>
    <li class="list-group-item">서버 포트 : <%= request.getServerPort() %></li>
<%--  getRemoteAddr() : 현재 서버에 접속에 사용한 클라이언트의 IP 주소를 출력 --%>
    <li class="list-group-item">클라이언트 IP 주소 : <%= request.getRemoteAddr() %></li>
<%--  getQueryString() : URI 뒤에 있는 ? 기호와 함께 전달된 데이터를 의미, GET 방식 사용 시 URL과 함께 전달된 데이터를 출력, POST 방식 사용 시 쿼리스트링은 null 임 --%>
    <li class="list-group-item">쿼리스트링 : <%= request.getQueryString() %></li>
<%--  getParameter() : 클라이언트에서 서버로 전달한 데이터 중 지정한 이름의 데이터를 가져옴 --%>
    <li class="list-group-item">전송된 값 1 : <%= request.getParameter("eng") %></li>
    <li class="list-group-item">전송된 값 2 : <%= request.getParameter("han") %></li>
  </ul>
</div>
</body>
</html>











