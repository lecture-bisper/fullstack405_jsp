<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
  Time: 오후 2:56
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
<div class="container mt-5">
  <h2>web.xml 에 설정한 내용 읽어오기</h2>
<%--  getInitParameter(key) : web.xml 파일의 설정 내용 중 context-param의 자식 태그인 param-name 속성의 값과 1:1로 매칭되어 있는 param-value 의 값을 가져옴--%>
<%--  웹 어플리케이션의 전체 설정 정보를 저장하고 사용하는데 이용함 --%>
<%--  주로 DB 접속 정보를 저장해놓고 사용함 --%>
  <p>초기화 매개변수 : <%= application.getInitParameter("INIT_PARAM") %></p>

  <h2>서버의 물리적 경로 얻어오기</h2>
  <p>application 내장 객체 : <%=application.getRealPath("./")%></p>

  <h2>선언부에서 application 내장 객체 사용하기</h2>
  <%!
    public String useImplicitObject(ServletContext app) {
      return app.getRealPath("./");
    }
  %>

  <ul>
    <li>내장 객체를 인수로 전달 : <%=useImplicitObject(application)%></li>
  </ul>
</div>
</body>
</html>











