<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 1.
  Time: 오후 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- jstl 사용을 위해서 추가 --%>
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
<%-- page 영역에 데이터 저장 --%>
<c:set var="pageVar" value="page 영역에 저장" scope="page"></c:set>
<%-- request 영역에 데이터 저장 --%>
<c:set var="requestVar" value="request 영역에 저장" scope="request"></c:set>
<%-- import 사용 선언, 지정한 변수에 import로 가져올 URL을 저장, import 선언만하고 출력 안함 --%>
<%-- jstl의 import 는 액션 태그의 <jsp:include>와 같은 기능 --%>
<c:import url="./inc/OtherPage.jsp" var="contents">
  <c:param name="user_param1" value="JSP"></c:param>
  <c:param name="user_param2" value="기본서"></c:param>
</c:import>

<div class="container mt-5">
  <h3>다른 문서 삽입하기</h3>
<%--  EL언어로 변수의 내용을 출력 시 import 한 문서의 내용을 출력 --%>
  ${contents}

  <br><hr><br>

  <h3>외부 자원 삽입하기</h3>
  <iframe src="./inc/GoldPage.jsp" style="height: 600px;" class="w-100"></iframe>
</div>
</body>
</html>











