<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/notice_list.css">
  <!-- css에서 /는 board 폴더를 나오는것이고 views는 원래 static에 들어있는것과 같다 -->
  <!-- 왜냐하면 어플리케이션.프로퍼티에서 spring.mvc.view.prefix=/WEB-INF/views/ 를 걸어주었기 때문 -->
</head>
<body>
<section>
    <h1>NOTICE</h1>
    <div class="wrapper">
      <form action="./list" name="search" method="post">
        <select name="category" id="category">
          <option value="all" ${map.category eq 'all'? 'selected':'' }>전체</option>
          <option value="title" ${map.category eq 'title'? 'selected':'' }>제목</option>
          <option value="content" ${map.category eq 'content'? 'selected':'' }>내용</option>
        </select>

        <div class="title">
          <input type="text" name="search" size="16" value="${map.search}">
        </div>
  
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>

    <table>
      <colgroup>
        <col width="12%">
        <col width="44%">
        <col width="17%">
        <col width="17%">
        <col width="10%">
      </colgroup>
      <!-- 제목부분 -->
      <tr>
        <th>No.</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
      <!-- 내용부분 -->
      <c:forEach var="dto" items="${map.list }">
      <tr>
        <td><span class="table-notice">${dto.bid }</span></td>
        
        <td class="table-title">
        <c:forEach begin="1" end="${dto.bindent }"><img src="/images/icon_reply.png"></c:forEach>
        <a href="content_view?category=${map.category }&search=${map.search }&page=${map.page }&bid=${dto.bid }">${dto.btitle }</a>
        <!-- 따라서 ./와 아예안붙인거랑 같고 board가 붙기떄문 -->
        <!-- /만붙이면 앞의 board가 날라감 -->
        <!-- ./은 현재페이지에서 content_view로 가라 -->
        <%-- content_viewCommand에서 또 넣어줘야함 --%>
        </td>
        <td>${dto.bname }</td>
        <td>${dto.bdate }</td>
        <td>${dto.bhit }</td>
      </tr>
      </c:forEach>
    </table>
	
	<%-- 페이지 --%>
    <ul class="page-num">
      <c:if test="${map.page==1}">
      	<li class="first"></li>
      </c:if>
      <c:if test="${map.page!=1}">
      	<a href="./list?category=${map.category }&search=${map.search }&page=1"><li class="first"></li></a>
      </c:if>
      
      <c:choose>
      	<c:when test="${map.page<=1 }">
      		<li class="prev"></li>
      	</c:when>
      	<c:otherwise>
      		<a href="./list?category=${map.category }&search=${map.search }&page=${map.page-1 }"><li class="prev"></li></a>
      	
      	</c:otherwise>
      </c:choose>
      
      
      <%-- 번호반복 --%>
      <c:forEach var="nowpage" begin="${map.startpage }" end="${map.endpage }">
      	<c:choose>
    		<c:when test="${map.page==nowpage }">
    			<li class="num"><div>${nowpage }</div></li>
    		</c:when>
    		<c:otherwise>
		      	<a href="./list?category=${map.category }&search=${map.search }&page=${nowpage }"><li class="num"><div>${nowpage }</div></li></a>
    		</c:otherwise>  	
      	</c:choose>
      </c:forEach>
      
      <c:choose>
      	<c:when test="${map.page>=map.maxpage }">
      		<li class="next"></li>
      	</c:when>
      	<c:otherwise>
		      <a href="./list?category=${map.category }&search=${map.search }&page=${map.page+1 }"><li class="next"></li></a>
      	</c:otherwise>
      </c:choose>
      
      <%-- page가 1인데 maxPage가 0인경우 --%>
      <c:if test="${map.page==map.maxpage}">
      	<li class="last"></li>
      </c:if>
      <c:if test="${map.page!=map.maxpage}">
      	<a href="./list?category=${map.category }&search=${map.search }&page=${map.maxpage}"><li class="last"></li></a>
      </c:if>
    </ul>

    <a href="./write_view"><div class="write">쓰기</div></a>
  </section>

</body>
</html>