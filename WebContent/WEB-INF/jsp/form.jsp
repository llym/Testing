<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form role ="form" class="form-inline" action="queryBill" method="post" id="billQueryForm">
				<div class = "form-group m-auto">
					<span>商品名称：</span> <input id="nameForQuery" name="nameForQuery" type="text" class="form-control m-1"
						placeholder="请输入商品的名称" /> 
					<span>供应商：</span>
					<select id="suppliers" name = "suppliers"class="form-control m-1">
					<option value="0">全部</option>
					<c:forEach items="${suppliers}" var="s" varStatus="st">
						<option value="${s.id}">${s.name}</option>
					</c:forEach>
					</select> 
					<span>是否付款：</span>
					<select id="payment" name="payment" class="form-control m-1">
						<option value="2">不限</option>
						<option value="1">已付款</option>
						<option value="0">未付款</option>
					</select>
					<button id="billQuery" name="billQuery" 
						data-toggle="popover" title="提示：" data-content="请输入查询条件"
						class ="btn btn-info btn-sm m-1" type="submit">查询</button> 
				</div>
				<a href="billAdd" class="btn btn-info btn-sm m-auto">
         		 <span class="glyphicon glyphicon-plus"></span> 添加账单
       		 	</a>
			</form>

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
    				</c:when>
					<c:when test="${currentPage == 0}">
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
    				</c:when>
					<c:when test="${currentPage eq (pages-1)}">
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
    				</c:when>
					<c:otherwise>
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
   					 </c:otherwise>
				</c:choose>
			</ul>
</body>
</html>