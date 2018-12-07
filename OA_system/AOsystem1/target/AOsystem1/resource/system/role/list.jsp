﻿<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fy" uri="http://java.sun.com/jsp/femye/fy" %>
<!doctype html>
 <html lang="zh-CN">
 <head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="../../../css/common.css">
   <link rel="stylesheet" href="../../../css/main.css">
   <script type="text/javascript" src="../../../js/jquery.min.js"></script>
   <script type="text/javascript" src="../../../js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="../../../js/common.js"></script>

  <script type="text/javascript">

      $(function () {
          $("[name=all]").click(function () {
              var single=$("[name=single]");
              for (var i = 0; i < single.length; i++){
                  single[i].checked=$(this)[0].checked;
              }
          })
      })

    function del(){
	  $("[name=rolename]").val("");
	  document.forms[0].submit();
	}


	function delall(){
	  var b1 = confirm("批量删除不会删除包含用户的角色,确认删除");
	  if (b1 == true){
          var single=$("[name=single]");
          var  k = -1;
          for (var i = 0; i < single.length; i++){
              if (single[i].checked==true) {
                  k = 2;
                  $("[name=form1]").attr("action","/resource/system/role/deletes");
                  document.forms[1].submit();
                  break;
              }
          }
          if (k == -1){
              alert("请先选择要删除的角色");
          }
      }
	}
	function excel(){
	  var b = confirm("确认导出");
	  if (b == true){
          var single=$("[name=single]");
          var  k = -1;
          for (var i = 0; i < single.length; i++){
              if (single[i].checked==true) {
                  k = 2;
                  document.forms[1].submit();
                  break;
              }
          }
          if (k == -1){
              alert("请先选择导出得角色");
          }
      }
	}
  </script>
</head>
<body>

     <div id="search_bar" class="mt10">
       <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">搜索</b></div>
            <div class="box_center pt10 pb10">
                <form action="/resource/system/role/getallrole" method="post">
              <table class="form_table" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td>角色名称</td>
                  <td><input type="text" name="rolename" value="${name}" class="input-text lh25" size="10"></td>
                 
                  
                   <td><input type="submit" name="button" class="btn btn82 btn_search" value="查询">
			    <input type="button" name="button" onclick="del()" class="btn btn82 btn_recycle" value="清空"></td>
                </tr>
               
              </table>
</form>
            </div>
        
             <div  class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:center;" >
                 
                 <a href="/resource/system/role/readyadd" class="ext_btn"><span class="add"></span>添加角色</a>
              </div>
            </div>
			</div>  </div>


 <div id="table" class="mt10">
        <div class="box span10 oh">
            <form action="/resource/system/role/daochuExcel" name="form1" method="post">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                  <input type="hidden" name="username" value="${loginname.loginname}">
                <tr>
				   <th> <input name="all"  type="checkbox"></th>
                   <th >角色名称</th>
                   <th >描述</th>
                   <th >状态</th>
				   <th>操作</th>
                    </tr>
                  <c:forEach items="${pi.list}" var="pi1" >
                <tr class="tr" align="center">
                   <td class="td_center"><input type="checkbox" name="single" value="${pi1.id}"></td>
                   <td><a href="/resource/system/role/lookrole?id=${pi1.id}">${pi1.name}</a></td>
                   <td>${pi1.remark}</td>
                   <td>${pi1.state == 0 ? '启用':'禁用'}</td>
				   <td>
				      <a href="/resource/system/role/edit?id=${pi1.id}&state=${pi1.state == 1 ? '0':'1'}&username=${loginname.loginname}&event='修改状态'">${pi1.state == 1 ? '启用':'禁用'}</a> |&nbsp;
					  <a href="/resource/system/role/readyedit?roleid=${pi1.id}">编辑</a> |&nbsp;
					  <a href="/resource/system/role/deleteone?roleid=${pi1.id}&username=${loginname.loginname}" onclick="del()">删除</a>
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
							  <fy:fy url="/resource/system/role/getallrole?rolename=${name}" pageInfo="${pi}"/>
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