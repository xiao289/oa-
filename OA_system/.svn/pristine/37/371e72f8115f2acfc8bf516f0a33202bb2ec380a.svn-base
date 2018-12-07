<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fy" uri="http://java.sun.com/jsp/femye/fy" %>
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
      var q1= 0;
      function muban() {
          if (q1 == 0){
              q1 = 1;
              $("[name=shijian1]").val("2018-01-01 00:00:00");
              $("[name=shijian2]").val("2018-12-31 23:59:59");
          } else {
              q1 = 0;
              $("[name=shijian1]").val("");
              $("[name=shijian2]").val("");
          }

      }

    function del(){
        $("[name=usern]").val("");
        $("[name=shijian2]").val("");
        $("[name=shijian1]").val("");
        document.forms[0].submit();
	}
	function delall(){
	  confirm("确认删除");
	}
	function excel(){
	  var b = confirm("确认导出");
	  if (b == true) {
          var single=$("[name=single]");
          var  k = -1;
          for (var i = 0; i < single.length; i++){
              if (single[i].checked==true) {
                  k = 2;
                  document.forms[1].submit();
                  break;
              }
          }
          if (k == -1){
              alert("请先选择导出得日志");
          }
      }

	}
  </script>
</head>
<body>

     <div id="search_bar" class="mt10">
       <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">搜索</b></div>
            <div class="box_center pt10 pb10">
                <form action="/resource/system/log/listlog" method="post">

                    <script type="text/javascript">
                        var q1=0,q2=0;

                        function tijiao() {

                                var val2 = $("[name=shijian2]").val();
                                var val1 = $("[name=shijian1]").val();
                                if (val2 != null && val2 != ''){
                                    val2 =  val2.replace(/[-]/g,'');
                                    val2 =  val2.replace(/[/]/g,'');
                                    val2 = val2.replace(/[ ]/g,'');
                                }

                                if (val1 == null || val1 == ''){
                                    q1=0;
                                } else {
                                    q1=1;
                                }
                                if(val1 == null || val1 == ''){
                                    q2=0;
                                }else {
                                    q2=1;
                                }


                               if (q1 == 1 || q2 == 1){

                                if (val1 == null || val1 == ''){
                                    val1 = val1.replace(/[-]/g,'');
                                    val1 = val1.replace(/[/]/g,'');
                                    val1 = val1.replace(/[ ]/g,'');
                                    if (val2.length> 7){
                                        document.forms[0].submit();
                                    } else {
                                        $("input[type=button][name=button45][id=co]").next().html("输入时间至少包含四位年份且纯数字位数不小于8");
                                    }
                                } else {
                                    if (val1.length > 7) {
                                        if (val2 == null || val2 == ''){
                                            document.forms[0].submit();
                                        } else{
                                            if (val2.length > 7){
                                                if(val2 > val1){
                                                    document.forms[0].submit();
                                                }else {
                                                    $("input[type=button][name=button45][id=co]").next().html("第二时间点应第一时间点之后，注意修改");
                                                }
                                            } else{
                                                $("input[type=button][name=button45][id=co]").next().html("第二时间段输入时间至少包含四位年份且纯数字位数不小于8");
                                            }
                                        }
                                    }else {
                                        $("input[type=button][name=button45][id=co]").next().html("输入时间至少包含四位年份且纯数字位数不小于8");
                                    }
                                }
                               } else {
                                   document.forms[0].submit();
                               }
                        }

                    </script>


              <table class="form_table" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td>用户名</td>
                  <td><input type="text" name="usern" value="${username}" class="input-text lh25" size="10"></td>
                   <td><a onclick="muban()" href="#"> 时间段 <span style="color: #575dff;font-size: 3px" >(点击这里填充时间模板)</span> </a></td>
                  <td><input type="text" value="${shijain1}" name="shijian1" class="input-text lh25" size="20">to
				  <input type="text" value="${shijain2}" name="shijian2" class="input-text lh25" size="20"></td>
                  
                   <td><input type="button" name="button23" onclick="tijiao()" class="btn btn82 btn_search" value="查询">
			    <input type="button" name="button45" id="co" class="btn btn82 btn_recycle" onclick="del()" value="清空"><span style="color: red"></span> </td>
                </tr>
               
              </table>
                </form>
            </div>
        
         
			</div>  </div>

         <script type="text/javascript">


             $(function () {
                 $("[name=all]").click(function () {
                     var single=$("[name=single]");
                     for (var i = 0; i < single.length; i++){
                         single[i].checked=$(this)[0].checked;
                     }
                 })
             })
         </script>

 <div id="table" class="mt10">
        <div class="box span10 oh">
            <form action="/resource/system/log/daochuexcel" method="post">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">

                <tr>
                    <input type="hidden" name="username" value="${loginname.loginname}">
				   <th> <input name="all" type="checkbox"></th>
                   <th >用户名称</th>
                   <th >角色</th>
                   <th >事件</th>
				   <th>备注</th>
				   <th>操作时间</th>
                    </tr>

                  <c:forEach items="${pi.list}" var="log" >


                <tr class="tr" align="center">
                   <td class="td_center"><input name="single" value="${log.id}" type="checkbox"></td>
                   <td>${log.username}</td>
                   <td>${log.rolename}</td>
				   <td>${log.event}</td>
                   <td>${log.remark}</td>
				   <td><fmt:formatDate value="${log.updatetime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                 </tr>

                  </c:forEach>



                
               <tr>
			   <td colspan="2">
			    <input type="button" name="button"  class="btn btn82 btn_export" value="导出" onclick="excel()">
				</td>
				<td colspan="5" align="right">
				     <div class="page mt10">
						<div class="pagination">
						  <ul >
							  <fy:fy url="/resource/system/log/listlog?usern=${username}&shijian1=${shijain1}&shijian2=${shijain2}" pageInfo="${pi}"/>
						  </ul>
						</div>
                     </div>
				</td>
			   </tr>
              </table>
            </form>
             
        </div>
     </div>

</body>
</html>