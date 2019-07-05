<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>图书管理系统管理员借阅历史</title>
</head>
<body>      
  <nav class="navbar navbar-expand-sm  navbar-dark" style="background-color: #0069A8">
    <img  class="ml-2" src="common/image/logo.jpg">
    <div style="margin-left: 880px">
      <button>
        <img style="height: 20px;width: 20px;" src="common/image/user.png">admin管理员
      </button>
      <button>
        <img style="height: 20px;width: 20px;border-left:1px #00FF66" src="common/image/poweroff.png">退出
      </button>
    </div>  
  </nav>
   
  <div class="container-fluid" style="margin-top:0px;height: 600px;">
    <div class="row">
      <div class="col-sm-2" style="color:darkgrey">
        <ul class="nav nav-pills flex-column">
          <li class="nav-item">
            <a class="nav-link" href="#">菜单项MENU</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="success.do">图书管理</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="borrow.do">借阅记录</a>
          </li>
        </ul>
        <hr class="d-sm-none">
      </div>
      <div class="col-sm-10">
        <div class="mb-5"><img style="height:20px;width: 20px;" src="common/image/home.png"> 借阅历史
        </div>
         
         <form role ="form" class="form-inline" action="queryBill" method="post" id="billQueryForm">
				<div class = "form-group m-auto">
					<span>图书名称：</span> <input id="nameForQuery" name="nameForQuery" type="text" class="form-control m-1"
						placeholder="请输入图书名称" /> 
					<button id="queryBook" name="queryBook" 
						class ="btn btn-info btn-sm m-1" type="submit">查询</button> 
				</div>
		</form>
		
		<table id="historyTable"
				class="table table-condensed table-hover table-striped">
				<tr>
					<th>图书名称</th>
					<th>出版设</th>
					<th>作者</th>
					<th>借阅人学号</th>
					<th>借阅人姓名</th>
					<th>借阅时间</th>
					<th>归还时间</th>
				</tr>
				<c:forEach items="${historys}" var="b" varStatus="st"
					begin="${currentPage*10}" end="${(currentPage+1)*10-1}">
					<tr>
						<td>${b.bookname}</td>
						<td>${b.press}</td>
						<td>${b.author}</td>
						<td>${b.studynumb}</td>
						<td>${b.name}</td>
						<td>${b.borrowtime}</td>
						<td>${b.returntime}</td>
						
					</tr>
				</c:forEach>
			</table>
      </div>
    </div>
  </div>
   
</body>
</html>