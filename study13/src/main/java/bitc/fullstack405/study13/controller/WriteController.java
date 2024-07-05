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

import java.io.File;
import java.io.IOException;

// multipart 데이터로 전달되기 때문에 @MultipartConfig 설정 필수
@MultipartConfig(maxFileSize = 1024 * 1024 * 1, maxRequestSize = 1024 * 1024 * 10)
@WebServlet("/mvcboard/write.do")
public class WriteController extends HttpServlet {

//    단순 view 페이지 출력
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    따로 추가 작업을 진행할 것이 없기 때문에 화면에 출력할 view 파일만 지정하고 이동
    req.getRequestDispatcher("/MVCBoard/Write.jsp").forward(req, resp);
  }

//  클라이언트에서 전달받은 데이터를 DB에 등록
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    클라이언트에서 전달받은 데이터를 가져오기
//    MVCBoardDTO 타입의 객체 생성 후 전달받은 데이터를 바로 입력
    MVCBoardDTO board = new MVCBoardDTO();
    board.setTitle(req.getParameter("title"));
    board.setContent(req.getParameter("content"));
    board.setName(req.getParameter("name"));
    board.setPass(req.getParameter("pass"));

//    web.xml에 설정한 파일 업로드 폴더 정보를 가져옴
    String saveDir = this.getServletContext().getInitParameter("FileUploadDirectory");
    String oriFileName = "";
    try {
//      전달받은 request객체에서 파일 정보를 가져온 후 파일 이름만 저장
      oriFileName = FileUtil.uploadFile(req, saveDir);
    }
    catch (Exception e) {
      JSFunction.alertLocation("파일 업로드 오류가 발생했습니다.", "/mvcboard/write.do", resp);
      return;
    }

//    가져온 파일명이 있는지 확인
    if (!oriFileName.equals("")) {
//      가져온 파일명이 있을 경우 해당 파일의 이름을 변경
      String saveFileName = FileUtil.renameFile(oriFileName, saveDir);
//      MVCBoardDTO 타입의 객체에 원본 파일명과 수정된 파일명을 저장
      board.setoFile(oriFileName);
      board.setsFile(saveFileName);
    }

//    mvcboard 테이블에 데이터를 추가하기 위해서 DAO 객체 생성
    MVCBoardDAO dao = new MVCBoardDAO();
//    DB 연결
    dao.dbOpen();
//    dao에서 제공하는 insertBoard()를 사용하여 DB에 저장
    int result = dao.insertBoard(board);
    
    if (dao.isDbOpen()) {
      dao.dbClose();
    }

//    insert 결과를 바탕으로 화면 이동
    if (result == 1) {
//      정상적으로 등록 시 목록 화면으로 이동
      resp.sendRedirect("/mvcboard/list.do");
    }
    else {
//      등록 실패 시 다시 등록 화면으로 이동
      JSFunction.alertBack("게시글 등록에 실패했습니다.", resp);
    }
  }
}












