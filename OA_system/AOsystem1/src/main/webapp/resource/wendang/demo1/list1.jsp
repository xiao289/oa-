﻿<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="page" uri="http://com.letben.tag" %>
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
             var id=$("[name=id]").val();
             var k = 1;
             for (var i = 0; i < zi.length; i++) {
                 if (zi[i].checked == true) {
                     k = 2;
                     var rs = confirm("确认删除？？？");
                     if (rs) {
                         $("[name=formx]").attr("action", "/resource/wendang/demo1/updat?id="+id);
                         document.forms[1].submit();
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
             var id=$("[name=id]").val();
             var k=1;
             for (var i = 0; i < zi.length; i++) {
                 if(zi[i].checked==true){
                     k=2;
                     var rs=confirm("导出？");
                     if(rs){
                         $("[name=formx]").attr("action","/resource/wendang/demo1/daochu1?id="+id);
                         document.forms[1].submit();
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
<form action="/resource/wendang/demo1/secondsel" method="post">

    <c:forEach items="${pi.list}" var="d1">
    <input type="hidden" name="id" value="${d1.pid}">
    </c:forEach>
     <div id="search_bar" class="mt10">
       <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">文档列表</b></div>
            <div class="box_center pt10 pb10">
              <table class="form_table" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>文件名称</td>
                    <td><input id="name" type="text" name="name1" class="input-text lh25" size="10" value="${name1}"></td>


                    <td><input type="submit" name="button" class="btn btn82 btn_search" value="查询">
                        <input id="btn" type="button" name="button" class="btn btn82 btn_recycle" value="清空"></td>
                    <script>
                        $("#btn").click(function(){
                            $("#name").val(" ");
                            $("[name=formx]").attr("action", "/resource/wendang/demo1/secondsel?id=${pid}");
                            document.forms[1].submit();
                        })
                    </script>
                </tr>
               
              </table>
            </div>
        
             <div  class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:center;" >
                 <a href="add.jsp" class="ext_btn"><span class="add"></span>添加文件夹</a>
                 <a href="add1.jsp" class="ext_btn"><span class="add"></span>添加文件</a>

              </div>
            </div>
			</div>  </div>
     </div>
			</form>

 <div id="table" class="mt10">
        <div class="box span10 oh">
            <form method="post" action="" name="formx">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                  <input type="hidden" name="id" value="${d1.pid}">
                <tr>
				   <th> <input name="all" type="checkbox"/></th>
                   <th >名称</th>
                   <th >类型</th>
                   <th >所有者</th>
				   <th>创建时间</th>
				   <th>操作</th>
                    </tr>
                  <c:forEach items="${pi.list}" var="d1">
                <tr class="tr" align="center">
                   <td class="td_center"><input type="checkbox" value="${d1.id}" name="single"/></td>
                   <td>${d1.name1}</td>
				   <td>${d1.type}</td>
                   <td>${d1.user.name}</td>
                   <td>
                       <fmt:formatDate value="${d1.starttime}" pattern="yyyy-MM-dd" ></fmt:formatDate>
                   </td>
                       <input type="hidden" value="${d1.pid}" name="id">
				   <td>
					  <a href="/resource/wendang/demo1/selectbyid?id=${d1.id}&shangjiid=${d1.pid}">编辑</a> |&nbsp;
                       <a href="/resource/wendang/demo1/updat?single=${d1.id}&id=${d1.pid}" onclick="delall()">删除</a>

                    <c:if test="${d1.type!='文件夹'}" >
                        <a href="/resource/wendang/demo1/down1?fname=${d1.url}">|&nbsp;下载</a>
                    </c:if>
                   </td>
                    </c:forEach>
                 </tr>
               <tr>
                   <td colspan="2">
                   <input type="button" name="button" class="btn btn82 btn_del" value="删除" onclick="delall()">
                       <input type="button" name="button"  class="btn btn82 btn_export" value="导出" onclick="excel(${id})">
				</td>
				<td colspan="5" align="right">
				     <div class="page mt10">
						<div class="pagination">
                            <ul >
                                <page:page pageSize="${pi.size }" historical="&name=${name}&pid=${id}" method="" url="/resource/wendang/demo1/secondsel" currentPage="${pi.pageNum }" count="${pi.total }"/>
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