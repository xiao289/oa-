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
            <div class="box_top"><b class="pl15">添加文件</b></div>
            <div class="box_center">
              <form action="/resource/wendang/demo1/toupload" class="jqtransform"  method="post" enctype="multipart/form-data" >
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">

                        <input type="hidden" name="pid" value="${id}">

                 <tr>
                  <td class="td_right">文件名称：</td>
                  <td class="">
                    <input type="text" name="name1" class="input-text lh30" size="40">
                  </td>
				  </tr>
                <tr >
                  <td class="td_right">路径：</td>
                  <td class="">
                    <input type="text" name="#" class="input-text lh30" size="40" readonly>
                  </td>
                 </tr>
				 <tr >
                  <td class="td_right">文件类型：</td>
                  <td class="">
                    <input type="text" name="type" class="input-text lh30" size="40"  readonly>
                  </td>
                 </tr>
				 <tr >
                  <td class="td_right">文件上传：</td>
                  <td class="">
                      <input type="file" name="uploadpath">
                  </td>
                 </tr>

				 <tr>
                  <td class="td_right">创建人：</td>
				  <td>
                      <input type="hidden" name="userid" value="${u1.id}">${u1.loginname}</td>
                </tr>
                   <input type="hidden" name="starttime"  id="today">

                   <script type="text/javascript">
                       function today(){
                           var today=new Date();
                           var h=today.getFullYear();
                           var m=today.getMonth()+1;
                           var d=today.getDate();
                           return h+"/"+m+"/"+d;
                       }

                       document.getElementById("today").value = today();
                   </script>
                 <tr>
                  <td class="td_right">备注：</td>
                  <td class="">
				  <textarea class="input-text lh30" name="remark"></textarea>
                  </td>
                 </tr>
                   <input type="hidden" name="isdelete" value="0">
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