<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 24.
  Time: 오전 9:18
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
  // 클라이언트에서 전달받은 데이터의 문자셋을 UTF-8로 설정
  request.setCharacterEncoding("UTF-8");
//  클라이언트에서 전달받은 데이터 가져오기
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");
  String userName = request.getParameter("userName");
%>

<%-- 데이터베이스 접속 정보를 미리 파일로 생성하여 만들어 놓음 --%>
<%@ include file="dbConn.jsp" %>

<div class="container mt-5">
  <h2 class="text-center">Statement로 데이터 수정하기</h2>

  <%
    // 데이터베이스로 sql 쿼리문을 전달하는 Statement 클래스 타입의 변수 생성
    Statement stmt = null;
//    sql update 문 생성
//    자바 소스 코드 내에서 sql 쿼리문을 직접 사용할 경우 sql 쿼리문의 문자열이 길기 때문에 += 연산자를 사용하여 여러줄의 sql 쿼리문을 연결해서 사용하게 됨
//    문자열을 연결해서 사용 시 문자열의 끝에 공백기호를 하나 추가하는 것이 좋음
    String sql = "UPDATE member SET pass = '" + userPw + "', name = '" + userName + "' ";
    sql += "WHERE id = '" + userId + "' ";

//    데이터베이스는 자바 프로그램의 외부에 존재하는 리소스이므로 반드시 try ~ catch 를 사용해야 함
    try {
//      Connection 클래스 타입의 객체를 사용하여 Statement 객체를 생성
      stmt = conn.createStatement();
//      Statement 객체를 통해서 sql문을 데이터베이스로 전달
//      executeUpdate()로 실행
      int result = stmt.executeUpdate(sql);
      out.println(result + "개의 항목을 수정했습니다.");
    }
    catch (SQLException e) {
      out.println("데이터베이스 수정 중 오류가 발생했습니다.");
      out.println("SQLException : " + e.getMessage());
    }
    finally { // 외부 리소스는 반드시 finally를 사용하여 리소스 해제를 해야 함
      try {
        if (stmt != null) { stmt.close(); }
        if (conn != null) { conn.close(); }
      }
      catch (Exception e) {}
    }
  %>
</div>
</body>
</html>











