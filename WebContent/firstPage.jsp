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
<title>图书管理系统首页</title>
</head>
<body>      
      <nav class="navbar navbar-expand-sm  navbar-dark" style="background-color: #0069A8">
        <img  class="ml-2" src="common/image/logo.jpg">
        <div style="margin-left: 880px">
      <button>
        <img style="height: 20px;width: 20px;" src="common/image/user.png">${username}管理员
      </button>
      <button>
        <img style="height: 20px;width: 20px;border-left:1px #00FF66" src="common/image/poweroff.png">退出
      </button>
    </div>
      </nav>
       
      <div class="container-fluid" style="margin-top:0px;height: 600px;">
        <div class="row">
          <div class="col-sm-2">
            <ul class="nav nav-pills flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="#">菜单项MENU</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">图书管理</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="adminHistory.jsp">借阅记录</a>
              </li>
            </ul>
            <hr class="d-sm-none">
          </div>
          <div class="col-sm-10">
            <div>
            <divclass="mb-5"><img style="height:20px;weight:20px;" src="common/image/home.png"> 借阅历史
            </div>
            <table id="bookTable"
				class="table table-condensed table-hover table-striped">
				<tr>
					<th>图书名称</th>
					<th>出版设</th>
					<th>作者</th>
					<th>库存</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${books}" var="b" varStatus="st"
					begin="${currentPage*10}" end="${(currentPage+1)*10-1}">
					<tr>
						<td>${b.name}</td>
						<td>${b.press}</td>
						<td>${b.author}</td>
						<td>${b.inventory}</td>
						<td>
						 	<a href="updateBook?bookId=${b.id}">编辑</a>
						 	<a href="deleteBook?bookId=${b.id}" id="deleteBill">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<ul class="pagination">
				<c:choose>
					<c:when test="${pages == 1}">
	      				<form class="form-inline">	
	      					<li class="disabled page-item"><a class="page-link" id="previousPage"
								href="#">上一页</a>
							</li>
							<li class="disabled page-item"><a class="page-link"
								href="#">首页</a>
							</li>
							<li class="disabled page-item"><a class="page-link"
								href="#">第${currentPage+1}页,共${pages}页</a>
							</li>
							<li class="disabled page-item"><a class="page-link"
								href="#">尾页</a>
							</li>
							<li class="page-item disabled"><a class="page-link" id="nextPage"
								href="#">下一页</a>
							</li>
	      				</form>	
    				</c:when>
					<c:when test="${currentPage == 0}">
					<form class="form-inline">
      					 <li class="disabled page-item"><a class="page-link" id="previousPage"
							href="#">上一页</a>
						</li>
						<li class="disabled page-item"><a class="page-link"
							href="#">首页</a>
						</li>
						<li class="disabled page-item"><a class="page-link"
							href="#">第${currentPage+1}页,共${pages}页</a>
						</li>
						<li class="page-item"><a class="page-link"
							href="billList?pageAdd=0&currentPage=${pages-1}">尾页</a>
						</li>
						<li class ="page-item"><a class="page-link" id="nextPage"
							href="billList?pageAdd=1&currentPage=${currentPage}">下一页</a>
							<%--  --%>
						</li>
					</form>
    				</c:when>
					<c:when test="${currentPage eq (pages-1)}">
					<form class="form-inline">
    					<li class="page-item"><a class="page-link" id="previousPage"
							href="billList?pageAdd=-1&currentPage=${currentPage}">上一页</a>
							<!--  -->
						</li>
						<li class="page-item"><a class="page-link"
							href="billList?pageAdd=0&currentPage=0">首页</a>
						</li>
						<li class="disabled page-item"><a class="page-link"
							href="#">第${currentPage+1}页,共${pages}页</a>
						</li>
						<li class="disabled page-item"><a class="page-link"
							href="#">尾页</a>
						</li>
						<li class="page-item disabled"><a class="page-link" id="nextPage"
							>下一页</a>
						</li>
					</form>
    				</c:when>
					<c:otherwise>
					<form class="form-inline">
						<li class="page-item"><a class="page-link" id="previousPage"
							href="billList?pageAdd=-1&currentPage=${currentPage}">上一页</a>
							<!--  -->
						</li>
						<li class="page-item"><a class="page-link"
							href="billList?pageAdd=0&currentPage=0">首页</a>
						</li>
						<li class="disabled page-item"><a class="page-link"
							href="#">第${currentPage+1}页,共${pages}页</a>
						</li>
						<li class="page-item"><a class="page-link"
							href="billList?pageAdd=0&currentPage=${pages-1}">尾页</a>
						</li>
						<li class="page-item"><a class="page-link" id="nextPage"
							href="billList?pageAdd=1&currentPage=${currentPage}">下一页</a>
							<%--  --%>
						</li>
						</form>
   					 </c:otherwise>
				</c:choose>
			</ul>
            
            </div>
          </div>
        </div>
      </div>
       
</body>
</html>