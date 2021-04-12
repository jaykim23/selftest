<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글수정</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/write.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script type="text/javascript">
    	function replyCheck(){
    		
			//{rname:"홍길동",rcontent:"내용"}
			//ajax에서 위에 data는 보내는데이터 
			//아래 success:function(data)는 받는데이터
			//따라서 success전까지 보낼떄 돌고 받고나서 
			//success부터 도는형식
			
			var str = $('#bcontent').val();
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$('#bcontent').val(str);
			
				
/* 				var form =$('#writeForm')[0];
				var formData = new FormData(form); */
  			if($("#btitle").val()==null || $("#bcontent").val()==null){
				alert("타이틀과 컨텐츠 모두를 꼭 입력하셔야 합니다.");
				$("#btitle").focus();
				return false;
			}	  
			
			
				$.ajax({
					
					url:"./reply",
					type:"post",
					enctype:"multipart/form-data",
					data: new FormData($('#replyForm')[0]),
						//$("#writeForm").serialize()
						//"id":"aaa","pw":"1111"
					processData: false,
					contentType:false,
					cache: false,
					success:function(data){
						alert("게시판 등록이 완료되었습니다.");
						location.href="./list";
					},
					error:function(){
						alert("에러");
					}
					
				});
				

    		
    	}
  </script>
</head>
<body>
<section>
    <h1>답글</h1>
    <hr>

    <form action="reply" name="replyForm" id="replyForm" method="post" enctype="multipart/form-data">
      <table>
      <input type="hidden" name="bid" value="${map.boardDto.bid }">
      <input type="hidden" name="bgroup" value="${map.boardDto.bgroup }">
      <input type="hidden" name="bstep" value="${map.boardDto.bstep }">
      <input type="hidden" name="bindent" value="${map.boardDto.bindent }">
      <input type="hidden" name="category" value="${category }">
      <input type="hidden" name="search" value="${search }">
      <input type="hidden" name="page" value="${page }">
      
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="bname" value="${map.boardDto.bname }" readonly>
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="btitle" value="<답변>${map.boardDto.btitle }">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
  <script type="text/javascript">
			var str = $('${map.boardDto.bcontent }').val();
			str = str.replace(/('<br/>', ?:\r\n|\r|\n)/g);
			$('${map.boardDto.bcontent }').val(str);
</script>
<textarea name="bcontent" id="bcontent"cols="50" rows="10">
<c:out value="${map.boardDto.bcontent }"></c:out>

---------------------------------------------------------------
</textarea>
          </td>
        </tr>
        <tr>
          <th>이미지 표시</th>
          <td>
            <input type="file" name="file" id="file">
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="button" onclick="replyCheck()" class="write">답변완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='./list'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>