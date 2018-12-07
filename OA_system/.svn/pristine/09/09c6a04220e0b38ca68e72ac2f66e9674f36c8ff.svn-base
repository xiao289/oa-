<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">

    <link rel="stylesheet" href="css/login.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
	<title>后台登陆</title>
</head>
<body>
	<div id="login_top">
		<div id="welcome">
			欢迎使用OA系统
		</div>
		<div id="back">
			
		</div>
	</div>
	<div id="login_center">
		<div id="login_area">
			<div id="login_form">

				<form action="login" method="post" name="login">
					<div id="login_tip">
						用户登录&nbsp;&nbsp;UserLogin
					</div>
					<div><input type="text" name="loginname" id="name" class="username"><span></span></div>
					<div><input type="password" name="password" id="pass" class="pwd"><span></span></div>
					<div id="btn_area">
						<input type="button" name="button" id="sub_btn" onclick="doSubmit()" value="登&nbsp;&nbsp;录">&nbsp;&nbsp;
						<input type="text" name="yanzheng" class="verify">
						<img src="/getyanzheng" alt="" name="yanzheng" id="img" onclick="b()" width="80" height="40"><span></span>
					</div>
					<script type="text/javascript">
                        function b() {

                            document.getElementById("img").src="/getyanzheng?num="+Math.random();

                        }
					</script>
					<script type="text/javascript">
                        var ok1=false,ok2=false,ok3=false;
                        $(function () {
                            $("[name=loginname]").blur(function () {
                                var lname = $(this).val();

                                if (lname == "") {
                                   alert("用户名不能为空")
                                    ok1 = false;
                                } else {
                                    ok1 = true;
                                }
                            })
                            $("[name=password]").blur(function () {
                                var pname = $(this).val();

                                if (pname == "") {
                                   alert("密码不能为空")
                                    ok2 = false;
                                } else {
                                    ok2 = true;
                                }
                            })
                            $("[name=yanzheng]").blur(function () {
                                var yname = $(this).val();

                                if (yname == "") {
                                   alert("验证密码不能为空")
                                    ok3 = false;
                                } else {
                                    ok3 = true;
                                }
                            })

                        })
                        function doSubmit() {
                            if(ok1&&ok2&&ok3){
                                document.forms[0].submit();
                            }else{
                               alert("请检查你的用户名密码验证码是否为空")
                            }
                        }

					</script>

				</form>
			</div>
		</div>
	</div>
	<div id="login_bottom">
		版权所有
	</div>
</body>
</html>