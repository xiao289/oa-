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
            <div class="box_top"><b class="pl15">查看用户</b></div>
            <div class="box_center">
              <form action="list.jsp" class="jqtransform">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
			    <tr>
                  <td class="td_right">头像：</td>
                  <td class="">
                      <a href="#"><img src="/image/${user.photo}" height="60" width="60" ></a>
                  </td>
                 </tr>
                 <tr>
                 <tr>
                  <td class="td_right">登录名：</td>
                  <td class=""> 
                    ${user.loginname}
                  </td>
				  </tr>
				  <tr>
                  <td class="td_right">密码：</td>
				  <td>${user.password}</td>
                </tr>
					   <tr>
						  <td class="td_right">真实姓名：</td>
						  <td class="">
                              ${user.name}
						  </td>
					  </tr>
					   <tr>
						  <td class="td_right">身份证：</td>
						  <td class=""> 
							${user.idcard}
						  </td>
					  </tr>
					   <tr>
						  <td class="td_right">年龄：</td>
						  <td class=""> 
							${user.age}
						  </td>
					  </tr>
                                          <tr>
						  <td class="td_right">手机号：</td>
						  <td class=""> 
							${user.phone}
						  </td>
					  </tr>
				<tr>
                  <td class="td_right">性别：</td>
                  <td class="">
				  ${user.sex == 0?'男':'女'}
                  </td>
				  </tr>


                <tr >
                  <td class="td_right">机构/部门：</td>
                  <td class="">

                    <c:forEach items="${user.organizations}" var="org">
                        ${org.name}
                    </c:forEach>/
                    <c:forEach items="${user.depts}" var="dept">
                        ${dept.name}
                    </c:forEach></td>

                 </tr>
                 
				  
				  <tr >
                  <td class="td_right">职称：</td>
                  <td class=""> 
                       ${user.job}
                  </td>
                 </tr>
				  <tr >
                  <td class="td_right">角色：</td>
                  <td class="">
                      ${user.role.name}
                  </td>
                 </tr>
                 <tr>
                  <td class="td_right">状态：</td>
                  <td class="">
                      ${user.state==0?'可用':'冻结'}
                  </td>
                 </tr>
                 
               
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