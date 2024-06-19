<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
  Time: 오후 3:19
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

<%--exception : jsp가 미리 생성해 놓은 예외처리 객체 --%>
<%--page 지시어를 사용하여 errorPage에 설정해 놓은 페이지로 이동시키고, errorPage로 지정된 jsp 파일에 page 지시어 isErrorPage=true 일 때 exception 객체를 사용할 수 있음--%>
<%--web.xml에 error-page 속성을 설정하면 page 지시어에 errorPage 속성 및 isErrorPage=true 를 설정하지 않아도 오류 발생 시 모든 jsp 페이지에서 web.xml에서 설정한 오류 처리 페이지가 열림 --%>
<%
  //getStatus() : 현재 접속 상태 값을 가져옴, 200/300/400/500
  int status = response.getStatus();
  System.out.println(status);

  if (status == 404) {
    out.print("404 에러가 발생하였습니다.");
  }
  else if (status == 405) {
    out.print("405 에러가 발생하였습니다.");
    out.print("<br>요청방식(mehtod)을 확인해주세요");
  }
  else if (status == 500) {
    out.println("500에러가 발생하였습니다.");
    out.println("<br>소스 코드에 오류가 없는지 확인해주세요");
  }
%>
</body>
</html>











