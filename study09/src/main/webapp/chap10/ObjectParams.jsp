<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
  Time: 오전 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack405.study09.Person" %>

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
<%
  // request 영역에서 Person 클래스 타입의 객체와 문자열, 정수를 입력하여 저장
  request.setAttribute("personObj", new Person("아이유", 30));
  request.setAttribute("stringObj", "문자열 입력");
  request.setAttribute("integerObj", new Integer(99));
%>

<%-- 액션태그의 포워드 사용--%>
<jsp:forward page="ObjectResult.jsp">
<%--  액션 태그의 param 을 사용하여 파라미터값 전달--%>
  <jsp:param value="10" name="firstNum"></jsp:param>
  <jsp:param name="secondNum" value="20"/>
</jsp:forward>
</body>
</html>











