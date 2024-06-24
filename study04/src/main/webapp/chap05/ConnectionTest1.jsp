<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 24.
  Time: 오후 1:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

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

<%@ include file="dbConn.jsp"%>

<div class="container mt-5">
  <h2>기존의 JSP 파일을 통해서 DB 접속하기</h2>

  <div>
    <%
      Statement stmt = null;
      ResultSet rs = null;

      try {
        String sql = "SELECT * FROM member ";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        while (rs.next()) {
          out.println("<p>" + rs.getString("name") + "</p>");
        }
      }
      catch(SQLException e) {
        out.println("데이터 조회 중 오류가 발생했습니다.");
        out.println("SQLException : " + e.getMessage());
      }
      finally {
        try {
          if (rs != null) { rs.close(); }
          if (stmt != null) { stmt.close(); }
          if (conn != null) { conn.close(); }
        }
        catch (Exception e) {}
      }
    %>
  </div>
</div>
</body>
</html>











