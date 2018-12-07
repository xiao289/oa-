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

     <script type="text/javascript"  >

         var oid=0,q1=1,q2=1,q3=1,q4=0,q5=0,q6=0,q7=1;

         $(function () {


             window.onload = function () {
                 var neid =$("[name=orgid]").val();
                 var depi =$("[name=dep]").val();

                 $.ajax({
                     url:"/resource/system/user/organizagetdept",
                     data:"oid="+neid,
                     type:"post",
                     dataType:"json",
                     success:function (rs) {
                         $("[name=deptid]")[0].length=0;
                         $("[name=deptid]")[0].add(new Option("请选择",-1));
                         for (var i = 0; i < rs.length; i++){
                             $("[name=deptid]")[0].add(new Option(rs[i].name,rs[i].id));
                         }
                            oid = 1;
                         $("#dep1").val(depi).selected = true;
                     }

                 })
             }



             

             $("[name=orgid]").change(function () {
                 oid = $(this).val();
                 if (oid == -1){
                     oid = 0;
                     alert("请您选择机构");
                     $("[name=deptid]")[0].length=0;
                     $("[name=deptid]")[0].add(new Option("请选择",-1));
                 }else{
                     $.ajax({
                         url:"/resource/system/user/organizagetdept",
                         data:"oid="+oid,
                         type:"post",
                         dataType:"json",
                         success:function (rs) {
                             $("[name=deptid]")[0].length=0;
                             $("[name=deptid]")[0].add(new Option("请选择",-1));
                             for (var i = 0; i < rs.length; i++){
                                 $("[name=deptid]")[0].add(new Option(rs[i].name,rs[i].id));
                             }
                         }
                     })
                 }
             })

             $("[name=loginname]").blur(function () {
                 var name1 = $(this).val();
                 var nq = $("[name=name12]").val();
                 if (name1 == nq){
                     q1=1;
                 } else{
                     if (name1 == null || name1 == ''){
                         q1=0;
                         $(this).next().html("老铁，好歹输一个字母啊!我不要交差得啊");
                     }else{
                         $.ajax({
                             url: "/resource/system/user/checkloginName",
                             data: "loginname="+name1,
                             type: "post",
                             dataType: "Text",
                             cache: false,
                             success: function (rs) {
                                 if (rs=='ok'){
                                     q1=1;
                                 } else {
                                     q1=0;
                                 }
                                 $("[name=loginname]").next().html(rs);
                             }
                         })
                     }
                 }


             })

             /*

        * 身份证15位编码规则：dddddd yymmdd xx p

        * dddddd：6位地区编码

        * yymmdd: 出生年(两位年)月日，如：910215

        * xx: 顺序编码，系统产生，无法确定

        * p: 性别，奇数为男，偶数为女

        *

        * 身份证18位编码规则：dddddd yyyymmdd xxx y

        * dddddd：6位地区编码

        * yyyymmdd: 出生年(四位年)月日，如：19910215

        * xxx：顺序编码，系统产生，无法确定，奇数为男，偶数为女

        * y: 校验码，该位数值可通过前17位计算获得

        *

        * 前17位号码加权因子为 Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ]

        * 验证位 Y = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ]

        * 如果验证码恰好是10，为了保证身份证是十八位，那么第十八位将用X来代替

        * 校验位计算公式：Y_P = mod( ∑(Ai×Wi),11 )

        * i为身份证号码1...17 位; Y_P为校验码Y所在校验码数组位置

       */
             $("[name=idcard]").blur(function(){
                 var birthday,gender,age,currDate,month,date;
                 var idCard = $("[name=idcard]").val();
                 //15位和18位身份证号码的正则表达式
                 var regIdCard=/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
                 //如果通过该验证，说明身份证格式正确，但准确性还需计算
                 if(regIdCard.test(idCard)){
                     if(idCard.length==18){
                         var idCardWi=new Array( 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ); //将前17位加权因子保存在数组里
                         var idCardY=new Array( 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ); //这是除以11后，可能产生的11位余数、验证码，也保存成数组
                         var idCardWiSum=0; //用来保存前17位各自乖以加权因子后的总和
                         for(var i=0;i<17;i++){
                             idCardWiSum+=idCard.substring(i,i+1)*idCardWi[i];
                         }
                         var idCardMod=idCardWiSum%11;//计算出校验码所在数组的位置
                         var idCardLast=idCard.substring(17);//得到最后一位身份证号码
                         //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
                         if(idCardMod==2){
                             if(idCardLast=="X"||idCardLast=="x"){
                                 q2=1;
                                 $("[name=idcard]").next().html("恭喜通过验证啦！")
                                 birthday = idCard.substring(6, 10) + "-" + idCard.substring(10, 12) + "-" + idCard.substring(12, 14);
                                 //三、计算年龄
                                 currDate = new Date();
                                 month = currDate.getMonth() + 1;
                                 date = currDate.getDate();
                                 age = currDate.getFullYear() - idCard.substring(6, 10);  	    //判断年龄  	    if (idNumber.substring(10, 12) < month || (idNumber.substring(10, 12) == month && idNumber.substring(12, 14) <= date)) {  	        age++;  	    }

                                 $("[name=age]").val(age);
                                 gender = parseInt(idCard.substr(16,1)%2);
                                 if (gender == 1){
                                     $("input[type='radio'][name=sex][value='0']").attr("checked",true);
                                     $("input[type='radio'][name=sex][value='0']").attr("readonly",true);
                                 }else{
                                     $("input[type='radio'][name=sex][value='1']").attr("checked",true);
                                     $("input[type='radio'][name=sex][value='1']").attr("readonly",true);
                                 }
                             }else{
                                 $("[name=idcard]").next().html("身份证号码错误！")
                             }
                         }else{
                             //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                             if(idCardLast==idCardY[idCardMod]){
                                 q2=1;
                                 $("[name=idcard]").next().html("恭喜通过验证啦！")

                                 //年龄
                                 birthday = idCard.substring(6, 10) + "-" + idCard.substring(10, 12) + "-" + idCard.substring(12, 14);
                                 //三、计算年龄
                                 currDate = new Date();
                                 month = currDate.getMonth() + 1;
                                 date = currDate.getDate();
                                 age = currDate.getFullYear() - idCard.substring(6, 10) ;  	    //判断年龄  	    if (idNumber.substring(10, 12) < month || (idNumber.substring(10, 12) == month && idNumber.substring(12, 14) <= date)) {  	        age++;  	    }

                                 $("[name=age]").val(age);

                                 //判断性别

                                 gender = parseInt(idCard.substr(16,1)%2);
                                 if (gender == 1){
                                     $("input[type='radio'][name=sex][value='0']").attr("checked",true);
                                     $("input[type='radio'][name=sex][value='0']").attr("readonly",true);
                                 }else{
                                     $("input[type='radio'][name=sex][value='1']").attr("checked",true);
                                     $("input[type='radio'][name=sex][value='1']").attr("readonly",true);
                                 }
                             }else{
                                 q2=0;
                                 $("[name=idcard]").next().html("身份证号码错误！")
                                 $("[name=age]").val(0);
                                 $("input[type='radio'][name=sex]").attr("checked",false);
                                 $("input[type='radio'][name=sex]").attr("readonly",false);
                             }
                         }
                     }
                 }else{
                     q2=0;
                     $("[name=idcard]").next().html("身份证格式不正确!")
                     $("[name=age]").val(0);
                     $("input[type='radio'][name=sex]").attr("checked",false);
                     $("input[type='radio'][name=sex]").attr("readonly",false);
                 }
             })

             $("[name=phone]").blur(function () {
                 let ph = $(this).val();
                 if (ph == null || ph == ''){
                     q7=0;
                     $("[name=phone]").next().html("请输入手机号")
                 } else{
                     var yanz = /^[1][3,4,5,7,8][0-9]{9}$/;
                     if (yanz.test(ph)){
                         q7 = 1;
                         $("[name=phone]").next().html("ok")
                     } else{
                         q7=0;
                         $("[name=phone]").next().html("请输入正确手机号")
                     }
                 }
             })

             $("[name=password]").blur(function () {
                 var pass = $(this).val();
                 var exp = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,21}$/;
                 if (pass != null && pass != ''){
                     if (pass.length < 8 || pass.length > 16){
                         $("[name=password]").next().html("密码长度不在8-16范围内");
                     } else{

                         if (exp.test(pass)){
                             q3=1;
                             $("[name=password]").next().html("√");
                         }else {
                             q3=0;
                             $("[name=password]").next().html("密码格式不正确，密码必须包含字母和数字且长度8-16位");
                         }
                     }

                 } else{
                     q3=0;
                     $("[name=password]").next().html("请输入密码");
                 }

             })

         })

         function tijiao() {
             var realname = $("[name=name]").val();
             if (realname != null && realname != ''){
                 q4 = 1;
             } else{
                 q4 = 0;
             }
             var orgid = $("[name=orgid]").val();
             if (orgid > 0){
                 q5 = 1;
             } else {
                 q5 = 0;
             }
             var dept = $("[name=deptid]").val();
             if (dept > 0){
                 q6 = 1;
             } else {
                 q6 = 0;
             }


             if (oid == 1 && q1 == 1 && q2 == 1 && q3 == 1 &&  q4 == 1 && q5 == 1 && q6 == 1 && q7 == 1) {

                 document.forms[0].submit();
                 // $("[name=button]").next().html("填写错误，注意修改");

             }else{
                 $("input[type=button][name=button123]").next().html("填写错误，注意修改");
             }
         }
     </script>
