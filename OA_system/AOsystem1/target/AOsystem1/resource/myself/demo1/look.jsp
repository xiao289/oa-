<!doctype html>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <div class="box_top"><b class="pl15">任务明细</b></div>
            <div class="box_center">
              <form action="list.jsp" class="jqtransform">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
			    <tr>
                  <td class="td_right">姓名：</td>
                  <td class="">${u.name}</td>
                 </tr>
                 <tr>
                 <tr>
                  <td class="td_right">部门</td>
                  <td class="">
                      ${dept.name}
                  </td>
				  </tr>
				  <tr>
                  <td class="td_right">开始时间：</td>
				  <td><fmt:formatDate value='${bean1.starttime}' pattern='yyyy-MM-dd'/></td>
                </tr>
				<tr>
                  <td class="td_right">结束时间：</td>
				  <td><fmt:formatDate value='${bean1.endtime}' pattern='yyyy-MM-dd'/></td>
                </tr>
					   <tr>
						  <td class="td_right">请假天数：</td>
						  <td class=""> 
							<c:if test="${bean1.typeall == 1}">${bean1.number}</c:if>
						    <c:if test="${bean1.typeall != 1}">${bean1.leavex.number}</c:if>
                          </td>
					  </tr>
					   <tr>
						  <td class="td_right">请假类型：</td>
						  <td class=""> 
							${bean1.leaveType.leavename}
						  </td>
					  </tr>
					   <tr>
						  <td class="td_right">请假事由：</td>
						  <td class=""> 
							${bean1.remark}
						  </td>
					  </tr>
				
                     <tr>
						  <td class="td_right">审批人：</td>
						  <td class=""> 
                                ${manager.name}
						  </td>
					  </tr><tr>
						  <td class="td_right">审核意见：</td>
						  <td class=""> 
							<%--<c:if test="${bean1.typeall == 1}">
                                <if test="${bean1.state == 1}">暂无审核</if>
                              &lt;%&ndash;  <if test="${bean1.state == 2}">审核通过</if>
                                <if test="${bean1.state == 3}">审核不通过</if>&ndash;%&gt;
                            </c:if>
                             <c:if test="${bean1.typeall != 1}">
                                 <if test="${bean1.leavex.state == 1}">暂无审核</if>
                                 <if test="${bean1.leavex.state == 2}">审核通过</if>
                                 <if test="${bean1.leavex.state == 3}">审核不通过</if>
                             </c:if>--%>
                              ${bean1.remark}
						  </td>
					  </tr>
					   <tr>
						  <td class="td_right">审批时间：</td>
						  <td class=""> 
							2018-11-4
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