<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" 
integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" 
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" 
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>学生-我的借阅</title>
</head>
<body>      
  <nav class="navbar navbar-expand-sm  navbar-dark" style="background-color: #0069A8">
    <img  class="ml-2" src="common/image/logo.jpg">
    <div style="margin-left: 880px">
      <button>
        <img style="height: 20px;width: 20px;" src="common/image/user.png"><span>张超同学</span>
      </button>
      <button>
        <img style="height: 20px;width: 20px;border-left:1px " src="common/image/poweroff.png">退出
      </button>
    </div>  
  </nav>
   
  <div class="container-fluid" style="margin-top:0px;height: 600px;">
    <div class="row">
      <div class="col-sm-2" style="color:darkgrey">
        <nav class="navbar">
        <ul class="nav nva-tabs" role="tablist">
          <li class="nav-item">
            <a class="nav-link" href="#">菜单项MENU</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#bookBorrow">图书借阅</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#myBorrow">我的借阅</a>
          </li>
        </ul>
    </nav>
        <hr class="d-sm-none">
      </div>
      <div class="col-sm-10">
        <div class="tab-content">
                <div class="mt-2 container tab-pane active" id="bookBorrow" style="height: 50px;"><img style="height:20px;width: 20px;" src="common/image/home.png">
                    <span>图书借阅</span><p>11111</p>
                    </div>
        <div class="mt-2 container tab-pane" id="myBorrow" style="height: 50px;"><img style="height:20px;width: 20px;" src="common/image/home.png">
            <span>我的借阅</span><p>22222</p>
        </div>
        </div>
        
            <div style="height: 800px;width: 600px;"></div>
      </div>
    </div>
  </div>
   
</body>
</html>