<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 21.
  Time: 오후 2:18
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
<div class="container mt-5">
  <%
    // Connection : java.sql 패키지에서 제공하는 데이터베이스 접속을 진행하는 클래스
    Connection conn = null;

    try {
//      데이터베이스 접속 주소
//      jdbc : 데이터베이스 접속 시 사용하는 커넥터 종류, 자바에서는 jdbc 사용
//      mysql : 데이터베이스 종류 설정
//      //localhost:3306 : 데이터베이스 서버 주소 및 포트번호
//      /testdb1 : 접속한 데이터베이스 서버에서 현재 프로젝트에서 사용할 데이터베이스명
//      ? 뒤에 있는 쿼리스트링은 추가 옵션을 입력함
      String dbUrl = "jdbc:mysql://localhost:3306/testdb1?characterEncoding=UTF-8&serverTimezone=UTC";
//      데이터베이스 사용자 정보
      String dbUser = "test1";
      String dbPass = "full405";

//      JDBC 드라이버 불러오기
//      com.mysql.cj.jdbc.Driver : 최신버전의 mysql jdbc 드라이버명 (구버전 : com.mysql.jdbc.Driver)
      Class.forName("com.mysql.cj.jdbc.Driver");
//      getConnection() : 지정한 주소와 사용자 정보를 사용하여 실제로 데이터베이스에 접속
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
      out.println("데이터베이스 연결이 성공했습니다.");
    }
    catch (SQLException e) {
      out.println("데이터베이스 연결이 실패했습니다.<br>");
      out.println("SQLException : " + e.getMessage());
    }
    catch (Exception e) {
      out.println(e.getMessage());
    }
    finally {
//      conn이 null 아닐 경우는 한번 이상 데이터베이스 접속했다는 의미
//      conn.close() : 데이터베이스 접속을 종료
      if (conn != null) { conn.close(); }
    }
  %>
</div>
</body>
</html>











