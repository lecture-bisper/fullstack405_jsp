package bitc.fullstack405.study04;

import jakarta.servlet.ServletContext;

import java.sql.*;

// 자바로 데이터베이스에 접속하기 위한 클래스
public class JDBConnect {
  public Connection conn;
  public Statement stmt;
  public PreparedStatement pstmt;
  public ResultSet rs;

//  생성자에 DB 접속 정보를 직접 입력
  public JDBConnect() {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");

      String dbUrl = "jdbc:mysql://localhost:3306/testdb1?characterEncoding=utf-8&serverTimezone=UTC";
      String dbUser = "test1";
      String dbPass = "full405";

      conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
      System.out.println("DB 연결 성공 (기본 생성자 사용)");
    }
    catch (Exception e) {
      System.out.println("DB 연결 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }

//  DB 접속 정보를 매개변수로 전달받아 접속
  public JDBConnect(String driver, String dbUrl, String dbUser, String dbPass) {
    try {
//      매개변수로 받아온 드라이버 정보로 데이터베이스 드라이버 로드
      Class.forName(driver);
//      매개변수로 받아온 서버 주소 및 사용자 정보로 데이터베이스에 접속
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

      System.out.println("DB 연결 성공 (매개변수가 있는 생성자)");
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }

  public JDBConnect(ServletContext application) {
    try {
//  매개변수로 받은 application 내장객체를 사용하여 web.xml의 내용을 가져옴
      String dbDriver = application.getInitParameter("MySqlDriver");
      String dbUrl = application.getInitParameter("MySqlServerUrl");
      String dbUser = application.getInitParameter("MySqlUserId");
      String dbPass = application.getInitParameter("MySqlUserPw");
      String dbOpt1 = application.getInitParameter("MySqlOpt1");
      String dbOpt2 = application.getInitParameter("MySqlOpt2");

      dbUrl += "?" + dbOpt1 + "&" + dbOpt2;

      Class.forName(dbDriver);
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
      System.out.println("DB 연결 성공 ()");
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }

  public void close() {
    try {
      if (rs != null) { rs.close(); }
      if (stmt != null) { stmt.close(); }
      if (pstmt != null) { pstmt.close(); }
      if (conn != null) { conn.close(); }
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }
}












