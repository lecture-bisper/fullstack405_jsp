<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 18.
  Time: 오후 2:34
  To change this template use File | Settings | File Templates.
--%>
<%-- buffer : 데이터를 표현하기 위한 임시 메모리 공간, 기본값은 8kb --%>
<%-- 버퍼가 모두 찼을 경우 버퍼를 비우지 않으면 더이상 데이터를 저장할 수 없어 오류가 발생함 --%>
<%-- autoFlush : 버퍼에 데이터가 다 차면 버퍼의 내용을 화면에 출력하고 버퍼를 비움, 기본값은 true --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" buffer="1kb" autoFlush="false" %>

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
<%
  for (int i = 1; i <= 100; i++) {
    out.println("abcdef123456");
  }
%>
</body>
</html>











