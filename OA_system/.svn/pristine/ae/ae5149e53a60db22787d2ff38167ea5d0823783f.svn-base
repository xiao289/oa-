<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
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
            <div class="box_top"><b class="pl15">查看角色</b></div>
            <div class="box_center">
              <form action="list.jsp" class="jqtransform">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                  <td class="td_right">角色名称：</td>
                  <td class=""> 
                    ${role.name}
                  </td>
				  </tr>
				  <tr>
                  <td class="td_right">备注：</td>
				  <td> ${role.remark}</td>
                </tr>
                 <tr>
                  <td class="td_right">状态：</td>
                  <td class="">
                     ${role.state==0?'启用':'禁用'}
                  </td>
                 </tr>
                 
                <tr>
                  <td class="td_right">权限：</td>
                  <td class="">
                      <c:forEach items="${menu.list}" var="menus" varStatus="a">
                          <c:forEach items="${middle}" var="mi" varStatus="b">
                              <c:if test="${mi.menuid == menus.id}" >
                                  <c:if test="${b.count % 5 == 1}"><br></c:if>
                                  <c:if test="${b.count % 5 != 1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
                                  ${menus.menuname}</c:if>
                          </c:forEach>
                      </c:forEach>




				  </td>
                 </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                    
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