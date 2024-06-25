package bitc.fullstack405.study06.database;

// DTO : 데이터베이스와 자바간의 데이터 타입이 서로 다르므로 서로 데이터 타입을 맞추기 위해 사용
// 데이터베이스의 테이블 컬럼명과 Java DTO 클래스의 필드명을 동일하게 사용하는 것을 추천
// 데이터베이스는 스네이크 명명법을 주로 사용하고 Java는 카멜 명명법을 주로 사용하기 때문에 서로 맞는 명명법을 사용하는 것이 좋음
// 자바에서 데이터베이스를 사용하기 위한 새로운 데이터 타입이라고 생각하면 됨
public class MemberDTO {
//  DB의 int 타입은 java의 int 타입으로 사용
//  DB의 varchar 타입은 java의 String 타입으로 사용
//  DB의 datetime 타입은 java의 String 타입으로 사용
  private String id;
  private String pass;
  private String name;
  private String regiDate;

//  각 필드별 Getter/Setter 생성
  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPass() {
    return pass;
  }

  public void setPass(String pass) {
    this.pass = pass;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getRegiDate() {
    return regiDate;
  }

  public void setRegiDate(String regiDate) {
    this.regiDate = regiDate;
  }
}












