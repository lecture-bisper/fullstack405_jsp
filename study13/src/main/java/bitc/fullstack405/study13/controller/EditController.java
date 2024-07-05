package bitc.fullstack405.study13.controller;

import bitc.fullstack405.study13.database.MVCBoardDAO;
import bitc.fullstack405.study13.database.MVCBoardDTO;
import bitc.fullstack405.study13.utils.FileUtil;
import bitc.fullstack405.study13.utils.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@MultipartConfig(maxFileSize = 1024 * 1024 * 1, maxRequestSize = 1024 * 1024 * 10)
@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet {

  // PassController에서 redirect를 통해서 접속했으므로 doGet() 을 호출
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    클라이언트에서 전달한 데이터 가져오기
    int idx = Integer.parseInt(req.getParameter("idx"));

//    수정 화면이기 때문에 기존 게시물의 내용이 모두 있어야 함
//    게시물 정보를 가져오기 위해서 DAO 객체를 생성
    MVCBoardDAO dao = new MVCBoardDAO(this.getServletContext());
    dao.dbOpen();
//    현재 게시물 번호를 기반으로 게시물 정보를 가져옴
    MVCBoardDTO board = dao.selectBoardDetail(idx);

    if (dao.isDbOpen()) {
      dao.dbClose();
    }

//    가져온 게시물 정보를 request 영역에 저장
    req.setAttribute("board", board);
//    veiw 페이지 설정 후 forward()를 사용하여 화면 이동
    req.getRequestDispatcher("/MVCBoard/Edit.jsp").forward(req, resp);
  }

//  Edit.jsp 에서 form 태그를 통해서 호출됨
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    클라이언트에서 전달된 데이터를 가져옴
    String title = req.getParameter("title"); // 수정된 title
    String content = req.getParameter("content"); // 수정된 content
    int idx = Integer.parseInt(req.getParameter("idx")); // 게시글 번호
//    기존에 첨부된 파일에 대한 정보
    String oldSaveFile = req.getParameter("oldSaveFile");
    String oldOriFile = req.getParameter("oldOriFile");

//    데이터 수정을 위한 MVCBoardDTO 클래스 타입의 객체 생성
    MVCBoardDTO board = new MVCBoardDTO();
//    전달받은 데이터로 MVCBoardDTO 클래스 타입의 객체에 데이터 저장
    board.setTitle(title);
    board.setContent(content);
    board.setIdx(idx);
    
    String saveDir = this.getServletContext().getInitParameter("FileUploadDirectory");
    String oriFileName = "";

    try {
//      새로 업로드된 파일 저장 및 원본 파일명 가져오기
      oriFileName = FileUtil.uploadFile(req, saveDir);
    }
    catch (Exception e) {
      JSFunction.alertBack("파일 업로드 중 오류가 발생했습니다.", resp);
      return;
    }

//    새로 업로드된 파일이 있는지 여부 확인
    if (!oriFileName.equals("")) {
//      새로 업로드된 파일이 있으면 파일명 변경 및 새파일명 가져오기
      String saveFileName = FileUtil.renameFile(oriFileName, saveDir);

//      원본 파일명과 새파일명을 MVCBoardDTO 클래스 타입의 객체에 저장
      board.setoFile(oriFileName);
      board.setsFile(saveFileName);

//      기존 파일을 디스크에서 삭제
      FileUtil.deleteFile(oldSaveFile, saveDir);
    }
    else {
//      새로 업로드된 파일이 없을 경우 기존 첨부파일 데이터를 MVCBoardDTO 클래스 타입의 객체에 저장
      board.setoFile(oldOriFile);
      board.setsFile(oldSaveFile);
    }

//    DB에 데이터를 업데이트하기 위해서 DAO 객체 생성
    MVCBoardDAO dao = new MVCBoardDAO(this.getServletContext());
    dao.dbOpen();

//    dao에서 제공하는 updateBoard() 를 사용하여 DB 내용 수정
    int result = dao.updateBoard(board);

    if (dao.isDbOpen()) {
      dao.dbClose();
    }

    if (result == 1) {
      resp.sendRedirect("/mvcboard/view.do?idx=" + idx);
    }
    else {
      JSFunction.alertLocation("게시글 수정이 실패했습니다.\n다시 진행해주세요", "/mvcboard/view.do?idx=" + idx, resp);
    }
  }
}












