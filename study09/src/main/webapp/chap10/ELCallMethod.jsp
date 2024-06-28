<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

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

<%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>
<%@ page import="bitc.fullstack405.study09.MyELClass" %>

<%
  // 클래스 타입의 객체선언
  MyELClass myel = new MyELClass();
//  page 영역에 저장
  pageContext.setAttribute("myel", myel);
%>

<div class="container mt-5">
  <h3>영역에 저장 후 메소드 호출하기</h3>
<%--  EL에서 객체의 메소드 호출 시 해당 메소드는 반환값이 있어야 함 --%>
  <p>001225-3000000 => ${myel.getGender("001225-3000000")}</p>
  <p>001225-4000000 => ${myel.getGender("001225-4000000")}</p>

  <br><hr><br>

  <h3>클래스명을 통해서 정적 메소드 호출하기</h3>
  <p>${MyELClass.showGugudan(5)}</p>

  <br><hr><br>

  <h3>TLD 파일 등록 후 정적 메소드 호출하기</h3>
  <ul class="list-group">
    <li class="list-group-item">mytag:isNumber("100") => ${mytag:isNumber("100")}</li>
    <li class="list-group-item">mytag:isNumber("이백") => ${mytag:isNumber("이백")}</li>
  </ul>
</div>
</body>
</html>











