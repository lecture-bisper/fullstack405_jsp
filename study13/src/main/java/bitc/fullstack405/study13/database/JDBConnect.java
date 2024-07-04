package bitc.fullstack405.study13.database;

import jakarta.servlet.ServletContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBConnect {
  protected Connection conn;
  protected PreparedStatement pstmt;
  protected ResultSet rs;

  private String dbDriver;
  private String dbUrl;
  private String dbUserId;
  private String dbUserPw;

  protected boolean dbOpen = false;

  public JDBConnect() {
    this(
        "com.mysql.cj.jdbc.Driver",
        "jdbc:mysql://localhost:3306/testdb1?characterEncoding=UTF-8&serverTimezone=UTC",
        "test1",
        "full405"
    );
  }

  public JDBConnect(ServletContext application) {
    this(
        application.getInitParameter("MySqlDriver"),
        application.getInitParameter("MySqlUrl"),
        application.getInitParameter("MySqlUserId"),
        application.getInitParameter("MySqlUserPw")
    );
  }

  public JDBConnect(String dbDriver, String dbUrl, String dbUserId, String dbUserPw) {
    this.dbDriver = dbDriver;
    this.dbUrl = dbUrl;
    this.dbUserId = dbUserId;
    this.dbUserPw = dbUserPw;
  }

  public boolean isDbOpen() {
    return dbOpen;
  }

  public void dbOpen() {
    try {
      Class.forName(dbDriver);
      conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
      this.dbOpen = true;
      System.out.println("----- DB 연결에 성공했습니다. -----");
    }
    catch (Exception e) {
      this.dbOpen = false;
      System.out.println("----- DB 연결에 실패했습니다. -----");
      System.out.println(e.getMessage());
    }
  }

  public void dbClose() {
    try {
      if (rs != null) { rs.close(); }
      if (pstmt != null) { pstmt.close(); }
      if (conn != null) { conn.close(); }
      this.dbOpen = false;
      System.out.println("----- DB 리소스를 모두 제거하였습니다. -----");
    }
    catch (Exception e) {
      System.out.println("----- DB 리소스 해제 중 오류가 발생했습니다. -----");
    }
  }
}












