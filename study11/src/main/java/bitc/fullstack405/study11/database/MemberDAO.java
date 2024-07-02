package bitc.fullstack405.study11.database;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;

//JDBConnect 클래스를 상속받아 사용하는 MemberDAO 클래스
public class MemberDAO extends JDBConnect {

  public MemberDAO() {
    super();
  }

//  jsp의 application 내장 객체 정보를 매개변수로 받아서 사용
  public MemberDAO(ServletContext application) {
//    부모 클래스의 생성자 호출
    super(application);
  }

  public MemberDAO(String dbDriver, String dbUrl, String dbUser, String dbPass) {
    super(dbDriver, dbUrl, dbUser, dbPass);
  }

  public MemberDTO getMemberInfo(String userId, String userPw) {
    MemberDTO member = new MemberDTO();

    try {
//      사용자 조회 쿼리 생성
      String sql = "SELECT id, pass, name, regidate FROM member ";
      sql += "WHERE id = ? AND pass = ? ";

//      생성된 sql 쿼리문을 PreparedStatement 객체 생성 시 등록
      pstmt = conn.prepareStatement(sql);
//      쿼리문의 ? 기호 부분에 데이터 추가
      pstmt.setString(1, userId);
      pstmt.setString(2, userPw);

//      데이터베이스로 쿼리문 전달 및 결과 받아오기
      rs = pstmt.executeQuery();

//      데이터베이스에서 전달받은 결과 출력
      while (rs.next()) {
        member.setId(rs.getString("id"));
        member.setPass(rs.getString("pass"));
        member.setName(rs.getString("name"));
        member.setRegidate(rs.getString("regidate"));
      }
    }
    catch (SQLException e) {
      System.out.println("데이터 조회 중 오류가 발생했습니다.");
      System.out.println("SQLException: " + e.getMessage());
    }

    return member;
  }
}












