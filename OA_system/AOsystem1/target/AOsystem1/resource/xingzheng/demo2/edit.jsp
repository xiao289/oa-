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
        var re=false;
        function onblurss() {
            //获取车牌号
            var carid = $("#car").val();
            var ids=$("#id").val();
            if (carid != "") {
                //校验
                $.ajax({
                    url: "/resource/xingzheng/demo2/checkcarid2",
                    data: "carid=" + carid,
                    type: "post",
                    dataType:"json",
                    success: function (rs) {
                        if(rs.length!=0){
                            for(var i=0;i<rs.length;i++){
                                var k=rs[0].id;
                            }
                            if(ids==k){
                                //是同一辆车返回true
                               re=true;
                            }else {
                                //不是同一辆，但号牌相同，返回false
                                alert("本车牌号已被使用，不可用！");
                                re=false;
                            }
                        }else {
                            alert("本车牌号可用！");
                            re=true;
                        }
                    }
                });
            }else {
                alert("车牌号不能为空");
                re=false;
            }
        }

        function doSubmit(){

            var carid = $("#car");
            if(carid.val() == ""){
                document.getElementById("s1").innerHTML="车牌号不能为空";
                //alert("车牌号不能为空！");
                // name.focus();
                return false;
            }
            var type = $("#ty");
            if(type.val() == ""){
                document.getElementById("s1").innerHTML="车型不能为空";
                //alert("车型不能为空！");
                // name.focus();
                return false;
            }
            var color = $("#col");
            if(color.val() == ""){
                document.getElementById("s2").innerHTML="颜色不能为空";
                //alert("颜色不能为空！");
                // password.focus();
                return false;
            }
            //帐号校验
            onblurss();
            if(re){
                //提交表单
                document.forms[0].submit();
            }

        }
    </script>
    <style type="text/css">
        .ad{
            color: red;
        }
    </style>
</head>

<body>
<div id="forms" class="mt10">
    <div class="box">
        <div class="box_border">
            <div class="box_top"><b class="pl15">编辑车辆</b></div>
            <div class="box_center">
                <form action="/resource/xingzheng/demo2/updatecarbyid" class="jqtransform" method="post">
                    <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                        <input type="hidden" id="id" name="id" value="${car.id}"/>
                        <tr>
                            <td class="td_right">车牌号：</td>
                            <td class="">
                                <input type="text" id="car" onblur="onblurss()" name="carid" class="input-text lh30" size="40" value="${car.carid}">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_right">车型：</td>
                            <td><input type="" name="type" id="ty" class="input-text lh30" size="40" value="${car.type}"><span class="ad" id="s1"></span></td>
                        </tr>
                        <tr>
                            <td class="td_right">颜色：</td>
                            <td><input type="" name="color" id="col" class="input-text lh30" size="40" value="${car.color}"><span class="ad" id="s2"></span></td>
                        </tr>
                        <input type="hidden" name="username" value="${loginname.loginname}">
                        <input type="hidden" name="event" value="编辑车辆">
                        <tr>
                            <td class="td_right">备注：</td>
                            <td><textarea class="input-text lh30" name="remark" rows="20" cols="40">
                      <c:if test="${car.remark!=null}">${car.remark}</c:if>
                      <c:if test="${car.remark==null||car.remark==''}">无</c:if>
                  </textarea></td>
                        </tr>
                        <tr>
                            <td class="td_right">&nbsp;</td>
                            <td class="">
                                <input type="button" onclick="doSubmit()" name="button" class="btn btn82 btn_save2" value="保存">
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