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

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");

    int idx = Integer.parseInt(req.getParameter("idx"));
    String oriFileName = req.getParameter("ofile");
    String saveFileName = req.getParameter("sfile");

    String saveDir = this.getServletContext().getInitParameter("FileUploadDirectory");

    FileUtil.downloadFile(oriFileName, saveFileName, saveDir, req, resp);

    MVCBoardDAO dao = new MVCBoardDAO(this.getServletContext());
    dao.dbOpen();
    dao.updateDownloadCount(idx);

    if(dao.isDbOpen()) {
      dao.dbClose();
    }
  }
}












