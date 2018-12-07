<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
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
         function delall() {
             confirm("确认删除");
             var zi = $("[name=single]");
             var k = 1;
             for (var i = 0; i < zi.length; i++) {
                 if (zi[i].checked == true) {
                     k = 2;
                     var rs = confirm("确认删除？？？");
                     if (rs) {
                         $("[name=formx]").attr("action", "/resource/tonggao/demo1/deleteall");
                         document.forms[1].submit();
                     }
                     break;
                 }
             }
         }
     </script>

     <%--批量导出--%>
     <script type="text/javascript">
         function daochu() {
             var zi=$("[name=single]");
             var k=1;
             for (var i = 0; i < zi.length; i++) {
                 if(zi[i].checked==true){
                     k=2;
                     var rs=confirm("导出？");
                     if(rs){
                         $("[name=formx]").attr("action","/resource/tonggao/demo1/daochu");
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

     <%-- 判定时间--%>
     <script type="text/javascript">
         $(function () {
            var k=1;

             $("[name=endtime]").blur(function () {
                 var start=$("[name=starttime]").val();
                 var end=$("[name=endtime]").val();
                 var date1= new Date(Date.parse(start.replace(/-/g,  "/")));
                 var date2= new Date(Date.parse(end.replace(/-/g,  "/")));
                 if(date1.getTime()>date2.getTime()){
                     alert("前面的时间不能大于后面的时间哦！");
                     k=2;
                 }else{
                     k=1;
                 }
             });

         })
     </script>



</head>
<body>
<form action="/resource/tonggao/demo1/selectlist" method="post">
     <div id="search_bar" class="mt10">
       <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">通告列表</b></div>
            <div class="box_center pt10 pb10">
              <table class="form_table" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td>名称</td>
                  <td><input id="title" type="text" name="title" class="input-text lh25" value="${title}" size="10"></td>
                 
                  <td>发布时间</td>
                  <td><input id="starttime" type="text" name="starttime" value="${starttime}" class="input-text lh25" size="10">to
				  <input id="endtime" type="text" name="endtime" value="${endtime}" class="input-text lh25" size="10"></td>
                   <td><input type="submit" name="button" class="btn btn82 btn_search" value="查询">
			    <input id="btn" type="button" name="button" class="btn btn82 btn_recycle" value="清空"></td>
                <script>
                    $("#btn").click(function(){
                        $("#title").val(" ");
                        $("#starttime").val(" ");
                        $("#endtime").val(" ");
                        document.forms[1].submit();
                    })
                </script>
                </tr>
               
              </table>
            </div>
        
             <div  class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:center;" >


                 <a href="add.jsp" class="ext_btn"><span class="add"></span>添加通告</a>
              </div>
            </div>
			</div>  </div>
            </div>
			</form>

 <div id="table" class="mt10">
        <div class="box span10 oh">
            <form method="post" action="" name="formx">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
				   <th><input name="all" type="checkbox"/></th>
                   <th >名称</th>
                   <th >发布人</th>
                   <th >状态</th>
                   <th>发布时间</th>
				   <th>操作</th>
                </tr>
            <c:forEach items="${pi.list}" var="a">
                <tr class="tr" align="center">
                   <td class="td_center">
                       <input type="checkbox" value="${a.id}" name="single"/></td>
                   <td><a href="/resource/tonggao/demo1/sid?id=${a.id}">${a.title}</a></td>
                   <td>${a.user.name}</td>
                   <td>
                   <c:if test="${a.state=='0'}">草稿</c:if>
                       <c:if test="${a.state=='1'}">已发布</c:if>
                       <c:if test="${a.state=='2'}">已过期</c:if>
                   </td>
				   <td><fmt:formatDate value="${a.suntime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <c:if test="${a.state=='0'}">
                    <td>
                            <a href="/resource/tonggao/demo1/upp?id=${a.id}&state=1">发布</a> |&nbsp;
                            <a href="/resource/tonggao/demo1/selectbyid?id=${a.id}">编辑</a> |&nbsp;
                        <a href="/resource/tonggao/demo1/delete?id=${a.id}" onclick="del()">删除</a>
                    </td>
                    </c:if>
                    <c:if test="${a.state=='1'||a.state=='2'}">
                    <td>
					        <a href="/resource/tonggao/demo1/delete?id=${a.id}" onclick="del()">删除</a>
				    </td>
                    </c:if>
                </tr>
            </c:forEach>

			   <td colspan="2"><input type="button" name="button" class="btn btn82 btn_del" value="删除" onclick="delall()">
			    <input type="button" name="button"  class="btn btn82 btn_export" value="导出" onclick="daochu()">
				</td>
				<td colspan="5" align="right">
				     <div class="page mt10">
						<div class="pagination">
						  <ul >
                              <page:page pageSize="${pi.size }" historical="&title=${title}&starttime=${starttime}&endtime=${endtime}" method="" url="/resource/tonggao/demo1/selectlist" currentPage="${pi.pageNum }" count="${pi.total }"/>
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