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
	  $("[name=menuname1]").val("");
    document.forms[0].submit();
	}

	function delall(){
        var single=$("[name=single]");
        var  k = -1;
        for (var i = 0; i < single.length; i++){
        if (single[i].checked==true) {
                k = 2;
                $("[name=form1]").attr("action","/resource/system/user/deletemenus");
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
    <form action="/resource/system/menu/getallmenu" method="post">
            <div class="box_center pt10 pb10">
              <table class="form_table" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td>菜单名称</td>
                  <td><input type="text" name="menuname1" value="${menuname1}" class="input-text lh25" size="10"></td>


                   <td><input type="submit" name="button" class="btn btn82 btn_search" value="查询">
			    <input type="button" name="button" class="btn btn82 btn_recycle" value="清空" onclick="del()"></td>
                </tr>

              </table>
            </div>
    </form>
             <div  class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:center;" >

                 <a href="/resource/system/menu/addready" class="ext_btn"><span class="add"></span>添加菜单</a>
              </div>
            </div>
			</div>  </div>


 <div id="table" class="mt10">
        <div class="box span10 oh">
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
    <form action="/resource/system/menu/daochu" name="form1" method="post">

    <input type="hidden" name="username" value="${loginname.loginname}">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
				   <th> <input name="all" type="checkbox"></th>
                   <th >菜单名称</th>
                   <th >父菜单</th>
                   <th >路径</th>
				   <th>状态</th>
				   <th>操作</th>
                    </tr>



                    <c:forEach items="${pi.list}" var="upmenu">
                        <tr class="tr" align="center">
                        <td class="td_center"><input name="single"  value="${upmenu.id}" type="checkbox"></td>
                        <td><a href="/resource/system/menu/lookmenu?menuid=${upmenu.id}">${upmenu.menuname}</a></td>
                        <td>顶级菜单</td>
                        <td>无</td>
                        <td>${upmenu.state == 0 ?'启用':'禁用'}</td>
                        <td>
                        <a href="/resource/system/menu/edit1?id=${upmenu.id}&state=${upmenu.state == 1 ?'0':'1'}&username=${loginname.loginname}&remark='无'&event='修改菜单状态'">${upmenu.state == 1 ?'启用':'禁用'}</a> |&nbsp;
                        <a href="/resource/system/menu/editready?menuid=${upmenu.id}">编辑</a> |&nbsp;
                        <a href="/resource/system/menu/deleteone?id=${upmenu.id}&username=${loginname.loginname}&remark='无'&event='删除菜单'" >删除</a>
                        </td>
                        </tr>
                   <c:forEach items="${upmenu.lowmenu}" var="low">
                       <tr class="tr" align="center">
                       <td class="td_center"><input name="single" value="${low.id}" type="checkbox"></td>
                   <td><a href="/resource/system/menu/lookmenu?menuid=${low.id}">${low.menuname}</a></td>
                   <td>${upmenu.menuname}</td>
				   <td>${low.url}</td>
                   <td>${low.state == 0 ?'启用':'禁用'}</td>
				   <td>
				      <a href="/resource/system/menu/edit1?id=${low.id}&state=${low.state == 1 ?'0':'1'}&username=${loginname.loginname}&remark='无'&event='修改菜单状态'">${low.state == 1 ?'启用':'禁用'}</a> |&nbsp;
					  <a href="/resource/system/menu/editready?menuid=${low.id}">编辑</a> |&nbsp;
					  <a href="/resource/system/menu/deleteone?id=${low.id}&username=${loginname.loginname}&remark='无'&event='删除菜单'" >删除</a>
				   </td>
                 </tr>
                    </c:forEach>
                    </c:forEach>


               <tr>
			   <td colspan="2"><input type="button" name="button" class="btn btn82 btn_del" value="删除" onclick="delall()">
			    <input type="button" name="button"  class="btn btn82 btn_export" value="导出" onclick="daochu()">
				</td>
				<td colspan="5" align="right">
				     <div class="page mt10">
						<div class="pagination">
						  <ul >
							 <fy:fy url="/resource/system/menu/getallmenu?menuname1=${menuname1}" pageInfo="${pi}"/>
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