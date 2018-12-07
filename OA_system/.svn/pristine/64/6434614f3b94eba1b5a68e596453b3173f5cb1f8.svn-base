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
   <script type="text/javascript" src="../../../js/jquery-1.4.2.min.js"></script>
</head>



     <script type="text/javascript">
         $(function () {
            $("[name=name]").blur(function () {
                var names=$(this).val();
                $.ajax({
                    url:"/xingzheng/room/yanzheng",
                    data:"roomname="+names,
                    type:"post",
                    dataType:"text",
                    success:function (rs) {
                        document.getElementById("span1").innerText=rs;
                    }
                 })
            });


            $("[name=button1]").click(function () {
                var name=$("[name=name]").val();
                var remark=$("[name=remark]").val();
                if(name==null||name==""){
                    alert("会议室名称不能为空！！！");
                }else if(remark==null||remark==""){
                        alert("会议室描述不能为空！！！");
                    }else{
                        document.forms[0].submit();
                    }

            });


         })





    </script>


<body>
  <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">添加会议室</b></div>
            <div class="box_center">
              <form action="/xingzheng/room/add" class="jqtransform" method="post">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                  <td class="td_right">会议室名称：</td>
                  <td class=""> 
                    <input type="text" name="name" class="input-text lh30" size="40">
                      <span id="span1"></span>
                  </td>
				  </tr>
				  <tr>
                  <td class="td_right">会议室描述：</td>
				  <td><input type="text" name="remark" class="input-text lh30" size="40"></td>
                </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="button" name="button1" class="btn btn82 btn_save2" value="保存">
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