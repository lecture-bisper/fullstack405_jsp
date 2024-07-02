package bitc.fullstack405.study11.database;

import jakarta.servlet.ServletContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBConnect {
  private String dbDriver;
  private String dbUrl;
  private String dbUser;
  private String dbPass;

  public Connection conn;
  public PreparedStatement pstmt;
  public ResultSet rs;

  public JDBConnect() {
    this(
        "com.mysql.cj.jdbc.Driver",
        "jdbc:mysql://localhost:3306/testdb1?characterEncoding=UTF-8&serverTimezone=UTC",
        "test1",
        "full405"
    );
  }

  public JDBConnect(ServletContext app) {
//    다른 생성자 호출
    this(
//        web.xml에 있는 정보를 가져와서 사용
        app.getInitParameter("MySqlDriver"),
        app.getInitParameter("MySqlUrl"),
        app.getInitParameter("MySqlUser"),
        app.getInitParameter("MySqlPass")
    );
  }

  public JDBConnect(String dbDriver, String dbUrl, String dbUser, String dbPass) {
    this.dbDriver = dbDriver;
    this.dbUrl = dbUrl;
    this.dbUser = dbUser;
    this.dbPass = dbPass;
  }

  public void dbOpen() {
    try {
      Class.forName(dbDriver);
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
      System.out.println("데이터베이스가 연결되었습니다.");
    }
    catch (Exception e) {
      System.out.println("데이터베이스 연결이 실패했습니다.");
      System.out.println("Exception : " + e.getMessage());
    }
  }

  public void dbClose() {
    try {
      if (rs != null) { rs.close(); }
      if (pstmt != null) { pstmt.close(); }
      if (conn != null) { conn.close(); }
      System.out.println("데이터베이스 리소스를 해제했습니다.");
    }
    catch (Exception e) {
      System.out.println("데이터베이스 리소스 해제 중 오류가 발생했습니다.");
      System.out.println("Exception : " + e.getMessage());
    }
  }
}












