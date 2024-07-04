<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 4.
  Time: 오전 10:36
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

<c:import url="../layout/Header.jsp"></c:import>

<main class="container mt-5">
  <section>
    <div class="row">
      <div class="col-sm">
        <table class="table table-hover table-striped text-center">
          <colgroup>
            <col style="width: 10%">
            <col style="width: 45%">
            <col style="width: 15%">
            <col style="width: 20%">
            <col style="width: 10%">
          </colgroup>
          <thead>
          <tr>
            <th>글번호</th>
            <th>글제목</th>
            <th>작성자</th>
            <th>등록일</th>
            <th>조회수</th>
          </tr>
          </thead>
          <tbody>
          <c:choose>
            <c:when test="${empty boardList}">
              <tr>
                <td colspan="5">등록된 게시물이 없습니다.</td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:forEach var="item" items="${boardList}" varStatus="loop">
                <tr>
                  <td>${item.idx}</td>
                  <td class="text-start">
                    <a href="/mvcboard/view.do?idx=${item.idx}" class="text-decoration-none">${item.title}</a>
                  </td>
                  <td>${item.name}</td>
                  <td>${item.postDate}</td>
                  <td>${item.visitCount}</td>
                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
          </tbody>
        </table>
      </div>
    </div>
    <div class="row">
      <div class="col-sm">
        <div class="d-flex justify-content-end">
          <a href="/mvcboard/write.do" class="btn btn-primary">글쓰기</a>
        </div>
      </div>
    </div>
  </section>
</main>

<c:import url="../layout/Footer.jsp"></c:import>

</body>
</html>