</head>

<body>
  <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">编辑用户</b></div>
            <div class="box_center">
              <form action="/resource/system/user/editstate" class="jqtransform" enctype="multipart/form-data" method="post">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                     <td class="td_right">登录名：</td>
                     <td class="">
                         <input type="hidden" name="id" value="${user.id}">
                         <input type="hidden" name="name12" value="${user.loginname}">
                         <input type="text" name="loginname" value="${user.loginname}" class="input-text lh30" size="40"><span style="color: red"></span>
                     </td>
                 </tr>
                   <tr>
                       <td class="td_right">密码：</td><td>
                       <input type="password" name="password" value="${user.password}" class="input-text lh30" size="40"><span style="color: red"></span>
                   </td>
                   </tr>
                   <tr>
                       <td class="td_right">真实姓名：</td>
                       <td class="">
                           <input type="text" name="name" value="${user.name}" class="input-text lh30" size="40"><span style="color: red"></span>
                       </td>
                   </tr>
                   <tr>
                       <td class="td_right">身份证：</td>
                       <td class="">
                           <input type="text" name="idcard" value="${user.idcard}" class="input-text lh30" size="40"><span style="color: red"></span>
                       </td>
                   </tr>
                   <tr>
                       <td class="td_right">年龄：</td>
                       <td class="">
                           <input type="text" name="age" value="${user.age}" class="input-text lh30" size="10">
                       </td>
                   </tr>
                   <tr>
                       <td class="td_right">手机号：</td>
                       <td class="">
                           <input type="text" name="phone" value="${user.phone}" class="input-text lh30" size="10"><span style="color: red"></span>
                       </td>
                   </tr>
                   <tr>
                       <td class="td_right">性别：</td>
                       <td class="">

                           <input type="radio" name="sex" ${user.sex == 0 ? 'checked':''}  id="sexman"  value="0"> 男
                           <input type="radio" name="sex" ${user.sex == 1 ? 'checked':''} id="sexwomen" value="1"> 女
                       </td>
                   </tr>

                <tr >
                  <td class="td_right">机构部门：</td>
                  <td class="">
 
                    <span class="fl">
                      <div class="select_border"> 
                        <div class="select_containers "> 
                        <select name="orgid"  class="select">
                          <option value="-1">选择机构</option>
                        <c:forEach items="${org}" var="o">
                            <option value="${o.id}" <c:if test="${user.orgid == o.id}">selected</c:if>>${o.name}</option>
                        </c:forEach>
                        </select> 
                        </div> 
                      </div> 
                    </span>&nbsp;&nbsp;&nbsp;
					 <span class="f2">
                      <div class="select_border"> 
                        <div class="select_containers ">
                            <input type="hidden" name="dep" value="${user.deptid}"/>
                        <select name="deptid" id="dep1" class="select">


                        </select> 
                        </div> 
                      </div> 
                    </span>
                  </td>
                 </tr>
                 
				  
				  <tr >
                  <td class="td_right">职称：</td>
                  <td class="">
 
                    <span class="fl">
                      <div class="select_border"> 
                        <div class="select_containers "> 
                        <select name="job" class="select">
                        <option ${user.job == '普通职员' ? 'selected':''}>普通职员</option>
                        <option ${user.job == '部门经理' ? 'selected':''}>部门经理</option>
						<option ${user.job == '助理' ? 'selected':''}>助理</option>
						<option ${user.job == '总监' ? 'selected':''}>总监</option>
                        </select> 
                        </div> 
                      </div> 
                    </span>
                  </td>
                 </tr>
				  <tr >
                  <td class="td_right">角色：</td>
                  <td class="">
 
                    <span class="fl">
                      <div class="select_border"> 
                        <div class="select_containers "> 
                        <select name="roleid" class="select">
                         <option value="-1">请选择</option>
                            <c:forEach items="${role}" var="role">
                                <option value="${role.id}" <c:if test="${user.roleid == role.id}">selected</c:if>>${role.name}</option>
                            </c:forEach>
                        </select> 
                        </div> 
                      </div> 
                    </span>
                  </td>
                 </tr>
                 <tr>
                  <td class="td_right">状态：</td>
                  <td class="">

                    <input type="radio" name="state" ${user.state == 0 ? 'checked':''} value="0"> 启用
                    <input type="radio" name="state" ${user.state == 1 ? 'checked':''} value="1"> 冻结
                  </td>
                 </tr>

                   <tr>
                       <td class="td_right">上传头像：</td>
                       <<input type="hidden" name="photo" value="${user.photo}">
                       <td class="">
                           <input type="file" name="photo1" value="" accept="image/png,image/jpeg" class="input-text lh30" size="10">
                       </td>
                   </tr>

                   <input type="hidden" name="username" value="${loginname.loginname}">
                   <input type="hidden" name="event" value="修改用户">
                   <tr>
                       <td class="td_right">备注：</td>
                       <td class="">
                           <textarea name="remark" hidden cols="30" rows="10" class="textarea">无</textarea>
                       </td>
                   </tr>

                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="button" name="button" onclick="tijiao()"   class="btn btn82 btn_save2" value="保存">
                    <input type="button" name="button123" class="btn btn82 btn_res" onclick="location.href='javascript:history.go(-1)'" value="返回"> <span style="color: red"></span>
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