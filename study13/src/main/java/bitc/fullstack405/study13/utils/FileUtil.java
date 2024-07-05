package bitc.fullstack405.study13.utils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileUtil {

  public static String uploadFile(HttpServletRequest req, String saveDir) throws ServletException, IOException {
//    클라이언트에서 전달한 데이터 중 input 태그의 type이 file인 것 중 지정한(name속성값) 태그의 정보를 가져옴
    Part part = req.getPart("uploadFile");
//    파일 이름 정보가 있는 header 정보를 가져옴
    String partHeader = part.getHeader("content-disposition");
//    가져온 header 정보에서 파일 이름만 분리함
    String[] phArr = partHeader.split("filename=");
    String oriFileName = phArr[1].trim().replace("\"", "");

//    파일 이름이 있는지 확인
    if (!oriFileName.isEmpty()) {
//      파일 이름이 있을 경우 해당 파일을 서버의 지정한 위치에 저장
      part.write(saveDir + File.separator + oriFileName);
    }

//    파일 이름을 반환
    return oriFileName;
  }

  public static String renameFile(String oriFileName, String saveDir) {
//    원본 파일명에서 확장자만 가져옴
    String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
//    현재 날짜 및 시간을 바탕으로 새이름을 생성
    String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
//    새 이름과 확장자를 합하여 진짜 새 파일명을 생성함
    String newFileName = now + ext;

//    원본 파일명으로 File 클래스 타입의 객체 생성
    File oldFile = new File(saveDir + File.separator + oriFileName);
//    새이름으로 File 클래스 타입의 객체 생성
    File newFile = new File(saveDir + File.separator + newFileName);
//    저장된 원본 파일을 새이름으로 변경
    oldFile.renameTo(newFile);

//    변경된 새이름 반환
    return newFileName;
  }

  public static void deleteFile(String fileName, String saveDir) {
//    매개변수로 받아온 디스크에 저장된 이름으로 File 클래스 타입의 객체 생성
    File file = new File(saveDir + File.separator + fileName);

//    해당 파일이 있는지 확인
    if (file.exists()) {
//      파일이 있으면 삭제
      file.delete();
    }
  }
  
  public static void downloadFile(String oFile, String sFile, String saveDir, HttpServletRequest req, HttpServletResponse resp) {
    try {
//      파일이 저장된 위치와 파일명을 가지고 File 클래스 타입의 객체 생성
      File file = new File(saveDir, sFile);
//      File 클래스 타입의 객체로 InputStream 객체 생성
      InputStream inputStream = new FileInputStream(file);

//      현재 사용하는 웹 브라우저를 확인
      String client = req.getHeader("User-Agent");

//      IE일 경우 문자셋 설정 변경
      if (client.indexOf("WOW64") == -1) {
        oFile = new String(oFile.getBytes("UTF-8"), "ISO-8859-1");
      }
      else {
        oFile = new String(oFile.getBytes("KSC5601"), "ISO-8859-1");
      }

      resp.reset();
//      response 객체의 컨텐츠 타입 변경
      resp.setContentType("application/octet-stream");
//      전송할 파일 이름 설정
      resp.setHeader("Content-Disposition", "attachment; filename=\"" + oFile + "\"");
//      전송할 파일 크기 설정
      resp.setHeader("Content-Length", "" + file.length());

//      response 객체를 통해서 OutputStream 객체 생성
      OutputStream outputStream = resp.getOutputStream();

//      데이터 전달을 byte 타입으로 하기 때문에 파일의 크기 만큼 byte 타입의 배열을 생성
      byte[] b = new byte[(int)file.length()];
      int readBuff = 0;

//      InputStream 에서 byte 타입의 배열 크기만큼 데이터를 읽어옴
      while ((readBuff = inputStream.read(b)) != -1) {
//        읽어온 데이터를 OutputStream 을 통해서 전송
        outputStream.write(b, 0, readBuff);
      }

//      InputStream 과 OutputStream 은 외부 리소스이기 때문에 직접 닫아줌
      inputStream.close();
      outputStream.close();
    }
    catch (FileNotFoundException e) {
      System.out.println("파일을 찾을 수 없습니다.");
      e.printStackTrace();
    }
    catch (Exception e) {
      System.out.println("오류가 발생했습니다.");
      e.printStackTrace();
    }
  }
}












