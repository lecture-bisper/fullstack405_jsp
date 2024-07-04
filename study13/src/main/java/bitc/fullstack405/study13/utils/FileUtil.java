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
    Part part = req.getPart("uploadFile");
    String partHeader = part.getHeader("content-disposition");
    String[] phArr = partHeader.split("filename=");
    String oriFileName = phArr[1].trim().replace("\"", "");

    if (!oriFileName.isEmpty()) {
      part.write(saveDir + File.separator + oriFileName);
    }

    return oriFileName;
  }

  public static String renameFile(String oriFileName, String saveDir) {
    String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
    String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
    String newFileName = now + ext;

    File oldFile = new File(saveDir + File.separator + oriFileName);
    File newFile = new File(saveDir + File.separator + newFileName);
    oldFile.renameTo(newFile);

    return newFileName;
  }

  public static void deleteFile(String fileName, String saveDir) {
    File file = new File(saveDir + File.separator + fileName);

    if (file.exists()) {
      file.delete();
    }
  }

  public static void downloadFile(String oFile, String sFile, String saveDir, HttpServletRequest req, HttpServletResponse resp) {
    try {
      File file = new File(saveDir, sFile);
      InputStream inputStream = new FileInputStream(file);

      String client = req.getHeader("User-Agent");

      if (client.indexOf("WOW64") == -1) {
        oFile = new String(oFile.getBytes("UTF-8"), "ISO-8859-1");
      }
      else {
        oFile = new String(oFile.getBytes("KSC5601"), "ISO-8859-1");
      }

      resp.reset();
      resp.setContentType("application/octet-stream");
      resp.setHeader("Content-Disposition", "attachment; filename=\"" + oFile + "\"");
      resp.setHeader("Content-Length", "" + file.length());

      OutputStream outputStream = resp.getOutputStream();

      byte[] b = new byte[(int)file.length()];
      int readBuff = 0;

      while ((readBuff = inputStream.read(b)) != -1) {
        outputStream.write(b, 0, readBuff);
      }

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












