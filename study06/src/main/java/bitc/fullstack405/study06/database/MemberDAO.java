package bitc.fullstack405.study06.database;

import java.sql.*;

// DAO : 데이터베이스를 컨트롤하기 위한 자바 클래스
// 각각의 메소드에 해당 테이블의 데이터를 추가, 삭제, 수정, 조회하는 기능을 구현하면 됨

public class MemberDAO {
  private Connection conn;
  private Statement stmt;
  private PreparedStatement pstmt;
  private ResultSet rs;

  private String dbDriver;
  private String dbUrl;
  private String dbUser;
  private String dbPass;

  public MemberDAO() {
    this.dbDriver = "com.mysql.cj.jdbc.Driver";
    this.dbUrl = "jdbc:mysql://localhost:3306/testdb1?characterEncoding=utf-8&serverTimezone=UTC";
    this.dbUser = "test1";
    this.dbPass = "full405";
  }

//  데이터베이스 연결
  public void dbOpen() {
    try {
      Class.forName(dbDriver);
      conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
    }
    catch (Exception e) {
      System.out.println("데이터베이스 연결에 실패했습니다.");
      e.printStackTrace();
    }
  }

//  데이터베이스 연결 종료
  public void dbClose() {
    try {
      if (rs != null) { rs.close(); }
      if (stmt != null) { stmt.close(); }
      if (pstmt != null) { pstmt.close(); }
      if (conn != null) { conn.close(); }
    }
    catch (Exception e) {}
    System.out.println("데이터베이스 연결을 종료했습니다.");
  }

//  지정한 id/pw를 가지고 있는 사용자가 있는지 여부 확인하는 메소드
//  매개변수로 사용자의 id/pw를 전달받음
  public boolean isMember(String userId, String userPw) {
//    결과값을 저장할 변수 선언, 기본값 false
    boolean result = false;

//    데이터베이스에 전달된 id/pw가 사용된 사용자가 있는지 count로 확인하는 sql문 생성
    String sql = "SELECT count(*) AS cnt ";
    sql += "FROM member ";
    sql += "WHERE id = ? ";
    sql += "AND pass = ? ";

    try {
//      PreparedStatement 객체 생성
      pstmt = conn.prepareStatement(sql);
//      sql의 ? 부분에 들어갈 데이터 추가
      pstmt.setString(1, userId);
      pstmt.setString(2, userPw);

//      데이터베이스에 sql을 전달하고 결과를 받아옴
      rs = pstmt.executeQuery();

//      가져온 결과의 내용 확인
      if (rs.next()) {
//        가져온 결과에서 getInt()로 데이터 출력 및 비교, 결과가 1이면 사용자 있음, 아니면 사용자 없음
        if (rs.getInt("cnt") == 1) {
          result = true; // 값 변경
        }
      }
    }
    catch (SQLException e) {
      System.out.println("데이터베이스 조회 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    finally {
      try {
        if (rs != null) { rs.close(); }
        if (pstmt != null) { pstmt.close();}
      }
      catch (Exception e) {}
    }
    return result;
  }

  //  지정한 사용자정보를 가져오는 메소드
//  매개변수로 사용자 id를 받아옴
  public MemberDTO getMemberInfo(String userId) {
//    데이터베이스와 데이터를 주고 받기 위한 DTO 클래스인 MemberDTO 클래스 타입의 변수 선언, 기본값 null
    MemberDTO result = null;

//    데이터베이스에서 지정한 사용자의 정보를 가져올 sql 쿼리문 생성
    String sql = "SELECT id, pass, name, regidate FROM member WHERE id = ? ";

    try {
//      PreparedStatement 객체 생성, 사용자 정보를 가져올 sql 쿼리문 등록
      pstmt = conn.prepareStatement(sql);
//      등록된 sql 쿼리문의 ? 부분에 데이터 추가
      pstmt.setString(1, userId);

//      데이터베이스로 sql문을 전달 및 결과 받아오기
      rs = pstmt.executeQuery();

//      가져온 데이터가 있는지 여부 확인
      if (rs.next()) {
//        가져온 데이터가 있을 경우 컬럼명을 통해서 데이터 출력
        String id = rs.getString("id");
        String pass = rs.getString("pass");
        String name = rs.getString("name");
        String regidate = rs.getString("regidate");

//        MemberDTO 클래스 타입의 객체 생성
        result = new MemberDTO();
//        MemberDTO 클래스 타입의 객체에 데이터베이스에서 가져온 데이터를 입력
        result.setId(id);
        result.setPass(pass);
        result.setName(name);
        result.setRegiDate(regidate);
      }
    }
    catch (Exception e) {
      System.out.println("데이터 조회 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    finally {
      try {
        if (rs != null) { rs.close(); }
        if (pstmt != null) { pstmt.close(); }
      }
      catch (Exception e) {}
    }

//    MemberDTO 클래스 타입의 객체를 반환
    return result;
  }


//  회원 가입, 매개변수로 사용자 id, pw, name을 받아옴
  public boolean insertMember(String userId, String userPw, String userName) {
//    회원 가입 결과를 저장할 변수 선언
    boolean result = false;

//    데이터베이스에 데이터를 추가할 insert sql 쿼리문을 생성
    String sql = "INSERT INTO member (id, pass, name, regidate) ";
    sql += "VALUES (?, ?, ?, now()) ";

    try {
      pstmt = conn.prepareStatement(sql);
//      등록된 sql 쿼리문의 ? 부분에 데이터 추가
      pstmt.setString(1, userId);
      pstmt.setString(2, userPw);
      pstmt.setString(3, userName);

//      데이터베이스로 sql 쿼리문 전달 및 결과를 받아옴
      int count = pstmt.executeUpdate();

//      받아온 결과가 0보다 클 경우 변수 result의 값 변경
      if (count > 0) {
        result = true;
      }
    }
    catch (SQLException e) {
      System.out.println("데이터베이스에서 입력 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    finally {
      try {
        if (pstmt != null) { pstmt.close(); }
      }
      catch (Exception e) {}
    }

    return result;
  }

//  회원 가입, 메소드 오버로딩을 사용함, 매개변수로 MemberDTO 클래스 타입의 객체를 받음
  public boolean insertMember(MemberDTO member) {
    boolean result = false;

    String sql = "INSERT INTO member (id, pass, name, regidate) ";
    sql += "VALUES (?, ?, ?, now()) ";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, member.getId());
      pstmt.setString(2, member.getPass());
      pstmt.setString(3, member.getName());

      int count = pstmt.executeUpdate();

      if (count > 0) {
        result = true;
      }
    }
    catch (SQLException e) {
      System.out.println("데이터베이스에서 입력 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    finally {
      try {
        if (pstmt != null) { pstmt.close(); }
      }
      catch (Exception e) {}
    }

    return result;
  }
}












