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
<script type="text/javascript">

    $(function () {
        var k=1;
        $("[name=button1]").click(function () {
           var starttime= $("[name=starttime]").val();
            var phone= $("[name=phone]").val();
            var number= $("[name=number]").val();
            var remark= $("[name=remark]").val();
            var adminid= $("[name=adminid]").val();
            if(starttime==null||starttime==""){
                $("[name=starttime]").next().text("*申请时间不能为空");
            }else{
                if(phone==null||phone==""){
                    $("[name=phone]").next().text("*电话号码不能为空");
                }else{
                    if(number==null||number==""){
                        $("[name=number]").next().text("*数量不能为空");
                    }else{
                        if(remark==null||remark==""){
                            $("[name=remark]").next().text("*请添加备注");
                        }else{
                            if(adminid==-1){
                                $("[name=adminid]").next().text("*下一任审批人不能为空");
                            }else{
                                if(k==1){
                                    $("[name=form1]").submit();
                                }else{
                                    alert("手机号格式或者数量格式不正确");
                                }
                            }
                        }
                    }
                }
            }

        });
        
        $("[name=phone]").blur(function () {
            var phone=$(this).val();
            if(!(/^1[34578]\d{9}$/.test(phone))){
                alert("请输入正确的号码");
                k=2;
            }else{
                k=1;
            }
        });

        $("[name=number]").blur(function () {
            var num1=$(this).val();
            var num=/^[0-9]+.?[0-9]*$/;
            if(!num.test(num1)){
                alert("请输入数字");
                k=2;
            }else{
                k=1;
            }
        })
    })




</script>
<body>
  <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">名片印制流程</b></div>
            <div class="box_center">
              <form action="/xingzheng/card/addcard" name="form1" class="jqtransform">
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
                      <input type="text" name="starttime" class="input-text lh30" size="40"><span></span>
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
                  <td class="td_right">职务：</td>
				  <td>
                      <input type="text" name="job" readonly value="${role.name}"/>
                  </td>
                </tr>
				<tr>
                  <td class="td_right">手机号：</td>
				  <td><input type="text" name="phone" class="input-text lh30" size="40"></td><span></span>
                </tr>
				
                 <tr>
                  <td class="td_right">数量：</td>
				  <td><input type="text" name="number" class="input-text lh30" size="40"></td><span></span>
                </tr>
				<tr>
                  <td class="td_right">备注：</td>
				  <td><textarea name="remark" class="input-text lh30"></textarea></td><span></span>
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