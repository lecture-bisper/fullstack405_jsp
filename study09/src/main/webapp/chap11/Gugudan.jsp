<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- JSTL 예전 버전(tomcat 8까지) 사용시--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>

<%-- JSTL 현재 버전(tomcat 9, 10) 사용 시 taglib --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
  <h2>기존 JSP로 구구단 출력</h2>
  <table class="table table-hover table-striped">
    <tbody>
      <%
        for (int dan = 2; dan < 10; dan++) {
      %>
        <tr>
          <%
            for (int su = 1; su < 10; su++) {
          %>
              <td><%=dan%> * <%=su%> = <%=dan * su%></td>
          <%
            }
          %>
        </tr>
      <%
        }
      %>
    </tbody>
  </table>

  <br><hr><br>

  <h2>JSTL로 구구단 출력</h2>
  <table class="table table-hover table-striped">
    <tbody>
      <c:forEach begin="2" end="9" var="dan">
        <tr>
          <c:forEach begin="1" end="9" var="su">
            <td>${dan} * ${su} = ${dan * su}</td>
          </c:forEach>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>











