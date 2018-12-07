﻿<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
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
            <div class="box_top"><b class="pl15">编辑文件夹</b></div>
            <div class="box_center">
              <form action="/resource/wendang/demo1/update" class="jqtransform">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                   <input type="hidden" name="id" value="${d1.id}">
                 <tr>
                  <td class="td_right">文件夹名称：</td>
                  <td class=""> 
                    <input type="text" name="name1" class="input-text lh30" size="40" value="${d1.name1}" >
                  </td>
				  </tr>
                <tr >
                  <td class="td_right">路径：</td>
                  <td class="">
                    <input type="text" name="url" class="input-text lh30" size="40" value="${d1.url}"  readonly>
                  </td>
                 </tr>

				 <tr>
                  <td class="td_right">创建人：</td>
				  <td>${d1.user.name}</td>
                </tr>
                 <tr>
                  <td class="td_right">备注：</td>
                  <td class="">
				  <textarea class="input-text lh30" name="remark">${d1.remark}</textarea>
                  </td>
                 </tr>
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