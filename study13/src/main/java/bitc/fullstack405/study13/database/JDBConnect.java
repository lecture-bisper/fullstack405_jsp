package bitc.fullstack405.study13.database;

import jakarta.servlet.ServletContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// JDBC 를 사용하여 데이터베이스에 접속하기 위한 클래스 (부모 클래스로 사용)
public class JDBConnect {
//  DB 접속을 담당
  protected Connection conn;
//  DB에 SQL 쿼리문을 전달 및 결과를 받아오는 클래스
  protected PreparedStatement pstmt;
//  DB에서 실행된 SELECT 문의 결과를 저장하는 클래스
  protected ResultSet rs;

//  사용할 DB 드라이버 정보를 저장할 변수
  private String dbDriver;
//  접속할 DB의 주소를 저장할 변수
  private String dbUrl;
//  DB 사용자 ID
  private String dbUserId;
//  DB 사용자 password
  private String dbUserPw;

//  현재 DB 접속 여부를 확인할 때 사용
  protected boolean dbOpen = false;

//  DB 접속 세팅
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

//  DB 접속 메소드
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

//  DB 접속 해제 메소드
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












