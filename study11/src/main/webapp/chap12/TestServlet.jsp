<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 2.
  Time: 오전 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>서블릿 사용하기</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%-- 접속 순서 --%>
<%-- 1. /chap12/TestServlet.jsp 파일로 접속 --%>
<%-- 2. jsp 파일의 내용을 클라이언트에 출력 --%>
<%-- 3. a 태그 클릭 (/TestServlet.do 로 이동) --%>
<%-- 4. 설정 파일(web.xml) 확인 --%>
<%-- 5. web.xml 파일의 <servlet-mapping> 태그의 자식 태그 중 <url-pattern> 패턴의 내용과 a 태그에서 href속성으로 지정한 위치가 같은지 확인 --%>
<%-- 6. 해당 url과 일치하는 url이 있을 경우 <servlet-name>의 값을 확인 --%>
<%-- 7. web.xml 파일의 <servlet> 태그의 자식 태그 중 <servlet-name> 과 일치하는지 확인 --%>
<%-- 8. 일치하는 <servlet-name> 값이 있으면 연동된 <servlet-class>를 확인하고 해당 클래스로 이동--%>
<%-- 9. 요청시 사용한 통신방식(get, post)에 따라 doGet(), doPost() 메소드를 호출 --%>
<%-- 10. doGet(), doPost()에서 내부로직을 처리하고 getRequestDispatcher()를 사용하여 이동할 jsp 파일을 설정하고, forward()를 통해서 해당 jsp 파일로 이동 --%>

<div class="container mt-5">
  <h3>web.xml 에서 매핑 후 JSP에서 출력하기</h3>
  <p>
<%--    request 영역에 저장된 message 라는 이름의 변수 가져오기 --%>
<%--    현재 페이지를 웹 브라우저에 url을 직접 입력하여 접속 시 request에 저장된 데이터를 가져올 수 없음 --%>
    <strong><%=request.getAttribute("message")%></strong>
    <br>
<%--    tomcat 서버로 해당 주소를 요청 -> web.xml 파일에 등록된 서블릿의 url을 검색 -> 해당 url을 가지고 있는 서블릿이름과 동일한 서블릿 이름을 검색 -> 해당 서블릿 이름을 사용하고 있는 클래스 파일을 확인하고 해당 클래스 파일의 doGet()/doPost()를 호출 --%>
    <a href="/TestServlet.do" target="_blank" class="btn btn-link">web.xml 설정한 서블릿 바로 가기</a>
  </p>
  <br>
  <div>
    <a href="/TestServlet2.do" target="_blank" class="btn btn-link">@WebServlet을 사용한 서블릿 바로 가기</a>
    <div>
      <p class="fs-3">TestServlet2에서 전달한 내용 : <%=request.getAttribute("msg")%></p>
    </div>
  </div>
</div>
</body>
</html>











