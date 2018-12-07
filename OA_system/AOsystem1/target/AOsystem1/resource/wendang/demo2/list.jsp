<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
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


	 <%--全选--%>
	 <script type="text/javascript">
         $(function(){
             $("[name=all]").click(function(){
                 //alert($(this)[0].checked);
                 var singles=$("[name=single]");
                 for(var i=0;i<singles.length;i++){
                     singles[i].checked=$(this)[0].checked;
                 }
             });
         })
	 </script>

	 <%--总删除--%>
	 <script type="text/javascript">
         function delall(pid) {
             confirm("确认删除");
             var zi = $("[name=single]");
             var k = 1;
             for (var i = 0; i < zi.length; i++) {
                 if (zi[i].checked == true) {
                     k = 2;
                     var rs = confirm("确认删除？？？");
                     if (rs) {
                         $("[name=formx]").attr("action", "/resource/wendang/demo1/deletein");
                         document.forms[0].submit();
                     }
                     break;
                 }
             }
         }
	 </script>

	 <%--批量导出--%>
	 <script type="text/javascript">
         function excel(id) {
             var zi=$("[name=single]");
             var k=1;
             for (var i = 0; i < zi.length; i++) {
                 if(zi[i].checked==true){
                     k=2;
                     var rs=confirm("导出？");
                     if(rs){
                         $("[name=formx]").attr("action","/resource/wendang/demo1/daochu1");
                         document.forms[0].submit();
                     }
                     break;
                 }
             }
             if(k==1){
                 alert("先选择信息才能导出！！！")
             }
         }
	 </script>

</head>
<body>

  &nbsp;文档回收站
 <div id="table" class="mt10">
        <div class="box span10 oh">
			<form method="post" action="" name="formx">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
				  <c:forEach items="${pi.list}" var="d">
				  <input type="hidden" name="pid" value="${d.pid}">
				  <input type="hidden" name="id" value="${d.id}">
				  </c:forEach>
                <tr>
				   <th> <input type="checkbox" name="all"></th>
                   <th >名称</th>
                   <th >类型</th>
                   <th >所有者</th>
				   <th>删除时间</th>
				   <th>操作</th>
                    </tr>
				  <c:forEach items="${pi.list}" var="d">
                <tr class="tr" align="center">
                   <td class="td_center"> <input type="checkbox" value="${d.id}" name="single"/></td>
                   <td>${d.name1}</td>
                   <td>${d.type}</td>
				   <td>${d.user.name}</td>
                   <td> <fmt:formatDate value="${d.starttime}" pattern="yyyy-MM-dd" ></fmt:formatDate></td>
				   <td>
				      <a href="/resource/wendang/demo1/huanyuan?id=${d.id}&isdelete=0&pid=${u1.id}" onclick="del1()">还原</a> |&nbsp;
					  <a href="/resource/wendang/demo1/deletein?single=${d.id}" onclick="del()">删除</a>
				   </td>
                 </tr>
				 </c:forEach>


                
               <tr>
			   <td colspan="2"><input type="button" name="button" class="btn btn82 btn_del" value="删除" onclick="delall()">
			    <input type="button" name="button"  class="btn btn82 btn_export" value="导出" onclick="excel()">
				</td>
				<td colspan="5" align="right">
				     <div class="page mt10">
						<div class="pagination">
						  <ul >
							  <page:page pageSize="${pi.size }" historical="&name=${name}" method="" url="/resource/wendang/demo1/huishousel" currentPage="${pi.pageNum }" count="${pi.total }"/>
						  </ul>
						</div>
                     </div>
				</td>
			   </tr>
              </table>			  
		
			</form>
        </div>
     </div>

</body>
</html>