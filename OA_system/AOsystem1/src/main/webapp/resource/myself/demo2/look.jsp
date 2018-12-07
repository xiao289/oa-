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
</head>

<body>
  <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">查看通告</b></div>
            <div class="box_center">
              <form action="list.jsp" class="jqtransform">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                  <td class="td_right">标题：</td>
                  <td class=""> 
                    ${a1.title}
                  </td>
				  </tr>
				  <tr>
                  <td class="td_right">显示时间段：</td>
				  <td><fmt:formatDate value="${a1.starttime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                      &nbsp;&nbsp;   到 &nbsp;&nbsp;&nbsp;&nbsp;
                      <fmt:formatDate value="${a1.endtime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                  </td>
                </tr>
					   <tr>
						  <td class="td_right">发布时间：</td>
						  <td class="">
                              &nbsp;&nbsp;<fmt:formatDate value="${a1.suntime}" pattern="yyyy-MM-dd"></fmt:formatDate>
						  </td>
					  </tr>
					   <tr>
						  <td class="td_right">发布人：</td>
						  <td class=""> 
							${a1.user.name}
						  </td>
					  </tr>
					   <tr>
						  <td class="td_right">内容：</td>
						  <td class=""> 
							${a1.content}
						  </td>
					  </tr>
			
              
                 <tr>
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