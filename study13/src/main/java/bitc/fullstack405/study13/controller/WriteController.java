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

@MultipartConfig(maxFileSize = 1024 * 1024 * 1, maxRequestSize = 1024 * 1024 * 10)
@WebServlet("/mvcboard/write.do")
public class WriteController extends HttpServlet {

//    단순 view 페이지 출력
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.getRequestDispatcher("/MVCBoard/Write.jsp").forward(req, resp);
  }

//  클라이언트에서 전달받은 데이터를 DB에 등록
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    MVCBoardDTO board = new MVCBoardDTO();
    board.setTitle(req.getParameter("title"));
    board.setContent(req.getParameter("content"));
    board.setName(req.getParameter("name"));
    board.setPass(req.getParameter("pass"));

    String saveDir = this.getServletContext().getInitParameter("FileUploadDirectory");
    String oriFileName = "";
    try {
      oriFileName = FileUtil.uploadFile(req, saveDir);
    }
    catch (Exception e) {
      JSFunction.alertLocation("파일 업로드 오류가 발생했습니다.", "/mvcboard/write.do", resp);
      return;
    }

    if (!oriFileName.equals("")) {
      String saveFileName = FileUtil.renameFile(oriFileName, saveDir);
      board.setoFile(oriFileName);
      board.setsFile(saveFileName);
    }

    MVCBoardDAO dao = new MVCBoardDAO();
    dao.dbOpen();
    int result = dao.insertBoard(board);

    if (dao.isDbOpen()) {
      dao.dbClose();
    }

    if (result == 1) {
      resp.sendRedirect("/mvcboard/list.do");
    }
    else {
      JSFunction.alertBack("게시글 등록에 실패했습니다.", resp);
    }
  }
}












