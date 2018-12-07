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

<body>
  <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">添加菜单</b></div>
            <div class="box_center">
              <form action="/resource/system/menu/edit1" class="jqtransform">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                  <td class="td_right">菜单名称：</td>
                  <td class="">
                        <input type="hidden" name="id" value="${menu.id}">
                    <input type="text" name="menuname" class="input-text lh30" size="40" value="${menu.menuname}">
                  </td>
				  </tr>
                <tr >
                  <td class="td_right">父级菜单：</td>
                  <td class="">
 
                    <span class="fl">
                      <div class="select_border"> 
                        <div class="select_containers "> 
                        <select name="pid" class="select">
						<option value="-1" <c:if test="${menu.pid == -1}">selected</c:if>>顶级菜单</option>
                       <c:forEach items="${up}" var="upm">
                           <option value="${upm.id}" <c:if test="${menu.pid == upm.id}">selected</c:if>>${upm.menuname}</option>
                       </c:forEach>
                        </select> 
                        </div> 
                      </div> 
                    </span>
                  </td>
                 </tr>

				 <tr>
                  <td class="td_right">路径：</td>
				  <td><input type="" name="url" class="input-text lh30" size="40" value="${menu.url}"></td>
                </tr>
                 <tr>
                  <td class="td_right">状态：</td>
                  <td class="">
                    <input type="radio" name="state" value="0" ${menu.state==0?'checked':''}  > 启用
                    <input type="radio" name="state" value="1" ${menu.state==1?'checked':''}> 冻结
                  </td>
                 </tr>

                        <input type="hidden" name="username" value="${loginname.loginname}">
                        <input type="hidden" name="event" value="修改菜单">
                        <tr>
                        <td class="td_right">备注：</td>
                        <td class="">
                        <textarea name="remark" cols="30" rows="10" class="textarea">无</textarea>
                        </td>
                        </tr>

                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="submit" name="button" class="btn btn82 btn_save2" value="保存"> 
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