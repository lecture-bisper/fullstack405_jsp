package bitc.fullstack405.study12.servlet;

import bitc.fullstack405.study12.database.MyFileDAO;
import bitc.fullstack405.study12.database.MyFileDTO;
import bitc.fullstack405.study12.util.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

//@MultipartConfig : 클라이언트에서 form 태그를 통해서 enctype을 multipart/form-data으로 설정 후 데이터를 전송 시 전달받을 데이터의 크기를 설정하는 어노테이션
// 서버로 전달되는 데이터 타입은 byte 타입임
// 컴퓨터는 2진수로 숫자를 표현하므로 정수 1000을 2의 10승으로 표시하여 1024로 표현함
// 1024 * 1024 * 1 => 1000 * 1000 * 1 => 1,000,000 * 1 => 1MB 가 됨
//maxRequestSize : 클라이언트가 서버로 데이터 전달 시 최대 크기를 설정
//maxFileSize : 클라이언트가 서버로 파일 전달 시 파일 1개당 최대 크기를 설정
@MultipartConfig(maxFileSize = 1024 * 1024 * 1, maxRequestSize = 1024 * 1024 * 10)
//tomcat에 서블릿으로 등록, 클라이언트가 접속할 URL 설정
@WebServlet("/UploadProcess.do")
public class UploadProcess extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
//      파일이 저장될 위치 직접 지정
      String saveDir = "C:/upload/";
//      원본 파일명 가져오기, request 객체를 분석하여 업로드된 파일 여부 확인 및 서버에 저장
      String originalFileName = FileUtil.uploadFile(req, saveDir);
//      수정된 파일명 가져오기
      String saveFileName = FileUtil.renameFile(saveDir, originalFileName);

//      파일 정보를 데이터베이스에 등록하기
      insertMyFile(req, originalFileName, saveFileName);

//      페이지 이동
      resp.sendRedirect("/chap13/FileList.jsp");
    }
    catch (Exception e) {
      e.printStackTrace();
//      오류 발생 시 request 영역에 에러 메세지 추가
      req.setAttribute("errorMessage", "파일 업로드 오류");
//      forward를 통해서 페이지 이동
      req.getRequestDispatcher("/chap13/FileUploadMain.jsp").forward(req, resp);
    }
  }

//  클라이언트에서 전달한 정보 및 데이터베이스 등록을 위한 메소드
//  매개변수로 request 객체, 원본 파일명, 저장된 파일명을 받아옴
  private void insertMyFile(HttpServletRequest req, String originalFileName, String saveFileName) {
//    클라이언트에서 input 태그를 통해서 전달한 데이터 가져오기
    String title = req.getParameter("title");
//    checkbox 로 데이터를 전달하여 데이터가 배열로 전달되기 때문에 getParameterValues()를 사용하여 배열로 가져옴
    String[] cateArr = req.getParameterValues("cate");
    StringBuffer cateBuff = new StringBuffer();

//    checkbox 로 전달된 데이터가 없을 경우
    if (cateArr == null) {
      cateBuff.append("선택한 항목 없음");
    }
    else {
//      checkbox 로 전달된 데이터가 있으면 반복문으로 모두 가져옴
      for (String item : cateArr) {
        cateBuff.append(item + ", ");
      }
    }

    System.out.println("파일 외 폼값 : " + title + "\n" + cateBuff);

//    클라이언트에서 전달받은 데이터를 데이터베이스에 저장하기 위해 MyFileDTO 클래스 타입의 객체 생성
    MyFileDTO myFile = new MyFileDTO();
//    각각의 데이터 저장
    myFile.setTitle(title);
    myFile.setCate(cateBuff.toString());
    myFile.setOfile(originalFileName);
    myFile.setSfile(saveFileName);

//    데이터베이스의 myfile 테이블을 제어하기 위한 MyFileDAO 클래스 타입의 객체 생성
    MyFileDAO dao = new MyFileDAO();
//    DB연결
    dao.dbOpen();
//    DB에 데이터 추가
    dao.insertFile(myFile);
    dao.dbClose();
  }
}












