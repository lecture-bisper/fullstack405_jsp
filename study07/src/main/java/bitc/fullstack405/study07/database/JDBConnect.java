package bitc.fullstack405.study07.database;

import jakarta.servlet.ServletContext;

import java.sql.*;

public class JDBConnect {
  private String dbDriver;
  private String dbUrl;
  private String dbUser;
  private String dbPass;

  public Connection conn;
  public Statement stmt;
  public PreparedStatement pstmt;
  public ResultSet rs;

//  생성자 오버로딩을 사용하여 여러개의 생성자 선언
  public JDBConnect() {
    this(
        "com.mysql.cj.jdbc.Driver",
        "jdbc:mysql://localhost:3306/testdb1?characterEncoding=UTF-8&serverTimezone=UTC",
        "test1",
        "full405"
    );
  }

//  web.xml 에 입력된 내용을 가져와서 사용
  public JDBConnect(ServletContext app) {
    this(
        app.getInitParameter("MySqlDriver"),
        app.getInitParameter("MySqlUrl"),
        app.getInitParameter("MySqlUser"),
        app.getInitParameter("MySqlPass")
    );
  }

//  사용자가 매개변수로 전달한 정보를 사용
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
      System.out.println("데이터베이스에 연결했습니다.");
    }
    catch (Exception e) {
      System.out.println("데이터베이스 연결에 실패했습니다.");
      e.printStackTrace();
    }
  }

  public void dbClose() {
    try {
      if (rs != null) { rs.close(); }
      if (stmt != null) { stmt.close(); }
      if (pstmt != null) { pstmt.close(); }
      if (conn != null) { conn.close(); }
      System.out.println("데이터베이스 연결 및 리소스를 해제했습니다.");
    }
    catch (Exception e) {
      System.out.println("데이터베이스 연결 및 리소스 해제 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
  }
}












