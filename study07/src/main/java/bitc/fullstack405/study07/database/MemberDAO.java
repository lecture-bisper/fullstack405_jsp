package bitc.fullstack405.study07.database;

import jakarta.servlet.ServletContext;

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

//  회원 정보 조회 메소드

//  회원 정보 입력 메소드

//  회원 정보 수정 메소드

//  회원 정보 삭제 메소드
}












