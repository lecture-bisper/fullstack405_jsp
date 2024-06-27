package bitc.fullstack405.study07.database;

// 데이터베이스의 board 테이블과 연동되도록 필드를 선언
public class BoardDTO {
  private int num;
  private String title;
  private String content;
  private String id;
  private String postDate;
  private int visitCount;

  public int getNum() {
    return num;
  }

  public void setNum(int num) {
    this.num = num;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPostDate() {
    return postDate;
  }

  public void setPostDate(String postDate) {
    this.postDate = postDate;
  }

  public int getVisitCount() {
    return visitCount;
  }

  public void setVisitCount(int visitCount) {
    this.visitCount = visitCount;
  }
}












