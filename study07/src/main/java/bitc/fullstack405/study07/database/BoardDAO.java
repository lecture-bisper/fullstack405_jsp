package bitc.fullstack405.study07.database;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// 데이터베이스의 board 테이블의 정보를 컨트롤하기 위한 클래스
public class BoardDAO extends JDBConnect {

  public BoardDAO() {
    super();
  }

  public BoardDAO(ServletContext app) {
    super(app);
  }

  public BoardDAO(String dbDriver, String dbUrl, String dbUser, String dbPass) {
    super(dbDriver, dbUrl, dbUser, dbPass);
  }

//  게시판 글 목록 조회 메소드
  public List<BoardDTO> selectBoardList() {
    List<BoardDTO> boardList = new ArrayList<BoardDTO>();

    try {
      String sql  = "SELECT num, title, id, postdate, visitcount FROM board ";

      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
        int num = rs.getInt("num");
        String title = rs.getString("title");
        String id = rs.getString("id");
        String postdate = rs.getString("postdate");
        int visitCount = rs.getInt("visitcount");

        BoardDTO board = new BoardDTO();
        board.setNum(num);
        board.setTitle(title);
        board.setId(id);
        board.setPostDate(postdate);
        board.setVisitCount(visitCount);

        boardList.add(board);
      }
    }
    catch (SQLException e) {

    }
    finally {
      try {

      }
      catch (Exception e) {}
    }

    return boardList;
  }

//  게시판 글 조회 메소드
  public BoardDTO selectBoardDetail(int num) {
    BoardDTO board = new BoardDTO();

    try {
      String sql = "SELECT num, title, content, id, postdate, visitcount ";
      sql += "FROM board ";
      sql += "WHERE num = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, num);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        board.setNum(rs.getInt("num"));
        board.setTitle(rs.getString("title"));
        board.setContent(rs.getString("content"));
        board.setId(rs.getString("id"));
        board.setPostDate(rs.getString("postdate"));
        board.setVisitCount(rs.getInt("visitcount"));
      }
    }
    catch (SQLException e) {
      System.out.println("데이터베이스 조회 중 오류가 발생했습니다.");
      e.printStackTrace();
    }
    finally {
      try {
        if (rs != null) { rs.close(); }
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
      }
      catch (Exception e) {}
    }

    return board;
  }

//  게시판 글 등록 메소드
  public int insertBoard(BoardDTO board) {
    int result = 0;

    try {
      String sql = "INSERT INTO board (title, content, id, postdate) ";
      sql += "VALUES (?, ?, ?, now()) ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, board.getTitle());
      pstmt.setString(2, board.getContent());
      pstmt.setString(3, board.getId());

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      System.out.println("데이터베이스에 데이터 추가 중 오류가 발생했습니다.");
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

//  게시판 글 수정 메소드

//  게시판 글 삭제 메소드
}












