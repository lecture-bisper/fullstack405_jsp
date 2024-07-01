<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 1.
  Time: 오전 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- JSTL - core를 사용하기 위해 추가 --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- jstl의 set을 사용하여 page영역에 변수 추가 --%>
<c:set var="number" value="1000"></c:set>
<c:set var="string" value="JSP"></c:set>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h3>JSTL의 if로 짝수/홀수 구분하기</h3>

  <div>
<%--    jstl의 if 문 사용, 조건식의 결과가 true 이면 시작 태그와 끝 태그 사이에 입력된 내용을 출력 --%>
<%--    조건식의 결과를 var 속성으로 지정한 변수명에 저장 --%>
    <c:if test="${number mod 2 eq 0}" var="result">
      <p>${number} 는 짝수입니다.</p>
    </c:if>
    <p>result : ${result}</p>
  </div>

  <br><hr><br>

  <h3>문자열 비교와 else 문 흉내내기</h3>
  <div>
<%--    jstl의 if 사용, 결과를 result2에 저장 --%>
    <c:if test="${string eq 'Java'}" var="result2">
      <p>문자열은 java 입니다.</p>
    </c:if>
<%--  바로 위의 if문의 결과를 받아와서 not 연산자로 결과를 변경한 후 사용--%>
<%--  2개의 if문을 사용하여 if ~ else문을 구현함 --%>
    <c:if test="${not result2}">
      <p>문자열은 java가 아닙니다.</p>
    </c:if>
  </div>

  <br><hr><br>

  <h3>조건식 주의사항</h3>

  <div>
<%--    조건식에 ${} 를 사용하지 않고 직접 값을 입력, 무조건 false로 출력 --%>
    <h4>if문 사용 시 EL언어가 아닌 정수 사용</h4>
    <c:if test="100" var="result3">
      <p>EL언어가 아닌 정수를 지정하면 무조건 false</p>
    </c:if>
    <p>result3 : ${result3}</p>
    <br>

    <h4>if 문 사용 시 EL언어로 직접 정수만 사용 시 </h4>
<%--  JSTL의 if 문 사용 시 정수를 EL언어로 표현 시 오류 발생 --%>
<%--  JSTL의 if문 사용 시 test 속성에 조건식을 사용하지 않고 정수만 입력 시 오류 발생 --%>
<%--    <c:if test="${100}" var="result3">--%>
<%--      <p>EL언어를 사용하면?</p>--%>
<%--    </c:if>--%>
<%--  <p>result3 : ${result3}</p>--%>
  <br>

    <h4>if문 사용 시 연산식 없이 변수만 사용</h4>
<%--  JSTL의 if 문 사용 시 연산식 없이 변수만 사용 시 무조건 false가 출력 --%>
    <c:if test="${string}" var="result3">
      <p>어떻게 되나??</p>
    </c:if>
    <p>result3 : ${result3}</p>

    <br>

    <h4>대소문자 구분없이 사용 시(EL언어 아님) </h4>
    <c:if test="tRue" var="result4">
      <p>대소문자 구분없이 "tRue" 인 경우 true</p>
    </c:if>
    <p>result4 : ${result4}</p>

    <br>

    <h4>if문 사용 시 EL언어를 사용하고 양쪽에 공백이 있을 경우</h4>
    <c:if test=" ${true} " var="result5">
      <p>EL 언어 양쪽에 빈 공백이 있을 경우 false</p>
    </c:if>
    <p>result5 : ${result5}</p>

    <br>

    <h4>if문 사용 시 EL언어를 사용하고 공백없이 true만 출력 시</h4>
    <c:if test="${true}" var="result6">
      <p>EL 언어 양쪽에 빈 공백이 없으면 true 가 true</p>
    </c:if>
    <p>result6 : ${result6}</p>
  </div>
</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>











