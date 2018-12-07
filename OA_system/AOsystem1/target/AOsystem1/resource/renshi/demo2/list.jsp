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
     <script>
         re=false
         function onblur1() {
             var now=new Date().getTime();
             var time1 =new Date($("#time1").val()).getTime();
             var time2 =new Date($("#time2").val()).getTime();
             if(time1>=time2){
                 alert("结束时间必须在出差开始时间之后");
                 re=false;
             }else if(time1<now){
                alert("预约时间需在今天之后");
                re2=false;
            }else {
                 re=true;
             }
         }


         function doSubmit() {
             var time_1 = $("#time1");
             var time_2 = $("#time2");
             if(time_1.val() == ""||time_2.val()==""){
                 alert("时间不能为空！");
                 // name.focus();
                 return false;
             }

             var adr=$("#adr");
             if(adr.val()==""){
                 alert("出差地点不能为空");
                 return false;
             }

             var ty=$("#type");
             if(ty.val()==0){
                 alert("请选择交通类型");
                 return false;
             }

             var reson=$("#reson");
             if(reson.val()==""){
                 alert("出差事由不能为空");
                 return false;
             }

             var money=$("#money");
             var reg=new RegExp("^[1-9]\\d*(\\.\\d+)?$");
             if(money.val()==""||money.val()==null){
                 alert("借款金额不能为空");
                 return false;
             }else if(!reg.test(money.val())){
                 alert("借款金额格式错误，应为大于0的整数");
                 return false;
             }

             var pe=$("#people");
             if(pe.val()==0){
                 alert("请选择审批人");
                 return false;
             }

             onblur1();
             if (re){
                 document.forms[0].submit();
             }
         }
     </script>
</head>

<body>
  <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">出差申请</b></div>
            <div class="box_center">
              <form action="/resource/renshi/demo2/addtrip" class="jqtransform" method="post">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                  <td class="td_right">姓名：</td>
                     <input type="hidden" name="userid" value="${u1.id}">
                  <td class=""> 
                    ${u1.name}
                  </td>
				  </tr>
				  <tr>
                  <td class="td_right">部门：</td>
                            <input type="hidden" name="deptid" value="${dlist.id}">
                  <td class=""> 
                    ${dlist.name}
                  </td>
				  </tr>
				  <tr>
                  <td class="td_right">出差时间：</td>
				  <td><input id="time1" type="" name="starttime" class="input-text lh30" size="40" placeholder="2018/1/1">to
				  <input id="time2" onblur="onblur1()" type="" name="endtime" class="input-text lh30" size="40" placeholder="2018/1/1"></td>
                </tr>
				<tr>
                  <td class="td_right">出差地点：</td>
				  <td><input id="adr" type="" name="address" class="input-text lh30" size="40"></td>
                </tr>
				<tr>
                  <td class="td_right">交通工具：</td>
				  <td><select id="type" name="type" class="input-text lh30">
                      <option value="0">请选择</option>
                      <c:forEach items="${trafficlist}" var="list">
                      <option value="${list.trafficid}">${list.trafficname}</option>
                      </c:forEach>
				  </select></td>
                </tr>
                   <input type="hidden" name="username" value="${loginname.loginname}">
                   <input type="hidden" name="event" value="出差申请">
				<tr>
                  <td class="td_right">出差事由：</td>
				  <td><textarea id="reson" name="remark" class="input-text lh30"></textarea></td>
                </tr>
				<tr>
                  <td class="td_right">工作任务：</td>
				  <td><textarea id="task" name="work" class="input-text lh30"></textarea></td>
                </tr>
				<tr>
                  <td class="td_right">借款金额：</td>
				  <td><input id="money" type="" name="money" class="input-text lh30" size="40"><span>元/RMB</span></td>
                </tr>
				
				<tr>
                  <td class="td_right">下一步审批人：</td>
				  <td><select id="people" name="adminid" class="input-text lh30">
                      <option value="0">请选择</option>
                      <c:forEach items="${admins}" var="admin">
                          <option value="${admin.id}">${admin.name}</option>
                      </c:forEach>
                  </select></td>
                </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="button" onclick="doSubmit()" name="button" class="btn btn82 btn_save2" value="确定">
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