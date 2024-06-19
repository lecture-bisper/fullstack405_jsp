<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 18.
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - request (RequestHeader.jsp)</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5">
  <h2>3. 요청 헤더 정보 출력하기</h2>
  <%
<%--    getHeaderNames() : request 내장 객체를 통해서 전달된 데이터의 헤더 이름을 모두 가져옴 --%>
<%--  Enumeration : Iterator와 비슷한 기능을 하는 클래스 --%>
    Enumeration headers = request.getHeaderNames();

<%--  hasMoreElements() : iterator의 hasNext()와 같은 기능, 출력할 데이터가 있는지 여부를 확인 --%>
    while (headers.hasMoreElements()) {
<%--  nextElement() : iterator의 next()와 같은 기능, 저장된 데이터 중 하나를 출력함 --%>
      String headerName = (String) headers.nextElement();
<%--  getHeader(헤더명) : 지정한 헤더명과 같은 이름의 헤더의 데이터를 출력 --%>
      String headerValue = request.getHeader(headerName);
      out.print("헤더명 : " + headerName + ", 헤더값 : " + headerValue + "<br>");
    }
  %>
  <p>이 파일을 직접 실행 시 referer 정보는 출력되지 않습니다.</p>
</div>
</body>
</html>











