<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 21.
  Time: 오후 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>JDBC로 데이터 베이스 연결 테스트</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<%
  Connection conn = null;

  try {
    String url = "jdbc:mysql://localhost:3306/testdb1?characterEncoding=UTF-8&serverTimezone=UTC";
    String userId = "test1";
    String userPw = "full405";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, userId, userPw);
    out.println("데이터베이스 연결이 성공했습니다.");
  }
  catch (SQLException e) {
    out.println("데이터베이스 연결이 실패했습니다.<br>");
    out.println("SQLException : " + e.getMessage());
  }
  finally {
    if (conn != null) {
      conn.close();
    }
  }
%>
</body>
</html>











