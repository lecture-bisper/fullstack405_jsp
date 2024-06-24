<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 24.
  Time: 오전 11:13
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
  request.setCharacterEncoding("UTF-8");
  String userId = request.getParameter("searchText");
%>

<%@ include file="dbConn.jsp" %>

<div class="container mt-5">
  <h2 class="text-center">PreparedStatement로 select 사용</h2>

  <%
    // sql 쿼리문을 전달하기 위한 PreparedStatement 클래스 타입의 변수를 선언
    PreparedStatement pstmt = null;
//    조회된 정보를 받아오기 위한 ResultSet 클래스 타입의 변수 선언
    ResultSet rs = null;

//    쿼리문 생성
    String sql = "SELECT id, pass, name, regidate ";
    sql += "FROM member ";
    sql += "WHERE id = ? ";

    try {
//      Connection 객체를 통해서 PreparedStatement 클래스 타입의 객체를 생성, 매개변수로 sql을 추가함
      pstmt = conn.prepareStatement(sql);
//      기존에 생성된 sql 쿼리문의 ? 기호 부분에 데이터를 추가함
      pstmt.setString(1, userId);

//      executeQuery() 를 호출하여 데이터베이스로 sql문을 전달, 조회된 결과를 받아옴
      rs = pstmt.executeQuery();

//      next() 를 호출하여 ResultSet에 저장된 데이터가 있는지 확인
      while (rs.next()) {
//        가져온 데이터 덩어리에서 getXXX(컬럼명) 메소드를 사용하여 해당하는 컬럼의 데이터를 출력
        String id = rs.getString("id");
        String pass = rs.getString("pass");
        String name = rs.getString("name");
        String regiDate = rs.getString("regidate");

        out.println("사용자 ID : " + id + "<br>");
        out.println("사용자 비밀번호 : " + pass + "<br>");
        out.println("사용자 이름 : " + name + "<br>");
        out.println("사용자 정보 등록 날짜 : " + regiDate + "<br>");
      }
    }
    catch (SQLException e) {
      out.println("데이터베이스 조회 중 오류가 발생했습니다.");
      out.println("SQLException : " + e.getMessage());
    }
    finally {
      try {
        if (rs != null) { rs.close(); }
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
      }
      catch (Exception e) {}
    }
  %>
</div>
</body>
</html>

<%--문제 1) PreparedStatement를 사용하여 update, delete 를 구현하세요 --%>
<%-- 파일명 : Update02.jsp, Update02Process.jsp, Delete02.jsp, Delete02Process.jsp --%>









