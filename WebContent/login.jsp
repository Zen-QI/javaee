<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <title>登录</title>
   
    <style>
  
		*{
		    margin: 0;
		    padding: 0;
		}
		
		body{
		    background-color: #3463AA;
		}
		a{
		    text-decoration: none;
		}
		.login-box{
		    
		    box-sizing: border-box;
		    width: 600px;
		    height: 350px;
		    margin: 100px auto;
		    border: 1px solid black;
		    background-color: #ccc;
		    border-radius:8px;
		    
		}
		.login-box>h1{
		    margin-top: 20px;
		}
		
		.textbox input{
		    margin: 5px;
		    width: 210px;
		    height: 30px;
		}
		.btn{
		    display: inline-block;
		    font-size: 14px;
		    height: 34px;
		    width: 130px;
		    margin-top: 20px;
		   
		}
		.yzm{
		    margin-top: 10px;
		    width: 100px;
		    height: 30px;
		}
		img{
		    margin-top: 10px;
		    width: 100px;
		    height: 34px;
		    margin-left: 5px;
		    position: absolute; 
		}
		h1{
		    margin-top: 10px;
		    margin-bottom: 40px;
		    font-size: 30px;
		}
		.content{
		    position: relative; 
		    left: 150px;
		}
    
    </style>
</head>
<body>
	<form action="ZssServlet?action=login" method="post">
    <div class="login-box">
       
    <div class="content">
            <h1>欢迎使用骚骚后台管理系统</h1>
        <div class="textbox">
             
                            用&nbsp;&nbsp;户：<input type="text" placeholder="Username" name="username" value=""><br>
       
                
           	密&nbsp;&nbsp;码：<input type="password" placeholder="Password" name="password" value="">
        </div>
        
        <div class="yzmbox">
                验证码：<input class="yzm" type="text" placeholder="请输入验证码"> 
                <img src="./timg.jpg" alt="">
        </div>
        <input type="submit" class="btn" value="登录">
        <a href="regster.jsp">没有账号？点我注册</a>
    </div>

    </div>
    
    </form>
</body>
</html>