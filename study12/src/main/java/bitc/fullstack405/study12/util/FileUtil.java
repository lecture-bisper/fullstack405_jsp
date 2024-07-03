package bitc.fullstack405.study12.util;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

//파일 업로드를 쉽게하기 위해서 만든 클래스
public class FileUtil {

//  클라이언트에서 전달받은 request 객체를 분석하여 파일 정보를 추출하는 메소드
//  매개변수로 request 객체와 파일을 저장할 경로 정보를 받아옴
  public static String uploadFile(HttpServletRequest req, String saveDir) throws ServletException, IOException {

//    request 객체에서 지정한 name을 가지고 있는 데이터를 가져옴
//    클라이언트에서 input type=file로 지정한 태그의 name 속성값과 동일해야 함
//    Multipart 타입의 데이터를 가져옴
    Part part = req.getPart("attachedFile");
//    가져온 파일 정보에서 header 값이 content-disposition 인 데이터를 가져옴
    String partHeader = part.getHeader("content-disposition");
    System.out.println("partHeader=" + partHeader);

//    가져온 header 정보를 'filename=' 을 기준으로 잘라서 배열에 저장
    String[] phArr = partHeader.split("filename=");
//    파일명에서 trim()을 사용하여 앞뒤의 공백 제거, ' " ' 문자 제거 후 저장
    String originalFileName = phArr[1].trim().replace("\"", "");

//    가져온 원본 파일명이 존재하면 지정한 위치에 저장
    if (!originalFileName.isEmpty()) {
//      서버의 지정된 위치에 파일을 저장함
      part.write(saveDir + File.separator + originalFileName);
    }

//    원본 파일명 반환
    return originalFileName;
  }

//  저장된 파일의 이름 변경, 매개변수로 저장할 위치 정보와 원본 파일명을 받아옴
  public static String renameFile(String saveDir, String fileName) {

//    확장자만 가져오기
    String ext = fileName.substring(fileName.lastIndexOf("."));
//    현재 시간을 사용자가 지정한 형식대로 문자열로 변환
    String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
//    현재 날짜 및 시간을 기준으로 새로운 파일명 생성
    String newFileName = now + ext;

//    원본 파일 정보로 File 클래스 타입의 객체 생성
    File oldFile = new File(saveDir + File.separator + fileName);
//    새이름으로 File 클래스 타입의 객체 생성
    File newFile = new File(saveDir + File.separator + newFileName);
//    renameTo() : 지정한 파일 정보로 현재 파일 정보를 변환, 원본 파일명을 새이름으로 변경
    oldFile.renameTo(newFile);

//    새 파일명 반환
    return newFileName;
  }

  public static List<String> multiUploadFileList(HttpServletRequest req, String saveDir) throws ServletException, IOException {
//    업로드된 원본 파일명 리스트를 저장할 List 타입 변수
    List<String> fileNameList = new ArrayList<String>();

//    업로드된 파일 정보를 한번에 가져옴
    Collection<Part> parts = req.getParts();

//    업로드된 파일 정보의 개수만큼 반복
    for (Part part : parts) {
//      클라이언트의 input type=file 의 name 속성명과 동일한지 확인
      if (!part.getName().equals("attachedFile")) {
//        같지 않으면 다음 루프로 넘어감
        continue;
      }

//      header 정보 읽어오기
      String partHeader = part.getHeader("content-disposition");
      System.out.println("partHeader=" + partHeader);

//      헤더 정보에서 'filename=' 을 기준으로 잘라서 배열에 저장
      String[] phArr = partHeader.split("filename=");
//      가져온 정보에서 공백과 " 를 제거
      String originalFileName = phArr[1].trim().replace("\"", "");

      if (!originalFileName.isEmpty()) {
//        원본 파일이름으로 서버에 저장
        part.write(saveDir + File.separator + originalFileName);
//        원본 파일명 리스트에 원본 파일명을 추가
        fileNameList.add(originalFileName);
      }
    }

//    업로드된 원본 파일명 리스트를 반환
    return fileNameList;
  }

//  원본 파일명을 수정하고 수정된 파일명 리스트를 반환 
  public static List<String> renameFileList(String saveDir, List<String> oriFileNameList) {
//    수정된 파일명 리스트를 저장할 변수
    List<String> newFileNameList = new ArrayList<>();

//    원본 파일명 리스트의 크기만큼 반복
    for (int i = 0; i < oriFileNameList.size(); i++) {
//      List이므로 get(index)을 사용하여 원하는 위치의 원본 파일명을 가져옴
//      확장자 가져오기
      String ext = oriFileNameList.get(i).substring(oriFileNameList.get(i).lastIndexOf("."));
//      날짜 및 시간으로 새 파일명 만들기
//      혹시 같은 이름으로 생성될 수 있어서 뒤에 번호를 추가함
      String now = new SimpleDateFormat("yyyyMMdd_HmsS_" + (i + 1)).format(new Date());
      String newFileName = now + ext;

      File oldFile = new File(saveDir + File.separator + oriFileNameList.get(i));
      File newFile = new File(saveDir + File.separator + newFileName);
      oldFile.renameTo(newFile);

      newFileNameList.add(newFileName);
    }

    return newFileNameList;
  }
}












