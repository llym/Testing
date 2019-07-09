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
<script>
function ret(id){
	alert(id);
	
		window.location.href ='returnbook.do?ret='+id;	
}
</script>



<title>图书管理系统学生借阅历史</title>
</head>
<body>      
  <nav class="navbar navbar-expand-sm  navbar-dark" style="background-color: #0069A8">
    <img  class="ml-2" src="common/image/logo.jpg">
    <div style="margin-left: 880px">
      <button>
        <img style="height: 20px;width: 20px;" src="common/image/user.png">${username}同学
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
            <a class="nav-link" href="student.do">图书借阅</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="sborrow.do">我的借阅</a>
          </li>
        </ul>
        <hr class="d-sm-none">
      </div>
      <div class="col-sm-10">
        <div class="mb-5"><img style="height:20px;width: 20px;" src="common/image/home.png"> 借阅历史
        </div>
         
         <form role ="form" class="form-inline" action="findb.do" method="post" id="billQueryForm">
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
					<th>操作</th>
					
				</tr>
				<c:forEach items="${historys}" var="b" varStatus="st">
					<tr>
						<td>${b.bookname}</td>
						<td>${b.press}</td>
						<td>${b.author}</td>
						<td>${b.studynumb}</td>
						<td>${b.name}</td>
						<td>
						<fmt:formatDate value="${b.borrowtime}" pattern="yyyy-MM-dd"/>
						</td>
						<td>
						<fmt:formatDate value="${b.returntime}" pattern="yyyy-MM-dd"/></td>
						<td>
						 	<a href="#" id="borrowBill"  onclick="ret(${b.id})">归还</a>
						</td>
					</tr>
					
				</c:forEach>
			</table>
			
			<form class="form-inline justify-content-end">
			<span>共${recordNum}条</span>
			
			<ul class="pagination">
				<c:choose>
					<c:when test="${pages == 1}">
	      					<li class="disabled page-item"><a class="page-link" id="previousPage"
								href="#">&lt;</a>
							</li>
							<li class="disabled page-item"><a class="page-link"
								href="#">首页</a>
							</li>
							<li class="disabled page-item"><a class="page-link"
								href="#">第${currentPage}页,共${pages}页</a>
							</li>
							<li class="disabled page-item"><a class="page-link"
								href="#">尾页</a>
							</li>
							<li class="page-item disabled"><a class="page-link" id="nextPage"
								href="#">&gt;</a>
							</li>
	      					
    				</c:when>
					<c:when test="${currentPage == 1}">
      					 <li class="disabled page-item"><a class="page-link" id="previousPage"
							href="#">&lt;</a>
						</li>
						<li class="disabled page-item"><a class="page-link"
							href="#">首页</a>
						</li>
						<li class="disabled page-item"><a class="page-link"
							href="#">第${currentPage}页,共${pages}页</a>
						</li>
						<li class="page-item"><a class="page-link"
							href="changePage4?pageAdd=0&currentPage=${pages}">尾页</a>
						</li>
						<li class ="page-item"><a class="page-link" id="nextPage"
							href="changePage4?pageAdd=1&currentPage=${currentPage}">&gt;</a>
							<%--  --%>
						</li>
					
    				</c:when>
					<c:when test="${currentPage eq pages}">
    					<li class="page-item"><a class="page-link" id="previousPage"
							href="changePage4?pageAdd=-1&currentPage=${currentPage}">&lt;</a>
							<!--  -->
						</li>
						<li class="page-item"><a class="page-link"
							href="changePage4?pageAdd=0&currentPage=1">首页</a>
						</li>
						<li class="disabled page-item"><a class="page-link"
							href="#">第${currentPage}页,共${pages}页</a>
						</li>
						<li class="disabled page-item"><a class="page-link"
							href="#">尾页</a>
						</li>
						<li class="page-item disabled"><a class="page-link" id="nextPage"
							>&gt;</a>
						</li>
    				</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" id="previousPage"
							href="changePage4?pageAdd=-1&currentPage=${currentPage}">&lt;</a>
							<!--  -->
						</li>
						<li class="page-item"><a class="page-link"
							href="changePage4?pageAdd=0&currentPage=1">首页</a>
						</li>
						<li class="disabled page-item"><a class="page-link"
							href="#">第${currentPage}页,共${pages}页</a>
						</li>
						<li class="page-item"><a class="page-link"
							href="changePage4?pageAdd=0&currentPage=${pages}">尾页</a>
						</li>
						<li class="page-item"><a class="page-link" id="nextPage"
							href="changePage4?pageAdd=1&currentPage=${currentPage}">&gt;</a>
							<%--  --%>
						</li>
   					 </c:otherwise>
				</c:choose>
			</ul>
			
			
			
			</form>
			
      </div>
    </div>
  </div>
   
</body>
</html>