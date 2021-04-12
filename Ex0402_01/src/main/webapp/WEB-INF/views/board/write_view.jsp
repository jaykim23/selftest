<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글쓰기</title>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script type="text/javascript">
    	function writeCheck(){
    		
			//{rname:"홍길동",rcontent:"내용"}
			//ajax에서 위에 data는 보내는데이터 
			//아래 success:function(data)는 받는데이터
			//따라서 success전까지 보낼떄 돌고 받고나서 
			//success부터 도는형식
			//var form =$('#writeForm')[0];
			//var formData = new FormData(form);
			
			var str = $('#bcontent').val();
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$('#bcontent').val(str);
				
			if($("#btitle").val()=="" || ("#bcontent").val()=="" ){
				alert("타이틀과 컨텐츠 모두를 꼭 입력하셔야 합니다.");
				$("#btitle").focus();
				return false;
			}	
			
			
				$.ajax({
					url:"./write1",
					type:"post",
					enctype:"multipart/form-data",
					data: new FormData($('#writeForm')[0]),
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
  
  
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/write.css">
</head>
<body>
<section>
    <h1>관리자 글쓰기</h1>
    <hr>

    <form action="write" id="writeForm" name="writeForm" method="post" enctype="multipart/form-data">
      <table>
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="bname" id="bname">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="btitle" id="btitle">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="bcontent" cols="50" rows="10" id="bcontent"></textarea>
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
        <button type="button" onclick="writeCheck()" class="write">작성완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='./list'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>