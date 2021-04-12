<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ex0402메인페이지 오후 7시</title>
	</head>
	<body>
		<ul>
		<c:choose>
			<c:when test="${session_flag==null || session_flag=='fail' }">
				<h3>로그인이 되어 있지 않습니다.</h3>
				<!-- ../은 한단계 폴더위에서 경로를 찾아라 -->
				<li><a href="member/login">로그인</a></li>
				<li><a href="join.do">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<h3>${session_nName}님 접속을 환영합니다.</h3>
				<h3>${session_id}님 접속을 환영합니다.</h3>
				<li><a href="../member/logout">로그아웃</a></li>
				<li><a href="../event/event">이벤트</a></li>
				<li><a href="view.do">회원정보보기</a></li>
				<li><a href="board/list">게시판리스트</a></li>
			</c:otherwise>
		</c:choose>
			
		<hr>
		</ul>
	</body>
</html>