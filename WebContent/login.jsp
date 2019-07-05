<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="common/tool/layui/css/layui.css">
    <script src="common/tool/jquery/jquery.js"> </script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="#" />
    <style>
        .change::-webkit-input-placeholder {
            color: red;
        }

        .container-fluid {
            width: 450px;
            height: 500px;
            position: relative;
            margin-top: 50px;

        }

        input[type="text"]:focus {
            outline: none;
            border: 0;
        }

        .input {
            BORDER-TOP-STYLE: none;
            BORDER-RIGHT-STYLE: none;
            BORDER-LEFT-STYLE: none;
            BORDER-BOTTOM-STYLE: solid rgb(0, 0, 0);
            width: 400px;
            height: 50px;
        }

        #login {
            width: 400px;
        }

        .foot {

            width: 400px;
            height: 20px;

        }

        .input-val {
            width: 300px;
            height: 32px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }

        #canvas {
            vertical-align: middle;
            box-sizing: border-box;
            border: 1px solid #ddd;
            cursor: pointer;
        }

        .btn {
            display: block;
            margin-top: 20px;
            height: 32px;
            width: 100px;
            font-size: 16px;
            color: #fff;
            background-color: #457adb;
            border: none;
            border-radius: 50px;
        }
    </style>

    <script>
    $(function(){ 
    	$("#login").click(function(){
    		var username = $("#username").val();
            var password = $("#password").val();
            var identity = $("#user").val();
          
            if (username == '') {
                $('#username').attr('placeholder', "请输入手机号或邮箱");
                $('#username').addClass("change");
            }
            if (password == '') {
                $('#password').attr('placeholder', "请输入密码");
                $('#password').addClass("change");
            }
            if (password != '' && username != '') {
                var level;
                if (identity == "我是管理员") {
                    status = 1;
                } else {
                    status = 0;
                }
                $.ajax({
                    type: "post",
                    url: "login.do",
                    data: { "username": username,"password":password,"status":status },
                    success: function (result) {
                    	
                    	if(result=="success.do"){
                    		window.location.href=result;
                    	}
                    	else if(result=="myBorrow.jsp"){
                    		window.location.href=result;
                    	}
                    	else{
                    		alert(result);
                    		window.location.href="login.jsp";
                    	}
                    	
                    }
                });
            }
            
        });
    }); 
    
    </script>

</head>

<body background="common/image/bg.jpg">
    <div class="container-fluid" align="center">
        <div class="logo">
        	<input type="image" src="common/image/logo1.png">
            <h1 class="text-primary">图书馆管理员系统</h1><br />
            <h3 class="text-primary">LIBRARY MANAGEMENT SYSTEM</h3>
            <form class="mt-5">
                <input type="text" class="input" id="username" placeholder="👨用户名"><br />
                <input type="password" class="input mt-2" id="password" placeholder="🔒密码" onfocus="this.placeholder=''"
                    onblur="this.placeholder='请输入密码'"><br />
                <select class="form-control mt-2" style="width:150px;margin-right:200px" id="user">
                    <option>我是管理员</option>
                    <option>我是用户</option>
                </select>
                <button type="button" class="btn btn-primary" id="login">登录</button>
            </form>
        </div>
    </div>
</body>

</html>