package bitc.fullstack405.study13.database;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MVCBoardDAO extends JDBConnect {
  public MVCBoardDAO() {}

  public MVCBoardDAO(ServletContext app) {
    super(app);
  }

  public MVCBoardDAO(String dbDriver, String dbUrl, String dbUser, String dbPass) {
    super(dbDriver, dbUrl, dbUser, dbPass);
  }

//  전체 게시물 목록 가져오기
  public List<MVCBoardDTO> selectBoardList() {
    List<MVCBoardDTO> boardList = new ArrayList<MVCBoardDTO>();

    try {
      String sql = "SELECT idx, name, title, postdate, visitcount FROM mvcboard ";
      sql += "ORDER BY idx DESC ";

      pstmt = conn.prepareStatement(sql);

      rs = pstmt.executeQuery();

      while (rs.next()) {
        MVCBoardDTO board = new MVCBoardDTO();

        board.setIdx(rs.getInt("idx"));
        board.setName(rs.getString("name"));
        board.setTitle(rs.getString("title"));
        board.setPostDate(rs.getString("postdate"));
        board.setVisitCount(rs.getInt("visitcount"));

        boardList.add(board);
      }
    }
    catch (SQLException e) {
      printErrorMessage("조회", e.getMessage());
    }

    return boardList;
  }


//  게시물 상세 보기
  public MVCBoardDTO selectBoardDetail(int idx) {
    MVCBoardDTO board = new MVCBoardDTO();

    try {
      String sql = "SELECT idx, name, title, content, postdate, modifydate, ofile, sfile, ";
      sql += "downcount, pass, visitcount FROM mvcboard ";
      sql += "WHERE idx = ? ";

      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);

      rs = pstmt.executeQuery();

      while (rs.next()) {
        board.setIdx(rs.getInt("idx"));
        board.setName(rs.getString("name"));
        board.setTitle(rs.getString("title"));
        board.setContent(rs.getString("content"));
        board.setPostDate(rs.getString("postdate"));
        board.setModifyDate(rs.getString("modifydate"));
        board.setoFile(rs.getString("ofile"));
        board.setsFile(rs.getString("sfile"));
        board.setDownCount(rs.getInt("downcount"));
        board.setPass(rs.getString("pass"));
        board.setVisitCount(rs.getInt("visitcount"));
      }
    }
    catch (SQLException e) {
      printErrorMessage("조회", e.getMessage());
    }

    return board;
  }


//  게시물 등록하기
  public int insertBoard(MVCBoardDTO board) {
    int result = 0;

    try {
      String sql = "INSERT INTO mvcboard (name, title, content, postdate, ofile, sfile, pass) ";
      sql += "VALUES (?, ?, ?, now(), ?, ?, ?) ";

      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, board.getName());
      pstmt.setString(2, board.getTitle());
      pstmt.setString(3, board.getContent());
      pstmt.setString(4, board.getoFile());
      pstmt.setString(5, board.getsFile());
      pstmt.setString(6, board.getPass());

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      printErrorMessage("등록", e.getMessage());
    }

    return result;
  }


//  게시물 수정하기
  public int updateBoard(MVCBoardDTO board) {
    int result = 0;

    try {
      String sql = "UPDATE mvcboard ";
      sql += "SET title = ?, content = ?, modifydate = now(), ofile = ?, sfile = ? ";
      sql += "WHERE idx = ? ";

      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, board.getTitle());
      pstmt.setString(2, board.getContent());
      pstmt.setString(3, board.getoFile());
      pstmt.setString(4, board.getsFile());
      pstmt.setInt(5, board.getIdx());

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      printErrorMessage("수정", e.getMessage());
    }

    return result;
  }


//  게시물 삭제하기
  public int deleteBoard(int idx) {
    int result = 0;

    try {
      String sql = "DELETE FROM mvcboard WHERE idx = ? ";

      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, idx);

      result = pstmt.executeUpdate();
    }
    catch (SQLException e) {
      printErrorMessage("삭제", e.getMessage());
    }

    return result;
  }


//  조회수 증가하기
  public void updateVisitCount(int idx) {
    try {
      String sql = "UPDATE mvcboard SET visitcount = visitcount + 1 WHERE idx = ? ";

      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, idx);

      pstmt.executeUpdate();
    }
    catch (SQLException e) {
      printErrorMessage("수정", e.getMessage());
    }
  }


//  다운로드 수 증가
  public void updateDownloadCount(int idx) {
    try {
      String sql = "UPDATE mvcboard SET downcount = downcount + 1 WHERE idx = ? ";

      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, idx);

      pstmt.executeUpdate();
    }
    catch (SQLException e) {
      printErrorMessage("수정", e.getMessage());
    }
  }


//  비밀번호 확인
  public boolean confirmPassword(int idx, String password) {
    boolean result = false;

    try {
      String sql = "SELECT count(*) AS cnt FROM mvcboard ";
      sql += "WHERE idx = ? AND pass = ? ";

      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, idx);
      pstmt.setString(2, password);

      rs = pstmt.executeQuery();

      while (rs.next()) {
        if (rs.getInt("cnt") == 1) {
          result = true;
        }
      }
    }
    catch (SQLException e) {
      printErrorMessage("조회", e.getMessage());
    }

    return result;
  }


  private void printErrorMessage(String userMsg, String errMsg) {
    System.out.println("\n******************************************");
    System.out.println("DB " + userMsg + " 중 오류가 발생했습니다.");
    System.out.println("오류 내용 : " + errMsg);
    System.out.println("******************************************\n");
  }
}












