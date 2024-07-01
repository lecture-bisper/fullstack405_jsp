<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 1.
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
  <c:set var="number" value="100"></c:set>

  <h3>choose 태그로 홀짝 확인</h3>
  <div>
    <c:choose>
      <c:when test="${number mod 2 eq 0}">
        <p>${number} 는 짝수입니다.</p>
      </c:when>
      <c:otherwise>
        <p>${number} 는 홀수입니다.</p>
      </c:otherwise>
    </c:choose>
  </div>

  <br><hr><br>

  <h3>국, 영, 수 점수를 입력하면 평균을 내어 학점 출력</h3>
  <div class="row">
    <div class="col-sm-4 mx-auto">
      <form action="Choose.jsp" method="get">
        <div class="my-3">
          <label for="kor" class="form-label">국어 : </label>
          <input type="text" class="form-control" id="kor" name="kor">
        </div>
        <div class="my-3">
          <label for="eng" class="form-label">영어 : </label>
          <input type="text" class="form-control" id="eng" name="eng">
        </div>
        <div class="my-3">
          <label for="math" class="form-label">수학 : </label>
          <input type="text" class="form-control" id="math" name="math">
        </div>
        <div class="my-3 d-grid gap-2">
          <button type="submit" class="btn btn-primary">학점 구하기</button>
        </div>
      </form>

      <hr>

<%--      EL 언어를 사용하여 파라미터값이 있는지 확인 --%>
<%--      EL 언어에서 empty 연산자는 지정한 데이터가 비었으면 true, 데이터가 있으면 false --%>
      <c:if test="${not (empty param.kor or empty param.eng or empty param.math)}">
<%--        set을 사용하여 변수 저장 --%>
        <c:set var="avg" value="${(param.kor + param.eng + param.math) / 3}"></c:set>
        <p>
          평균 점수는 ${avg} 점으로
          <c:choose>
            <c:when test="${avg ge 90}">A학점</c:when>
            <c:when test="${avg ge 80}">B학점</c:when>
            <c:when test="${avg ge 70}">C학점</c:when>
            <c:when test="${avg ge 60}">D학점</c:when>
            <c:otherwise>F학점</c:otherwise>
          </c:choose>
          입니다.
        </p>
      </c:if>
    </div>
  </div>
</div>

</body>
</html>











