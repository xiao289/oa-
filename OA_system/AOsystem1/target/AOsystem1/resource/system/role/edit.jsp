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
     var q1=0,q2=1;

     $(function () {
         $("[name=name]").blur(function () {
             var name = $(this).val();
             var name1 = $("[name=name1]").val();
             if (name == name1){

             } else{
             if (name == null || name ==''){
                 $("[name=name]").next().html("请输入值")
                 q2 = 0;
             } else {
                 $.ajax({
                     url:"/resource/system/menu/checkrolename",
                     data:"name="+name,
                     type:"post",
                     dataType:"text",
                     cache:false,
                     success:function (rs) {
                         if (rs == 'ok'){
                             q2 = 1;
                         } else {
                             q2 = 0;
                         }
                         $("[name=name]").next().html(rs);
                     }
                 })
                }
             }
         })
     })


     function tijiao() {
         var n = $("[name=remark]").val();


         if (n == null || n == ''){

             $("[name=remark]").next().html("请填写");
             q1=0;
         } else {
             q1 = 1;
             $("[name=remark]").next().html("√");
         }

         if (q1 == 1 && q2 == 1){
             document.forms[0].submit();
         } else{
             $("input[type='button'][name=button]").next().html("填写错误");

         }
     }

 </script>

<body>
  <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">编辑角色</b></div>
            <div class="box_center">
              <form action="/resource/system/role/editjuese" class="jqtransform">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                  <td class="td_right">角色名称：</td>
                  <td class="">
                      <input type="hidden" value="${role.id}" name="id">
                      <input type="hidden" value="${role.name}" name="name1">

                    <input type="text" name="name" class="input-text lh30" size="40" value="${role.name}"><span style="color: red"></span>
                  </td>
				  </tr>
				  <tr>
                  <td class="td_right">备注：</td>
				  <td> <textarea name="remark" id="" cols="30" rows="10" class="textarea">${role.remark}</textarea><span style="color: red"></span></td>
                </tr>
                 <tr>
                  <td class="td_right">状态：</td>
                  <td class="">
                    <input type="radio" name="status" value="0" ${role.state==0?'checked':''}> 启用
                    <input type="radio" name="status" value="1" ${role.state==1?'checked':''}> 禁用
                  </td>
                 </tr>
                   <script type="text/javascript">
                       function check1(r1) {
                           if ($("input[type='checkbox'][name=menuid][id="+r1+"]").attr("checked")){
                               $("input[type='checkbox'][name=menuid][class="+r1+"]").attr("checked",true);
                           }else{
                               $("input[type='checkbox'][name=menuid][class="+r1+"]").attr("checked",false);
                           }

                       }

                       function checkup(r2) {
                           var val = $("[class="+r2+"]");
                           for (var i = 0; i < val.length; i++){
                               if (val[i].checked){
                                   $("input[type='checkbox'][name=menuid][id="+r2+"]").attr("checked",true);
                                   break;
                               }else{
                                   $("input[type='checkbox'][name=menuid][id="+r2+"]").attr("checked",false);
                               }
                           }
                       }


                   </script>
                 
                <tr>
                  <td class="td_right">权限：</td>
                  <td class="">
                        <c:forEach items="${pi.list}" var="menu">
                            ${menu.pid == -1?'':'&nbsp;&nbsp;&nbsp;'}

					<input type="checkbox"
                           id="${menu.id}" class="${menu.pid}"
                           onclick="
                           <c:if test="${menu.pid == -1}">
                                   check1(${menu.id})
                           </c:if>
                           <c:if test="${menu.pid != -1}">
                                   checkup(${menu.pid})
                                   </c:if>"
                           name="menuid"  value="${menu.id}"
                            <c:forEach items="${menuid}" var="m1">
                        ${m1.menuid == menu.id?'checked':''}
                        </c:forEach>
                    >${menu.menuname}<br/>

                        </c:forEach>
				  </td>
                 </tr>

                   <input type="hidden" name="username" value="${loginname.loginname}">
                   <input type="hidden" name="event" value="修改角色">
                   <td class="td_right">备注：</td>
                   <td class="">
                       <textarea name="remark1" cols="30" rows="10" class="textarea">无</textarea>
                   </td>
                   </tr>

                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="button" onclick="tijiao()" name="button" class="btn btn82 btn_save2" value="保存">
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