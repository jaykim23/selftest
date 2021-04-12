<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<c:choose>
			<c:when test="${flag == -1 }">
				<script>
					alert("오류로 인한 저장이 되지 않았습니다. 다시 입력하세요!");
				</script>
				<c:redirect url="/write_view.do"/>
			</c:when>
			<c:otherwise>
			<%-- alert아래에 리다이렉트를 써놨지만 alert이 안돌고 redirect가 먼저도는거같음 
				 그리고 리다이렉트로 보낼시 디스패처랑 다르게 주소가 바뀜
			--%>
				<script>
					alert("데이터가 정상적으로 저장되었습니다.");
				</script>
				<c:redirect url="/list.do?page=${page }">
					<%-- <c:param name="page" value="${page}"></c:param> --%>
				</c:redirect>
			</c:otherwise>
		</c:choose>
		<meta charset="UTF-8">
		<title>글쓰기 체크</title>
	</head>
	<body>
	
	</body>
</html>