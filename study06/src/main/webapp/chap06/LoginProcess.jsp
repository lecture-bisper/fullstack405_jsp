<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 25.
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--DB 사용을 위해 import--%>
<%@ page import="java.sql.*" %>

<%--서버 내부적으로 로그인 여부를 확인하고 페이지를 리다이렉트하는 페이지--%>
<%
  // 클라이언트에서 로그인에 필요한 id/pw를 전달받음
  request.setCharacterEncoding("UTF-8");
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");

//  데이터베이스 사용 시 필요한 클래스 타입의 변수 생성
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

//  데이터베이스 접속 정보
  String dbDriver = "com.mysql.cj.jdbc.Driver";
  String dbUrl = "jdbc:mysql://localhost:3306/testdb1?characterEncoding=utf-8&serverTimezone=UTC";
  String dbUser = "test1";
  String dbPass = "full405";

//  데이터베이스 드라이버 로드
  Class.forName(dbDriver);
//  데이터베이스 접속
  conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

  try {
//    전달받은 id/pw로 로그인이 가능한지 여부 확용 sql 문 생성, 결과가 0이면 실패, 1이면 성공
    String sql = "SELECT count(*) AS cnt ";
    sql += "FROM member ";
    sql += "WHERE id = ? ";
    sql += "AND pass = ? ";

//    PreparedStatement 객체를 생성
    pstmt = conn.prepareStatement(sql);
//    sql 쿼리문에 데이터 값 추가
    pstmt.setString(1, userId);
    pstmt.setString(2, userPw);
//    데이터베이스에서 id/pw로 조회
    rs = pstmt.executeQuery();

    while (rs.next()) {
//      조회한 결과값 저장
      int count = rs.getInt("cnt");

//      결과값이 1이면 로그인 성공, 0이면 로그인 실패
      if (count > 0) {
//        사용자 정보를 가져오기 위한 sql문 생성
        sql = "SELECT id, pass, name, regidate FROM member WHERE id = ? ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
//        사용자 정보를 데이터베이스에서 가져옴
        ResultSet result = pstmt.executeQuery();

        if (result.next()) {
//          가져온 데이터베이스 정보를 세션영역에 저장
          session.setAttribute("userId", result.getString("id"));
          session.setAttribute("userName", result.getString("name"));
          session.setAttribute("regiDate", result.getString("regidate"));
          session.setMaxInactiveInterval(60 * 10);
//          로그인 성공 페이지로 이동
          response.sendRedirect("LoginOK.jsp");
        }
        else {
//          가져온 데이터가 없으면 로그인 실패 페이지로 이동
          response.sendRedirect("LoginFail.jsp");
        }
      }
      else {
//        로그인 정보가 0이 면 로그인 실패 페이지로 이동
        response.sendRedirect("LoginFail.jsp");
      }
    }
  }
  catch (SQLException e) {
    out.println("데이터베이스 사용 중 오류가 발생했습니다.");
    out.println("SQLException : " + e.getMessage());
  }
  finally {
    try {
      if (rs != null) { rs.close(); }
      if (pstmt != null) { rs.close(); }
      if (conn != null) { conn.close(); }
    }
    catch (Exception e) {}
  }

////  전달받은 id/pw가 서버에 존재하는지 여부 확인
//  if (userId.equals("test1") && userPw.equals("1234")) {
////    로그인 성공 시 세션에 데이터 추가
//    session.setAttribute("userId", userId);
//    session.setAttribute("userName", "테스터01");
////    세션 유지 시간 설정
//    session.setMaxInactiveInterval(60 * 1);
//
////    로그인 성공 시 사용자가 보는 페이지로 이동
//    response.sendRedirect("LoginOK.jsp");
//  }
//  else {
////    로그인 실패 시 사용자가 보는 페이지로 이동
//    response.sendRedirect("LoginFail.jsp");
//  }
%>











