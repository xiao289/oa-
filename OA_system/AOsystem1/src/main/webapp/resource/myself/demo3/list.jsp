﻿﻿<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
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
     <script type="text/javascript">
         var ok1=false,ok2=false,ok3=false;
         $(function () {
             $("[name=yuanname]").blur(function (){
                var uname=$(this).val();
                 if(uname=="${u1.password}"){
                     $(this).next().html("原密码正确")
                     ok1=true;
                 }else if(uname=="") {
                         $(this).next().html("原密码不能为空");
                          ok1=false;
                 }else{
                     $(this).next().html("原密码错误");
                     ok1=false;
                 }
             })
             //新密码
             $("[name=password]").blur(function () {
                 var xname=$(this).val();
                 //定义正则表达式
                   var name=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{3,18}$/;
                   if(name.test(xname)){
                     if(xname.length<=6){
                         $(this).next().html("密码一般");
                     }else if(xname.length>6 || xname.length<=18){
                         $(this).next().html("密码优秀");
                     }
                       ok2=true;
                   }else{
                       if(xname==""){
                           $(this).next().html("新密码不能为空");
                       }else {
                           $(this).next().html("新密码3-18为字母数字组合");
                       }
                       ok2=false;
                   }
             })
           //重复密码
             $("[name=querenname]").blur(function () {
                 var pname=$(this).val();
                 var xinname=$("[name=password]").val();
                 if(pname==xinname){
                     //alert("两次密码输入不一致请重新输入")
                     $(this).next().html("确认密码输入正确");
                     ok3=true;
                 }else if(pname==""){
                     $(this).next().html("确认密码不能为空");
                     ok3=false;

                 }else{
                     $(this).next().html("两次密码不一致");
                     ok3=false;
                 }
             })
         })
         function doSubmit() {
             if(ok1&&ok2&&ok3){
                 document.forms[0].submit();
             }else{
                 alert("填写信息有误");
             }
         }
     </script>
</head>
<body>
  <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">修改密码</b></div>
            <div class="box_center">
              <form action="/resource/myself/demo3/changepass" class="jqtransform">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                   <input type="hidden" name="id" value="${u1.id}" >
                 <tr>
                  <td class="td_right">原密码：</td>
                  <td class=""> 
                    <input type="password"  name="yuanname" class="input-text lh30" size="40"><span></span>
                  </td>
				  </tr>
				  <tr>
                  <td class="td_right">新密码：</td><td><input type="password" name="password"  class="input-text lh30" size="40"><span></span></td>
                </tr>
					   <tr>
						  <td class="td_right">确认密码：</td>
						  <td class=""> 
							<input type="password" name="querenname" class="input-text lh30" size="40"><span></span>
						  </td>
					  </tr>
			
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="button" onclick="doSubmit()" name="button" id="submit1"  class="btn btn82 btn_save2" value="保存">
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