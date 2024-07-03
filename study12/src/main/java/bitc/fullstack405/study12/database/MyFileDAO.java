package bitc.fullstack405.study12.database;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// 데이터베이스 접속, myfile 테이블의 조작
public class MyFileDAO extends JDBConnect {

  public MyFileDAO() {
    super();
  }

  public MyFileDAO(ServletContext application) {
    super(application);
  }

  public MyFileDAO(String dbDriver, String dbUrl, String dbUser, String dbPass) {
    super(dbDriver, dbUrl, dbUser, dbPass);
  }

//  파일 업로드, 매개변수로 파일 정보가 들어있는 MyFileDTO 클래스 타입의 객체를 받음
  public int insertFile(MyFileDTO myFile) {
    int result = 0;

    try {
//      insert 용 쿼리문
      String sql = "INSERT INTO myfile (title, cate, ofile, sfile, postdate) ";
      sql += "VALUES (?, ?, ?, ?, now()) ";
      
      pstmt = conn.prepareStatement(sql);
//      ? 부분에 데이터 추가
      pstmt.setString(1, myFile.getTitle());
      pstmt.setString(2, myFile.getCate());
      pstmt.setString(3, myFile.getOfile());
      pstmt.setString(4, myFile.getSfile());

//      PreparedStatement 를 사용하여 DB에 sql 문 전달 및 결과 가져오기
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("파일 등록 중 오류가 발생했습니다.");
      System.out.println("SQLException : " + e.getMessage());
    }

    return result;
  }

//  파일 목록 출력
  public List<MyFileDTO> selectFileList() {
//    업로드 파일 목록을 저장할 변수
    List<MyFileDTO> fileList = new ArrayList<MyFileDTO>();

    try {
//      목록 조회를 위한 SQL 쿼리문
      String sql = "SELECT idx, title, cate, ofile, sfile, postdate FROM myfile ";
      sql += "ORDER BY idx DESC ";
      
      pstmt = conn.prepareStatement(sql);
//      쿼리문 전송 및 결과 받아오기
      rs = pstmt.executeQuery();

//      출력할 내용 여부 확인
      while (rs.next()) {
//        실제 저장할 MyFileDTO 클래스 타입의 객체 생성
        MyFileDTO item = new MyFileDTO();
//        ResultSet에 저장된 데이터를 column명 기준으로 가져와서 MyFileDTO 클래스 타입의 객체에 저장
        item.setIdx(rs.getInt("idx"));
        item.setTitle(rs.getString("title"));
        item.setCate(rs.getString("cate"));
        item.setOfile(rs.getString("ofile"));
        item.setSfile(rs.getString("sfile"));
        item.setPostDate(rs.getString("postdate"));

//        가져온 데이터를 List에 저장
        fileList.add(item);
      }
    }
    catch (SQLException e) {
      System.out.println("데이터 조회 중 오류가 발생했습니다.");
      System.out.println("SQLException : " + e.getMessage());
    }

    return fileList;
  }

//  데이터베이스에 파일 정보 리스트를 한번에 추가하기
  public int insertFileList(List<MyFileDTO> myFileList) {
    int result = 0;

    try {
//      기본 INSERT 쿼리문은 동일하게 사용
      String sql = "INSERT INTO myfile (title, cate, ofile, sfile, postdate) ";
      sql += "VALUES ";

//      values 뒤에 데이터가 들어가는 부분을 반복 입력하여 하나의 insert 문으로 생성
      for (int i = 0; i < myFileList.size(); i++) {
//        마지막 부분은 ',' 가 없으므로 파일정보 목록의 크기와 현재 반복수를 비교하여 마지막인지 확인하고 ','를 붙일지 말지를 결정
        if (myFileList.size() == i + 1) {
          sql += "(?, ?, ?, ?, now()) ";
        }
        else {
          sql += "(?, ?, ?, ?, now()), ";
        }
      }

      pstmt = conn.prepareStatement(sql);

//      ? 부분의 index 번호를 계속 변경해야하기 때문에 count 라는 변수를 하나 선언하고 setXXX()를 사용시마다 값을 증가시킴
      int count = 0;
      for (int i = 0; i < myFileList.size(); i++) {
        pstmt.setString(++count, myFileList.get(i).getTitle());
        pstmt.setString(++count, myFileList.get(i).getCate());
        pstmt.setString(++count, myFileList.get(i).getOfile());
        pstmt.setString(++count, myFileList.get(i).getSfile());
      }


//      PreparedStatement 를 사용하여 DB에 sql 문 전달 및 결과 가져오기
      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("파일 등록 중 오류가 발생했습니다.");
      System.out.println("SQLException : " + e.getMessage());
    }

    return result;
  }
}












