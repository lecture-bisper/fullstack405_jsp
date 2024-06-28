<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
  Time: 오후 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--jstl 을 사용하기 위해서 taglib 호출 --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%--날짜 출력을 위해서 사용 --%>
<%@ page import="java.util.Date" %>

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
<%-- setAttribute() 와 동일한 기능을 하는 jstl의 set 을 사용 --%>
<%-- 변수명 directVar 로 설정, 값은 문자열 100을 입력, jstl에서는 숫자로 만들어진 문자열을 숫자로 자동 변환해서 사용--%>
<%-- set 에 scope 를 미설정 시 page 영역에 저장 --%>
<c:set var="directVar" value="100" ></c:set>
<%-- set으로 변수 선언 시 EL 언어로 값 입력 --%>
<c:set var="elVar" value="${directVar mod 5}" ></c:set>
<%-- set으로 변수 선언 시 JSP의 표현식으로 값 입력--%>
<c:set var="expVar" value="<%= new Date()%>"></c:set>
<%-- set으로 변수 선언 시 value 속성을 사용하지 않고 시작 태그와 끝 태그 사이에 값을 입력 --%>
<c:set var="betweenVar">변수값 요렇게 설정</c:set>

<div class="container mt-5">
  <h3>EL을 이용해 변수 출력</h3>
  <ul class="list-group">
    <li class="list-group-item">directVar : ${pageScope.directVar}</li>
    <li class="list-group-item">elVar : ${elVar}</li>
    <li class="list-group-item">expVar : ${expVar}</li>
    <li class="list-group-item">betweenVar : ${betweenVar}</li>
  </ul>

  <br><hr><br>

  <h3>자바빈즈 생성 1 - 생성자 사용</h3>
<%--  자바빈즈 생성 시 request 영역에 저장 --%>
  <c:set var="personVar1" value='<%= new Person("아이유", 30)%>' scope="request"></c:set>
  <ul class="list-group">
<%--    영역을 표시하면서 객체를 사용--%>
    <li class="list-group-item">이름 : ${requestScope.personVar1.name}</li>
<%--  영역 표시를 생략하여 지정한 이름을 가지고 있는 가장 낮은 영역의 변수를 가져옴 --%>
    <li class="list-group-item">나이 : ${personVar1.age}</li>
  </ul>

  <br><hr><br>

  <h3>자바빈즈 생성 2 - target, property 사용</h3>
<%--  set을 사용하여 자바빈즈 생성, request 영역에 저장 --%>
  <c:set var="personVar2" value="<%= new Person()%>" scope="request"></c:set>
<%--  set을 사용하여 지정한 자바빈즈의 지정한 필드에 데이터 저장 --%>
<%--  액션 태그의 useBean, setProperty와 동일한 기능--%>
  <c:set target="${personVar2}" property="name" value="유인나"></c:set>
  <c:set target="${personVar2}" property="age" value="42"></c:set>
  <ul class="list-group">
<%--    사용 영역을 생략 시 지정한 이름을 가지고 있는 변수 중 가장 낮은 영역에 저장된 변수를 가져옴--%>
    <li class="list-group-item">이름 : ${personVar2.name}</li>
    <li class="list-group-item">나이 : ${requestScope.personVar2.age}</li>
  </ul>
</div>
</body>
</html>











