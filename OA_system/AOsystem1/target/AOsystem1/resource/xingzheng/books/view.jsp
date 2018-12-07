﻿<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="page" uri="http://com.letben.tag" %>
<!doctype html>
 <html lang="zh-CN">
 <head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="../../../css/common.css">
   <link rel="stylesheet" href="../../../css/main.css">
   <script type="text/javascript" src="../../../js/jquery.min.js"></script>
   <script type="text/javascript" src="../../../js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="../../../js/common.js"></script>


</head>
<body>
<form action="list.jsp" method="post">
     <div id="search_bar" class="mt10">
       <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">图书管理</b></div>

        
             <div  class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:center;" >
                 <a href="/xingzheng/books/rever" class="ext_btn"><span class="add"></span>借阅图书</a>
              </div>
            </div>
			</div>  </div>


 <div id="table" class="mt10">
        <div class="box span10 oh">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
                   <th >书籍编号</th>
                   <th >书籍名称</th>
                </tr>
                  <c:forEach items="${page.list}" var="book">
                <tr class="tr" align="center">
                       <td>${book.bookid}</td>
                       <td>${book.name}</td>
                 </tr>
                  </c:forEach>

				<td colspan="5" align="right">
				     <div class="page mt10">
						<div class="pagination">
                            <p align="center">
                                <page:page pageSize="${size}" historical="" method=""
                                           url="/xingzheng/books/queryallbooks"
                                           currentPage="${page.pageNum}" count="${page.total}"/>
                            </p>
						</div>
                     </div>
				</td>
			   </tr>
              </table>			  
		
             
        </div>
     </div>
     </div>
</form>
</body>
</html>