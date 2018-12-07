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
    <script type="text/javascript" src="../../../js/jquery-1.4.2.min.js"></script>
     <script type="text/javascript" src="../../../js/jquery-1.8.0.min.js"></script>
     <script type="text/javascript" src="../../../js/jquery.validate.js"></script>

  <script type="text/javascript">
    function del(id){
	  var aa=confirm("确认删除");
	  if(aa){
          location.href="/xingzheng/room/delete?id="+id;
      }
	}
  </script>

     <script type="text/javascript">
         $(function () {
             $("[name=all]").click(function () {
                 var singles=$("[name=roomids]");
                 for (var i=0;i<singles.length;i++){
                     singles[i].checked=$(this)[0].checked;
                 }
             })
         })

         function daochu() {
             var zi=$("[name=roomids]");
             var k=1;
             for (var i = 0; i < zi.length; i++) {
                 if(zi[i].checked==true){
                     k=2;
                     var rs=confirm("导出？");
                     if(rs){
                         $("[name=form0]").attr("action","/xingzheng/room/daochu");
                         document.forms[0].submit();
                     }
                     break;
                 }
             }
             if(k==1){
                 alert("先选择信息才能导出！！！")
             }
         }

         function delall() {
             var zi=$("[name=roomids]");
             var k=1;
             for (var i = 0; i < zi.length; i++) {
                 if(zi[i].checked==true){
                     k=2;
                     var rs=confirm("删除？");
                     if(rs){
                         $("[name=form0]").attr("action","/xingzheng/room/deleteall");
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
        <div  class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:left;" >
                  <a href="/xingzheng/room/queryallreserve" class="ext_btn"><span class=""></span>会议室预定管理</a>
                 <a href="/xingzheng/room/yuding" class="ext_btn"><span class=""></span>会议室预定</a>
              </div>
            </div>
    
        
             <div  class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:center;" >
                 
                 <a href="/resource/xingzheng/room/add.jsp" class="ext_btn">
                     <span class="add"></span>添加会议室</a>
              </div>
            </div>
			
		
 <div id="table" class="mt10">
        <div class="box span10 oh">
            <form method="post" action="" name="form0">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
				   <th>
                       <input type="checkbox" name="all">
                   </th>
                   <th >会议室名称</th>
                   <th >会议室描述</th>
				   <th>操作</th>
                    </tr>
                  <c:forEach items="${page.list}" var="room">
                    <tr class="tr" align="center">
                       <td class="td_center">
                           <input type="checkbox" name="roomids" value="${room.id}">
                       </td>
                       <td>${room.name}</td>
                       <td>${room.remark}</td>
                       <td>
                          <a href="/xingzheng/room/update?roomid=${room.id}">编辑</a> |&nbsp;
                          <a href="javascript:void(0)" onclick="del(${room.id})">删除</a>
                       </td>
                     </tr>
                  </c:forEach>

				

                
               <tr>
			   <td colspan="2"><input type="button" name="button" class="btn btn82 btn_del" value="删除" onclick="delall()">
			    <input type="button" name="button"  class="btn btn82 btn_export" value="导出" onclick="daochu()">
				</td>
				<td colspan="5" align="right">
				     <div class="page mt10">
						<div class="pagination">
                              <p align="center">
                              <page:page pageSize="${size}" historical="" method=""
                                         url="/resource/xingzheng/room/queryall"
                                         currentPage="${page.pageNum}" count="${page.total}"/>
                             </p>
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