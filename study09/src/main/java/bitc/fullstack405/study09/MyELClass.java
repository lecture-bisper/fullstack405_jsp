package bitc.fullstack405.study09;

public class MyELClass {
//  일반 메소드
  public String getGender(String jumin) {
    String returnStr = "";

//    indexOf(문자) : 문자열 안에서 지정한 문자를 검색하여 위치를 알려줌
    int beginIdx = jumin.indexOf("-") + 1;
//    지정한 위치의 글자 하나만 복사해 옴
    String genderStr = jumin.substring(beginIdx, beginIdx + 1);
//    정수로 변환
    int genderInt = Integer.parseInt(genderStr);
    
//    값이 1, 3 이면 남성, 2, 4 면 여성
    if (genderInt == 1 || genderInt == 3) {
      returnStr = "남성";
    }
    else if (genderInt == 2 || genderInt == 4) {
      returnStr = "여성";
    }
    else {
      returnStr = "주민번호 오류입니다.";
    }

    return returnStr;
  }

//  정적 메소드
  public static boolean isNumber(String value) {
//    toCharArray() : 지정한 문자열을 char 타입의 배열로 변환
    char[] chArr = value.toCharArray();

//    char 타입의 배열을 모두 꺼내서 0 ~ 9까지의 문자인지 확인
    for (int i = 0; i < chArr.length; i++) {
      if (!(chArr[i] >= '0' && chArr[i] <= '9')) {
        return false;
      }
    }
    return true;
  }

//  정적 메소드
  public static String showGugudan(int limitDan) {
//    StringBuffer : 문자열을 생성하는 클래스
//    일반적으로 사용하는 문자열 데이터 타입인 String 은 문자열 연결 연산자인 + 로 문자열을 연결 했을 경우 실제로 2개의 문자열이 하나의 문자열로 합해지는 것이 아니라 메모리 공간에서 기존의 문자열을 모두 삭제하고 새로운 길다란 문자열로 생성하여 출력
    StringBuffer sb = new StringBuffer();

    try {
      sb.append("<table class='table table-striped table-hover'>");
      sb.append("<tbody>");
      for (int i = 2; i <= limitDan; i++) {
        sb.append("<tr>");
        for (int j = 1; j <= 9; j++) {
          sb.append("<td>" + i + " * " + j + " = " + (i * j) + "</td>");
        }
        sb.append("</tr>");
      }
      sb.append("</tbody>");
      sb.append("</table>");
    }
    catch (Exception e) {
      e.printStackTrace();
    }

    return sb.toString();
  }
}












