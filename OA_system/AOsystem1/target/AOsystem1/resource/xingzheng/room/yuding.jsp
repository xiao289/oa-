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

  <script type="text/javascript">
    function del(){
	  confirm("确认删除");
	}
  </script>

     <script type="text/javascript">
         $(function () {

             var k=1;
             $("[name=all]").click(function () {
                 var singles=$("[name=roomids]");
                 for (var i=0;i<singles.length;i++){
                     singles[i].checked=$(this)[0].checked;
                 }

             });

            $("[name=submit1]").click(function () {
                var end = $("[name=endTime]").val();
                var start=$("[name=startTime]").val();
                var ids=$("[name=roomids]").val();
                var type=$("[name=type]").val();
                var admin=$("[name=adminid]").val();
                if(end==null||end==""||start==null||start==""||ids==null||type==-1||admin==null){
                    alert("内容不完整！！");
                }else{
                    if(k==1){
                        $("[name=form1]").submit();
                    }else{
                        alert("输入的时间有误，无法提交");
                    }
                }
            });

             $("[name=startTime]").blur(function () {
                 var start=$("[name=startTime]").val();
                 var date1= new Date(Date.parse(start.replace(/-/g, "/")));
                 var date=new Date();
                 if(date1.getTime()>date.getTime()){
                     k=1;
                 }else{
                     alert("输入的起始时间不能是过去事件啊");
                     k=2;
                 }
             });
             $("[name=endTime]").blur(function () {
                 var start=$("[name=startTime]").val();
                 var end=$(this).val();
                 var date1= new Date(Date.parse(start.replace(/-/g,  "/")));
                 var date2= new Date(Date.parse(end.replace(/-/g,  "/")));
                 if(date1.getDay()==date2.getDay()&&date1.getFullYear()==date2.getFullYear()&&date1.getMonth()==date2.getMonth()){
                     if(date1.getTime()>date2.getTime()){
                         alert("前面的时间不能大于后面的时间哦！");
                         k=2;
                     }else{
                         k=1;
                     }
                 }else{
                     alert("时间应是同一天");
                     k=2;
                 }
             });


         })

     </script>
</head>
<body>
<form action="/resource/xingzheng/room/addyuding" name="form1" method="post">
     <div id="search_bar" class="mt10">
       <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">会议室预定</b></div>
            <div class="box_center pt10 pb10">
              <table class="form_table" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td>预定时间段</td>
                  <td>
                      <input type="text" name="startTime" class="input-text lh25" size="10">to
                      <input type="text" name="endTime" class="input-text lh25" size="10">(预定时间段必须为同一天，时间请按照yyyy-MM-dd hh:mm:ss来输入)
				  </td>  
              </table>
            </div>
			</div>
       </div>
		
			

 <div id="table" class="mt10">
        <div class="box span10 oh">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
                   <th><input type="checkbox" name="all"/></th>
                   <th >会议室名称</th>
                   <th >会议室描述</th>

                  <c:forEach items="${page.list}" var="ro">
                </tr>
                      <tr class="tr" align="center">
                          <td class="td_center">
                              <input type="checkbox" name="roomids" value="${ro.id}">
                          </td>
                          <td>${ro.name}</td>
                          <td>${ro.remark}</td>
                      </tr>
                  <tr>
                  </c:forEach>

			   <td colspan="2">
                   会议室预定人:
                   <input type="hidden" name="userid" value="${loginname.id}"/>${loginname.name}
                   会议类型:&nbsp;
               <select class="input-text lh25" name="type">
                   <option value="-1">-请选择-</option>
                   <option value="1" <c:if test="${type==1}">selected</c:if>>会议</option>
                   <option value="2" <c:if test="${type==2}">selected</c:if> >面试</option>
                   <option value="3" <c:if test="${type==3}">selected</c:if>>培训</option>
                   <option value="4" <c:if test="${type==4}">selected</c:if> >会客</option>
                   <option value="5" <c:if test="${type==5}">selected</c:if> >其他</option>
               </select>

                   下一步审批人:&nbsp;
                   <select name="adminid" class="input-text lh25">
                       <option>-请选择-</option>
                       <c:forEach items="${users}" var="us" varStatus="sta">
                           <option value="${us.id}">${us.name}</option>
                       </c:forEach>
				   </select>
				  <input type="button" name="submit1"  class="input-text lh25"  value="预定">
				  <input type="button"  class="input-text lh25"  value="返回" onclick="location.href='javascript:history.go(-1)'">
				</td>


				<td colspan="5" align="right">
				     <div class="page mt10">
						<div class="pagination">
                            <p align="center">
                                <page:page pageSize="${size}" historical="" method=""
                                           url="/xingzheng/room/yuding"
                                           currentPage="${page.pageNum}" count="${page.total}"/>
                            </p>
						</div>
                     </div>
				</td>
			   </tr>
              </table>			  
		
             
        </div>
     </div>
     </div>
</form>
</body>
</html>