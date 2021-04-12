<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    	function loginCheck(){
    		
			//{rname:"홍길동",rcontent:"내용"}
			//ajax에서 위에 data는 보내는데이터 
			//아래 success:function(data)는 받는데이터
			//따라서 success전까지 보낼떄 돌고 받고나서 
			//success부터 도는형식
			 $.ajax({
				url:"/loginCheck",
				type:"get",
				data:{
					"id":$("#id").val(),"pw":$("#pw").val()
				},
				contentType:"application/json",
				success:function(data){
					if(data.loginCheck==1){
						alert(data.message);
						location.href="../index";
					}else{
						alert(data.message);
					}
				},
				error:function(){
					alert("로그인에 실패하였습니다.");
				}
				
			});
    		
    		
    	}
    </script>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body{
            position: relative;
            height: 100%;
            background: #f5f6f7;
        }
        #wrap{
            position: relative;
            min-height: 100%;
            font-size: 12px;
        }
        #header{
            position: relative;
            box-sizing: border-box;
            height: 168px;
            padding: 62px 0 0;
            width: 768px;
            margin: 0 auto;
        }

        #h_logo{
            display: block;
            overflow: hidden;
            width: 231px;
            height: 44px;
            margin: 0 auto;
            font-size: 15px;
            color: transparent;
            background: url("https://static.nid.naver.com/images/ui/login/pc_sp_login_190522.png") no-repeat -1px -1px;
        }
        #container{
            padding-bottom: 50px;
            min-height: 185px;
        }
        #content{
            width: 460px;
            margin: 0 auto;
            padding-bottom: 30px;
        }
        .id_area{
            position: relative;
        }
        .input_row{
            position: relative;
            height: 29px;
            margin: 0 0 14px;
            padding: 10px 35px 10px 15px;
            border: solid 1px #dadada;
            background: #fff;
        }
        .input_box{
            display: block;
            overflow: hidden;
        }

        .int{
            font-size: 15px;
            line-height: 16px;
            position: relative;
            z-index: 9;
            width: 100%;
            height: 16px;
            padding: 7px 0 6px;
            color: #000;
            border: none;
            background: #fff;
            appearance: none;
        }
        .btn_login{
            display: block;
            width: 100%;
            height: 61px;
            margin:30px 0 14px;
            padding-top: 1px;
            border: none;
            background: #03c75a;
            text-align: center;
            color: #fff;
            font-size: 20px;
            font-weight: 700;
            line-height: 61px;
            cursor: pointer;
        }
    </style>


</head>
<body>
<div id="wrap">
    <div id="header">
        <h1>
            <a href="#" id="h_logo"></a>
        </h1>
    </div>
    <div id="container">
        <div id="content">
            <div style="margin-bottom: 7px"></div>
            <form action="../member/loginOk" name="LoginFrom" method="post">
                <fieldset style="border: 0">
                    <div class="id_area">
                        <div class="input_row" id="id_area">
                            <span class="input_box">
                                <input type="text" name="id" id="id" class="int" placeholder="아이디">
                            </span>
                        </div>
                    </div>
                    <div class="pw_area">
                        <div class="input_row" id="pw_area">
                            <span class="input_box">
                                <input type="password" name="pw" id="pw" class="int" placeholder="비밀번호">
                            </span>
                        </div>
                    </div>
                   <input type="button" onclick="loginCheck()" class="btn_login" value="로그인">
                </fieldset>
            </form>
        </div>
    </div>
</div>
</body>
</html>