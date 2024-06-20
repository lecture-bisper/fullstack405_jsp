<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 20.
  Time: 오전 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>

<%@ page import="bitc.fullstack405.study03.dto.Person" %>

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
  <h2>application 영역의 속성 읽기</h2>
  <%
    // application 영역에 저장된 데이터 가져오기
    // getAttribute() 로 가져올 경우 Object 타입으로 출력되기 때문에 강제 타입 변환 필요
    Map<String, Person> maps = (HashMap<String, Person>) application.getAttribute("maps");
    Set<String> keys = maps.keySet();

    for (String key : keys) {
//      Map 타입에 저장된 실제 데이터는 Person 클래스 타입의 객체이기 때문에 Person 클래스 타입의 변수에 저장
      Person person = maps.get(key);
      out.println(String.format("이름 : %s, 나이 : %d<br>", person.getName(), person.getAge()));
    }
  %>
</div>
</body>
</html>











