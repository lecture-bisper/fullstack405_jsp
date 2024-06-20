<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 20.
  Time: 오전 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack405.study03.dto.Person" %>

<%
  // request 영역에 데이터 저장
  request.setAttribute("requestString", "request 영역의 문자열");
  request.setAttribute("requestPerson", new Person("안중근", 31));
  request.setAttribute("requestBoolean", true);
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
  <h2>request 영역의 속성값 삭제하기</h2>
  <%
    // removeAttribute() : 지정한 영역에서 지정한 key를 가지고 있는 데이터 삭제, 지정한 키가 없어도 오류 나지 않음
    request.removeAttribute("requestString"); // 데이터 삭제
    request.removeAttribute("requestInteger"); // 데이터 삭제 실패, 오류는 발생하지 않음
  %>

  <br>

  <h2>request 영역의 속성값 읽기</h2>
  <%
    // getAttribute() : 지정한 영역에서 지정한 key를 가지고 있는 데이터를 출력, 지정한 key가 없으면 null 출력
    Person reqPerson = (Person) request.getAttribute("requestPerson");
  %>

  <ul>
    <li>Boolean 객체 : <%=request.getAttribute("requestBoolean")%></li>
    <li>String 객체 : <%=request.getAttribute("requestString")%></li>
    <li>Person 객체 : <%=reqPerson.getName()%>, <%=reqPerson.getAge()%></li>
  </ul>

  <br>

  <h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
  <%
    // getRequestDispatcher() : 이동할 페이지 지정
//    forward() : 지정한 페이지로 이동
    request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request, response);
  %>

  <h2>a 태그로 페이지 했을 경우 request 영역 속성값 읽기</h2>
  <a href="RequestForward.jsp?paramHan=한글&paramEng=English" target="_blank" class="btn btn-link">RequestForward 페이지를 링크를 통해서 이동</a>

</div>
</body>
</html>











