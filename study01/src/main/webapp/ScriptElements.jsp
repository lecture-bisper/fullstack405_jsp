<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 18.
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 선언부 --%>
<%-- jsp 파일의 어떠한 위치에 입력해도 상관없음 --%>
<%-- jsp 파일 안에서 여러개를 선언해도 상관없음 --%>
<%-- 여러개를 선언해도 하나로 이어짐 --%>
<%-- 주로 html 태그 상단에 많이 위치함 --%>
<%-- _jspService() 메소드 밖에 위치하여 클래스의 필드 및 메소드를 선언할 수 있음 --%>
<%!
//  선언부에서 메소드 선언
  public int add(int num1, int num2) {
    return num1 + num2;
  }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ScriptElements.jsp</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <%
//    스크립틀릿
//    실제 자바 연산식이 입력되는 부분
//    변수를 선언할 수 있으나, 메소드는 선언할 수 없음
//    _jspService() 메소드 안에 위치하기 때문에 선언한 변수는 지역변수로 인식됨
//    _jspService() 메소드 안에 위치하기 때문에 메소드를 선언할 수 없음

//    변수 선언, add() 메소드를 호출하여 결과값을 저장
    int result = add(10, 20);
    out.print("<p>덧셈 결과 : " + result + "</p>");
  %>

  <div>
<%--    표현식 --%>
<%--    스크립틀릿에 의해서 저장된 변수의 값을 화면에 출력 시 사용 --%>
<%--  스크립틀릿에서 out.print() 메소드를 통해서 화면 출력이 가능하지만 복잡한 소스코드를 입력해야 하는 불편함이 있으나, 표현식을 사용하면 쉽게 html 코드에 변수의 내용을 출력할 수 있음 --%>
    <p>덧셈 결과1 : <%= result %></p>
    <p>덧셈 결과2 : <%= add(30, 40) %></p>
  </div>
</div>
</body>
</html>











