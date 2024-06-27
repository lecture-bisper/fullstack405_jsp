package bitc.fullstack405.study07.database;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;

// 데이터베이스 접속 정보 및 연결 메소드를 JDBConnect 클래스에서 상속받음
public class MemberDAO extends JDBConnect {
  
//  부모 클래스의 생성자를 호출하기 위한 생성자
  public MemberDAO() {
    super();
  }

  public MemberDAO(ServletContext app) {
    super(app);
  }

  public MemberDAO(String dbDriver, String dbUrl, String dbUser, String dbPass) {
    super(dbDriver, dbUrl, dbUser, dbPass);
  }
  
//  입력한 id/pw를 사용한 회원 여부 확인 메소드
  public boolean isLogin(String id, String pwd) {
    boolean result = false;

//    sql 쿼리문을 데이터베이스로 전달 및 결과 받아오기
    try {
      String sql = "SELECT count(*) AS cnt FROM member ";
      sql += "WHERE id = ? AND pass = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      pstmt.setString(2, pwd);

//      select 문을 사용하기 때문에 executeQuery() 사용
//      결과가 ResultSet 타입으로 넘어옴
      rs = pstmt.executeQuery();

//      select 문의 결과가 무조건 1개는 존재하기 때문에 rs.next()는 언제나 true가 됨
      if (rs.next()) {
//        가져온 결과가 1이면 로그인 가능, 0이면 같은 정보가 없어서 로그인 불가능
        if (rs.getInt("cnt") == 1) {
          result = true;
        }
      }
    }
    catch (SQLException e) {
      System.out.println("데이터베이스 조회 중 오류가 발생했습니다.");
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

//  회원 정보 조회 메소드
  public MemberDTO getMemberInfo(String id) {
    MemberDTO result = null;

    try {
      String sql = "SELECT id, pass, name, regidate FROM member WHERE id = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        result = new MemberDTO();
        result.setId(rs.getString("id"));
        result.setPass(rs.getString("pass"));
        result.setName(rs.getString("name"));
        result.setRegiDate(rs.getString("regidate"));
      }
    }
    catch (SQLException e) {
      System.out.println("데이터베이스 조회 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    finally {
      try {
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
      }
      catch (Exception e) {}
    }

    return result;
  }

//  회원 정보 입력 메소드
  public int insertMember(MemberDTO member) {
    int result = 0;

    try {
      String sql = "INSERT INTO member (id, pass, name, regidate) ";
      sql += "VALUES (?, ?, ?, now()) ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, member.getId());
      pstmt.setString(2, member.getPass());
      pstmt.setString(3, member.getName());

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터베이스에 추가 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    finally {
      try {
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
      }
      catch (Exception e) {}
    }

    return result;
  }

//  회원 정보 수정 메소드

//  회원 정보 삭제 메소드
}












