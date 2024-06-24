<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 24.
  Time: 오후 2:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

<%-- DB 접속 정보가 있는 JDBConnect 클래스를 import 함 --%>
<%@ page import="bitc.fullstack405.study04.JDBConnect" %>

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
  <h2 class="text-center">Java Class를 사용하여 DB 연결</h2>

  <div>
    <%
      // JDBConnect 클래스 타입의 객체 생성
      JDBConnect jdbCon = new JDBConnect();

      try {
//        sql 쿼리문 생성
        String sql = "SELECT * FROM member ";

//        Statement 클래스 타입의 변수에 Connection 클래스 타입의 객체를 사용하여 Statement 클래스 타입의 객체 생성
        jdbCon.stmt = jdbCon.conn.createStatement();
//        executeQuery()를 호출하여 데이터베이스에서 데이터 조회
        jdbCon.rs = jdbCon.stmt.executeQuery(sql);

        while (jdbCon.rs.next()) {
          out.println("<p>" + jdbCon.rs.getString("name") + "</p>");
        }
      }
      catch (SQLException e) {
        out.println("데이터 조회 중 오류가 발생합니다.");
        out.println("SQLException : " + e.getMessage());
      }
      finally {
        jdbCon.close();
      }
    %>
  </div>
</div>
</body>
</html>











