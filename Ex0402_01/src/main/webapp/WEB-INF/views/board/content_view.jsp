<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>뷰페이지</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/read.css">
  <style>
  	.cursor{cursor: pointer;}
  </style>
  <script>
  	function delete_check(){
  		alert("삭제버튼을 클릭했습니다.");
		 if(confirm("삭제하시겠습니까?")){
  			location.href="./delete?category=${map.category }&search=${map.search }&page=${map.page}&bid=${map.boardDto.bid}";
  		}else{
  			return false;
  		} 
  		
  	}
  	
  	var str = $('.#content_result').val();
  	str = str.split('<br/>').join("\r\n");
  	$('#content_result').val(str);
  </script>
</head>
<body>
<section>
    <h1>NOTICE</h1>

    <table>
      <colgroup>
        <col width="80%">
        <col width="10%">
        <col width="10%">
        
      </colgroup>
      <tr>
        <th colspan="3">제목  |  <span><strong>${map.boardDto.btitle }</strong></span></th>
      </tr>
      <tr>
        <td>${map.boardDto.bname }</td>
        <td>조회수</td>
        <td>${map.boardDto.bhit }</td>
      </tr>
      <tr>
        <td colspan="3" class="article" id="content_result">${map.boardDto.bcontent }</td>
      </tr>
      <tr>
      	<td>파일첨부</td>
        <td colspan="2"><a href="/upload/${map.boardDto.fileName}" download>${map.boardDto.fileName }</a></td>
      </tr>
      <tr>
        <td colspan="3" class="article">
        	<img alt="" src="/upload/${map.boardDto.fileName}">
        </td>
      </tr>
      <tr>
        <td colspan="3"><strong>다음글</strong> <span class="separator">|</span>
        	<a href="content_view?category=${map.category }&search=${map.search }&page=${map.page }&bid=${map.nextDto.bid }">${map.nextDto.btitle }</a>
        </td>
      </tr>
      <tr>
        <td colspan="3"><strong>이전글</strong> <span class="separator">|</span>
         <a href="content_view?category=${map.category }&search=${map.search }&page=${map.page }&bid=${map.preDto.bid }">${map.preDto.btitle }</a>
        </td>
      </tr>
    </table>

    <a href="list?category=${map.category }&search=${map.search }&page=${map.page }"><div class="list">목록</div></a>
    <div onclick="delete_check()" class="list cursor">삭제</div>
    <a href="modify_view?category=${map.category }&search=${map.search }&page=${map.page }&bid=${map.boardDto.bid}"><div class="list">수정</div></a>
    <a href="reply_view?category=${map.category }&search=${map.search }&page=${map.page }&bid=${map.boardDto.bid}"><div class="list">답변달기</div></a>
  </section>
</body>
</html>