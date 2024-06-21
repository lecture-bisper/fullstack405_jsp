<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 21.
  Time: 오후 4:04
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
<%
  // 클라이언트에서 전달받은 데이터 가져오기
  request.setCharacterEncoding("UTF-8");
  String searchText = request.getParameter("searchText");
%>

<%--DB 커넥션을 위한 파일 불러오기--%>
<%@ include file="dbConn.jsp"%>

<div class="container mt-5">
  <h2 class="text-center">Statement로 데이터 조회하기</h2>

  <%
    // 데이터베이스에 sql 쿼리문을 전달하기 위한 클래스
//    Statement : 간단한 sql 쿼리문을 사용할 경우 사용, 한번 사용 후 리소스를 해제함
//    PrepareStatement : 복잡한 형태의 sql 쿼리문을 사용할 경우 사용, 여러번 재활용 할 수 있음, sql 문 내에 ? 특수기호를 사용하고 나중에 해당 위치에 데이터를 추가하여 sql 쿼리문을 완성함
    Statement stmt = null;
//    ResultSet : 데이터베이스에서 select 쿼리문을 사용하여 조회된 데이터를 저장할 수 있는 클래스
    ResultSet rs = null;

    try {
      String sql = "SELECT id, pass, name, regidate FROM member ";
      sql += "WHERE id = '" + searchText + "' ";

      stmt = conn.createStatement();
//      executeQuery() : select 문 실행 시 사용하는 명령어, 실행 결과를 ResultRet 타입으로 반환
//      executeUpdate() : insert, update, delete 문 실행 시 사용하는 명령어, 실행 결과를 int 타입으로 반환
      rs = stmt.executeQuery(sql);

//      next() : ResultSet 클래스에서 제공하는 메소드로 출력할 데이터가 존재하는지 여부를 확인
//      getString() : ResultSet 클래스에서 제공하는 데이터 출력 메소드, String 타입으로 데이트 출력, 매개변수로 컬럼명을 사용을 사용하여 데이터 출력, 매개변수로 index 번호도 사용 가능
//      getInt() : ResultSet 클래스에서 제공하는 데이터출력 메소드, int 타입으로 데이터를 출력
//      getXXX() : ResultSet 클래스에서 제공하는 데이터 출력 메소드이며, 모든 데이터 타입 메소드가 다 존재함
      while (rs.next()) {
        String id = rs.getString("id");
        String pass = rs.getString("pass");
        String name = rs.getString("name");
        String regiDate = rs.getString("regidate");

        out.println("사용자 ID : " + id + "<br>");
        out.println("사용자 비밀번호 : " + pass + "<br>");
        out.println("사용자 이름 : " + name + "<br>");
        out.println("등록 일자 : " + regiDate + "<br>");
      }
    }
    catch (SQLException e) {
      out.println("데이터 조회 중 오류가 발생했습니다.");
      out.println("SQLException : " + e.getMessage());
    }
    finally {
//      리소스 해제 시 ResultSet > Statement > Connection 순서로 리소스를 해제 함
      if (rs != null) { rs.close(); }
      if (stmt != null) { stmt.close(); }
      if (conn != null) { conn.close(); }
    }
  %>
</div>
</body>
</html>











