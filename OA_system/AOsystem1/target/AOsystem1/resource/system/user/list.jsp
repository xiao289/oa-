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
    function del(){
        $("[name=username]").val("");
        $("[name=name]").val("");
        document.forms[0].submit();
	}
	function delall(){
        var single=$("[name=single]");
        var  k = -1;
        for (var i = 0; i < single.length; i++){
            if (single[i].checked==true) {
                k = 2;
                 $("[name=form1]").attr("action","/resource/system/user/deleteusers");
                document.forms[1].submit();
                break;
            }
        }
        if (k == -1){
            alert("请先选择删除得用户");
        }
	}
	function excel(){
	  confirm("确认导出");
	}
  </script>
</head>
<body>

     <div id="search_bar" class="mt10">
       <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">搜索</b></div>
            <div class="box_center pt10 pb10">
                <form action="/resource/system/user/getallUser" method="post">
              <table class="form_table" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td>姓名</td>
                  <td><input type="text" name="username" value="${loginname1}" class="input-text lh25" size="10"></td>

                  <td>真实姓名</td>
                  <td><input type="text" name="name" value="${realname}" class="input-text lh25" size="10"></td>
                   <td><input type="submit" name="button" class="btn btn82 btn_search" value="查询">
			    <input type="button" name="button" class="btn btn82 btn_recycle" onclick="del()" value="清空"></td>
                </tr>
              </table>
                </form>
            </div>

             <div  class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:center;" >

                 <a href="/resource/system/readyuseradd" class="ext_btn"><span class="add"></span>添加用户</a>
              </div>
            </div>
			</div>
       </div>
     </div>
			</form>


     <script type="text/javascript">
         function daochu() {
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
                 alert("请先选择导出得班级");
             }
         }


     </script>


     <script type="text/javascript">
         $(function () {
             $("[name=all]").click(function () {
                 var single=$("[name=single]");
                 for (var i = 0; i < single.length; i++){
                     single[i].checked=$(this)[0].checked;
                 }
             })
         })
     </script>
     <form action="/resource/system/user/daochu" name="form1" method="post">

 <div id="table" class="mt10">
        <div class="box span10 oh">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">

                  <input type="hidden" name="username" value="${loginname.loginname}">
                <tr>
				   <th> <input name="all" type="checkbox"></th>
                   <th >用户名</th>
                   <th >真实姓名</th>
                   <th >角色</th>
                   <th>机构/部门</th>
				   <th>状态</th>
				   <th>操作</th>
                    </tr>

                  <c:forEach items="${pi.list}" var="uu">
                  <tr class="tr" align="center">
                   <td class="td_center">

                       <input name="single" value="${uu.id}" type="checkbox">
                   </td>
                   <td><a href="/resource/system/user/lookuser?id=${uu.id}">${uu.loginname}</a></td>
                   <td>${uu.name}</td>
                   <td>${uu.role.name}</td>

				   <td><c:forEach items="${uu.organizations}" var="org">
                       ${org.name}
                   </c:forEach>
                       /
                       <c:forEach items="${uu.depts}" var="dept">
                           ${dept.name}
                       </c:forEach></td>
                   <td>
                           ${uu.state==0?'可用':'冻结'}

                   </td>
				   <td>
				      <a href="#">
                          <a href="/resource/system/user/editstate?id=${uu.id}&state=${uu.state==0?'1':'0'}&username=${loginname.loginname}">
                              <c:if test="${uu.loginname != loginname.loginname}">${uu.state==0?'禁用':'启用'}|&nbsp;</c:if>
                          </a>
                          </a>
                       <a href="/resource/system/user/readyedituser?userid=${uu.id}">编辑</a>
					  <a href="/resource/system/user/deleteuser?userid=${uu.id}&username=${loginname.loginname}" onclick="del()">
                          <c:if test="${uu.loginname != loginname.loginname}">|&nbsp;删除</c:if>
                          </a>
				   </td>
                 </tr>

                  </c:forEach>

               <tr>
			   <td colspan="2"><input type="button" name="button" class="btn btn82 btn_del" value="删除" onclick="delall()">
			    <input type="button" name="button"  class="btn btn82 btn_export"  value="导出" onclick="daochu()">
				</td>
				<td colspan="5" align="right">
				     <div class="page mt10">
						<div class="pagination">
						  <ul >
                              <fy:fy url="/resource/system/user/getallUser?username=${loginname1}&name=${realname}" pageInfo="${pi}"/>
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