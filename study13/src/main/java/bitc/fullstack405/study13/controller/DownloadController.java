package bitc.fullstack405.study13.controller;

import bitc.fullstack405.study13.database.MVCBoardDAO;
import bitc.fullstack405.study13.utils.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet {

//  View.jsp에서 a 태그를 사용하여 접속하기 때문에 doGet()을 호출
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");

//    클라이언트에서 전달한 데이터 가져오기
    int idx = Integer.parseInt(req.getParameter("idx")); // 게시물 번호
    String oriFileName = req.getParameter("ofile"); // 원본 파일명
    String saveFileName = req.getParameter("sfile"); // 저장된 파일명

//    web.xml에서 파일이 저장된 폴더 위치 가져오기
    String saveDir = this.getServletContext().getInitParameter("FileUploadDirectory");

//    파일 다운로드
    FileUtil.downloadFile(oriFileName, saveFileName, saveDir, req, resp);

//    파일 다운로드 수 업데이트를 위해서 DAO 객체 생성
    MVCBoardDAO dao = new MVCBoardDAO(this.getServletContext());
    dao.dbOpen();
//    dao에서 제공하는 updateDownloadCount() 를 사용하여 파일 다운로드 수 업데이트
    dao.updateDownloadCount(idx);

    if(dao.isDbOpen()) {
      dao.dbClose();
    }
  }
}












