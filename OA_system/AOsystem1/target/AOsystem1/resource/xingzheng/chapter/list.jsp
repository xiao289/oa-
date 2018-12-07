﻿<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
 <html >
 <head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="../../../css/common.css">
   <link rel="stylesheet" href="../../../css/main.css">
   <script type="text/javascript" src="../../../js/jquery.min.js"></script>
   <script type="text/javascript" src="../../../js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="../../../js/common.js"></script>
</head>
    <script type="text/javascript">
        $(function () {
            $("[name=button1]").click(function () {
                var utime=$("[name=utime]").val();
                var type=$("[name=type]").val();
                var adminid=$("[name=adminid]").val();
                if(utime==null||utime==""){
                    alert("申请时间不能为空！");
                }else{
                    if(type==-1){
                        alert("用章类型不能为空");
                    }else{
                        if(adminid==-1){
                            alert("下一步审批人不能为空");
                        }else{
                            $("[name=form1]").submit();
                        }
                    }
                }

            })
        })


    </script>
<body>
  <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">用章管理</b></div>
            <div class="box_center">
              <form action="/xingzheng/chapter/add" method="post" name="form1" class="jqtransform">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                  <td class="td_right">姓名：</td>
                  <td class=""> 
                   <input type="hidden" name="userid" value="${loginname.id}" readonly>${loginname.name}
                  </td>
				  </tr>
				  <tr>
                  <td class="td_right">申请时间：</td>
				  <td>
                      <input type="text" name="utime" class="input-text lh30" size="40">
                      （输入的时间格式为 1990/01/01 ）
                  </td>
                </tr>
				<tr>
                  <td class="td_right">部门：</td>
				  <td>
                     <c:forEach items="${loginname.depts}" var="dept">
                        <input type="hidden" name="deptid" readonly value="${dept.id}"/>${dept.name}
                     </c:forEach>
                  </td>
                </tr>
				
				<tr>
                  <td class="td_right">用章类型：</td>
				  <td><select name="type" class="input-text lh30">
                      <option value="-1">-请选择-</option>
				      <option value="1">公司公章</option>
                      <option value="2">财务用章</option>
                      <option value="3">人事用章</option>
				  </select></td>
                </tr>
                 <tr>
                  <td class="td_right">备注：</td>
				  <td><textarea name="remark" class="input-text lh30"></textarea></td>
                </tr>
				
				<tr>
                  <td class="td_right">下一步审批人：</td>
				  <td>
                      <select name="adminid" class="input-text lh30">
                          <option value="-1">请选择</option>
                          <c:forEach items="${admins}" var="admin">
                              <option value="${admin.id}">${admin.name}</option>
                          </c:forEach>
                      </select>
                  </td>
                </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="button" name="button1" class="btn btn82 btn_save2" value="确定">
                    <input type="button" name="button" class="btn btn82 btn_res" onclick="location.href='javascript:history.go(-1)'" value="返回"> 
                   </td>
                 </tr>
               </table>
               </form>
            </div>
          </div>
        </div>
     </div>
   </div> 
</body>

</html>