<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="common/tool/bootstrap4/css/bootstrap.css">
<script src="common/tool/jquery/jquery.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" 
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="common/tool/bootstrap4/js/bootstrap.js"></script>
<script src="common/tool/layui/layui.js"></script>
<script src="common/tool/layui/css/layui.css"></script>
<script>
	function edit(id){
	    $("[name='testname']").val("xxxxxxxxxxxxxxx");//向模态框中赋值
	        layui.use(['layer'], function () {
	            var layer = layui.layer, $ = layui.$;
	            layer.open({
	                type: 1,//类型
	                area: ['500px', '400px'],//定义宽和高
	                title: false,//题目
	                shadeClose: false,//点击遮罩层关闭
	                content: $('#edit'+id)//打开的内容
	                
	            });
	        })
	}

	function add(){
		 $("[name='testname']").val("xxxxxxxxxxxxxxx");//向模态框中赋值
	        layui.use(['layer'], function () {
	            var layer = layui.layer, $ = layui.$;
	            layer.open({
	                type: 1,//类型
	                area: ['500px', '400px'],//定义宽和高
	                title: false,//题目
	                shadeClose: false,//点击遮罩层关闭
	                content: $('#addtext')//打开的内容
	                
	            });
	        })
	}
	
	function del(id){
		alert(id);
		window.location.href ='delete.do?del='+id;
	}
	function save(id){
		var a=$("#name"+id).val();
		var b=$("#publisher"+id).val();
		var c=$("#author"+id).val();
		var d=$("#num"+id).val();
		 $.post("update.do",
				    {
         	'name':a,
         	'press':b,
         	'author':c,
         	'num':d,
         	'id':id
				    },function(data,status){
				    	window.location.reload();
				    });
		 window.location.reload();
	}
	function insert(){
		var a=$("#bookname").val();
		var b=$("#press").val();
		var c=$("#authors").val();
		var d=$("#inventory").val();
		$.post("insert.do",
			    {
     	'name':a,
     	'press':b,
     	'author':c,
     	'num':d
			    },function(data,status){
			    	window.location.reload();
			    });
	 window.location.reload();
	}
	
	
	function cancel(){
		window.location.reload();
	}


</script>
<title>图书管理系统管理员首页</title>
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
                <a class="nav-link" href="success.do">图书管理</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="borrow.do">借阅记录</a>
              </li>
            </ul>
            <hr class="d-sm-none">
          </div>
          
          <div class="col-sm-10 ">
            <div class="row">
            <divclass="mb-5"><img style="height:20px;weight:20px;" src="common/image/home.png"> 图书管理
            </div>
            <div class="row">
            	<form role ="form" class="form-inline" id="billQueryForm" action="search.do" method="post">
				<div class = "form-group m-auto">
				<button id="addBook" name="addBook" class ="btn btn-info btn-sm m-1" type="button" onclick="add()">新增图书</button> 
				
					<span>图书名称：</span> <input id="nameForQuery" name="nameForQuery" type="text" class="form-control m-1"
						placeholder="请输入图书名称" /> 
					<button id="queryBook" name="queryBook" 
						class ="btn btn-info btn-sm m-1" type="submit">查询</button> 
				</div>
			</form>
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
				<c:forEach items="${books}" var="b" varStatus="st">
					<tr>
						<td>${b.bookname}</td>
						<td>${b.press}</td>
						<td>${b.author}</td>
						<td>${b.inventory}</td>
						<td>
						 	<a href="#" onclick="edit(${b.id})">编辑 </a>
						 	<a href="#" id="deleteBill"  onclick="del(${b.id})">删除</a>
						</td>
					</tr>
					 <div id="edit${b.id}" style="display:none">
					      <h3>编辑图书</h3>
					      <hr/>
					      <p><span>图书名称:</span><input value="${b.bookname}" type="text" class="form-control" id="name${b.id}" style="width:300px;margin-left:50px;"/></p>
					      出版社:<input type="text" value="${b.press}" class="form-control" id="publisher${b.id}" style="width:300px;margin-left:50px;"/>
					      作者:<input type="text" value="${b.author}"  class="form-control" id="author${b.id}" style="width:300px;margin-left:50px;"/>
					      库存:<input type="text" value="${b.inventory}"  class="form-control" id="num${b.id}" style="width:300px;margin-left:50px;"/> 
					      <button type="button"  class="btn btn-sm mt-2" onclick="cancel()" style="float:right;margin-right:50px;">取消</button>
					      <button type="button" class="btn btn-primary btn-sm mt-2" onclick="save(${b.id})" style="float:right">保存</button>

  					</div> 
					
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
							href="changePage?pageAdd=0&currentPage=${pages}">尾页</a>
						</li>
						<li class ="page-item"><a class="page-link" id="nextPage"
							href="changePage?pageAdd=1&currentPage=${currentPage}">&gt;</a>
							<%--  --%>
						</li>
					
    				</c:when>
					<c:when test="${currentPage eq pages}">
    					<li class="page-item"><a class="page-link" id="previousPage"
							href="changePage?pageAdd=-1&currentPage=${currentPage}">&lt;</a>
							<!--  -->
						</li>
						<li class="page-item"><a class="page-link"
							href="changePage?pageAdd=0&currentPage=1">首页</a>
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
							href="changePage?pageAdd=-1&currentPage=${currentPage}">&lt;</a>
							<!--  -->
						</li>
						<li class="page-item"><a class="page-link"
							href="changePage?pageAdd=0&currentPage=1">首页</a>
						</li>
						<li class="disabled page-item"><a class="page-link"
							href="#">第${currentPage}页,共${pages}页</a>
						</li>
						<li class="page-item"><a class="page-link"
							href="changePage?pageAdd=0&currentPage=${pages}">尾页</a>
						</li>
						<li class="page-item"><a class="page-link" id="nextPage"
							href="changePage?pageAdd=1&currentPage=${currentPage}">&gt;</a>
							<%--  --%>
						</li>
   					 </c:otherwise>
				</c:choose>
			</ul>
			
			
			
			</form>
			<div id="addtext" style="display:none">
					      <h3>编辑图书</h3>
					      <hr/>
					      <p><span>图书名称:</span><input  type="text" class="form-control" id="bookname" style="width:300px;margin-left:50px;"/></p>
					      出版社:<input type="text"  class="form-control" id="press" style="width:300px;margin-left:50px;"/>
					      作者:<input type="text"   class="form-control" id="authors" style="width:300px;margin-left:50px;"/>
					      库存:<input type="text"   class="form-control" id="inventory" style="width:300px;margin-left:50px;"/> 
					      <button type="button"  class="btn btn-sm mt-2" onclick="cancel()" style="float:right;margin-right:50px;">取消</button>
					      <button type="button" class="btn btn-primary btn-sm mt-2" onclick="insert()" style="float:right">保存</button>

  					</div> 
			
            
            </div>
          </div>
        </div>
      
      
</body>
</html>