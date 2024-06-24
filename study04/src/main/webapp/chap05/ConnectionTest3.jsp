<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 24.
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>

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
  <h2 class="text-center">web.xml 을 사용하여 DB 연결</h2>

  <div>
    <%
      // JSP 내장 객체인 application의 getInitParameter() 메소드를 사용하여 web.xml에 존재하는 context-param 태그의 값을 읽어옴
      String driver = application.getInitParameter("MySqlDriver");
      String dbUrl = application.getInitParameter("MySqlServerUrl");
      String dbUser = application.getInitParameter("MySqlUserId");
      String dbPass = application.getInitParameter("MySqlUserPw");
      String dbOpt1 = application.getInitParameter("MySqlOpt1");
      String dbOpt2 = application.getInitParameter("MySqlOpt2");

//      xml 파일에서 ?, & 특수 기호를 정상적으로 읽지 못하는 경우가 있음
//      해당 부분을 따로 분리하여 자바코드에서 하나의 문자열로 만듬
//      특수기호가 정상적으로 인식되지 않을 경우 html 의 특수기호로 입력 시 정상적으로 인식됨
      dbUrl += "?" + dbOpt1 + "&" + dbOpt2;

//      JDBConnect 클래스 타입의 객체 생성
//      생성자의 매개변수로 web.xml에서 가져온 정보를 넘김
      JDBConnect jdbCon = new JDBConnect(driver, dbUrl, dbUser, dbPass);

      try {
        String sql = "SELECT * FROM member ";
        jdbCon.stmt = jdbCon.conn.createStatement();
        jdbCon.rs = jdbCon.stmt.executeQuery(sql);

        while (jdbCon.rs.next()) {
          out.println("<p>" + jdbCon.rs.getString("name") + "</p>");
        }
      }
      catch (SQLException e) {
        out.println("데이터 조회 중 오류가 발생했습니다.");
        out.println("SQLException : " + e.getMessage());
      }
      finally {
        jdbCon.close();
      }
    %>

    <%
      // JSP의 내장 객체인 application 을 JDBConnect 클래스 생성자의 매개변수로 넘김
      JDBConnect jdbCon2 = new JDBConnect(application);

      try {
        String sql = "SELECT * FROM member ";
        jdbCon2.stmt = jdbCon2.conn.createStatement();
        jdbCon2.rs = jdbCon2.stmt.executeQuery(sql);

        while (jdbCon2.rs.next()) {
          out.println("<p>" + jdbCon2.rs.getString("name") + "</p>");
        }
      }
      catch (SQLException e) {
        out.println("데이터 조회 중 오류가 발생했습니다.");
        out.println("SQLException : " + e.getMessage());
      }
      finally {
        jdbCon2.close();
      }
    %>
  </div>
</div>
</body>
</html>











