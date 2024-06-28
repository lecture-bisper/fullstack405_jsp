<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

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

<div class="container mt-5">
  <h2 class="text-center">List 컬렉션</h2>
  <%
    // List 타입의 데이터 생성, Object 타입을 저장할 수 있도록 List를 생성
    List<Object> alist = new ArrayList<>();
//    문자열 저장
    alist.add("청해진");
//    Person 클래스 타입의 객체 저장
    alist.add(new Person("장보고", 28));
//    page 영역에 데이터 저장
    pageContext.setAttribute("Ocean", alist);
  %>

  <ul class="list-group">
<%--    page 영역에 저장된 EL로 데이터 출력, 영역 지정을 하지 않았기 때문에 가장 낮은 영역의 데이터 출력 --%>
<%--    page 영역에 저장된 데이터가 List 타입이므로 index를 사용할 수 있음 --%>
    <li class="list-group-item">0번째 요소 : ${Ocean[0]}</li>
    <li class="list-group-item">1번째 요소 : ${Ocean[1].name}, ${Ocean[1].age}</li>
<%--  page 영역에 저장된 List의 최대 사용 범위를 초과하는 위치의 데이터를 출력 시 오류가 발생하지 않고 그냥 표시하지 않음 --%>
    <li class="list-group-item">2번째 요소 : ${Ocean[2]}</li>
  </ul>

  <hr>

  <%
    // Map 타입의 데이터 생성
    Map<String, String> map = new HashMap<>();
    map.put("한글", "훈민정음");
    map.put("Eng", "English");
    pageContext.setAttribute("King", map);
  %>
  <h2 class="text-center">Map 컬렉션</h2>
  <ul class="list-group">
<%--    영역 지정을 하지 않았기 때문에 가장 낮은 영역의 데이터 출력 --%>
<%--    영어 키의 경우 .과 [] 모두 사용 --%>
    <li class="list-group-item">영문 key : ${King["Eng"]}, ${King['Eng']}, ${King.Eng}</li>
<%--    한글 키의 경우 [] 사용 가능 --%>
    <li class="list-group-item">한글 Key : ${King["한글"]}, ${King['한글']}</li>
  </ul>
</div>
</body>
</html>











