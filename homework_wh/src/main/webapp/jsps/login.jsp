<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/styles1.css"/>
    <script src="${pageContext.request.contextPath}/static/assets/js/ace-extra.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/login.js" type="text/javascript"></script>

    <title>登陆</title>
</head>
<script>
	var path="${pageContext.request.contextPath}";
</script>
<body class="login-layout Reg_log_style">
<div class="logintop">
    <span>仓库管理系统</span>
    <ul>
        <li><a href="#">返回首页</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>
<div class="loginbody">
    <div class="login-container">
        <div class="center">

        </div>

        <div class="space-6"></div>

        <div class="position-relative">
            <div id="login-box" class="login-box widget-box no-border visible">
                <div class="widget-body">
                    <div class="widget-main">
                        <h4 class="header blue lighter bigger">
                            <i class="icon-coffee green"></i>
                            管理员登陆
                        </h4>

                        <div class="login_icon"><img src="${pageContext.request.contextPath}/static/images/login.png"/>
                        </div>

                        <form id="login_form">
                            <fieldset>
                                <ul>
                                    <li class="frame_style form_error">
                                        <label class="user_icon"></label>
                                        <input name="username" type="text" id="username"/><i class="usernameIdI">用户名github</i></li>
                                    <li class="frame_style form_error">
                                        <label class="password_icon"></label>
                                        <input name="password" type="password" id="password"/><i class="passwordIdI">密码</i><span class="passwordSpan"></span></li>

                                </ul>
                                <div class="space"></div>

                                <div class="clearfix">

                                    <button type="button" class="width-35 pull-right btn btn-sm btn-primary"
                                            id="login_btn">
                                        <i class="icon-key"></i>
                                        登陆
                                    </button>
                                </div>

                                <div class="space-4"></div>
                            </fieldset>
                        </form>

                        <div class="social-or-login center">
                            <span class="bigger-110">通知</span>
                        </div>

                        <div class="social-login center">
                            本网站系统不再对IE8以下浏览器支持，请见谅。
                        </div>
                    </div><!-- /widget-main -->

                    <div class="toolbar clearfix">


                    </div>
                </div><!-- /widget-body -->
            </div><!-- /login-box -->
        </div><!-- /position-relative -->
    </div>
</div>
<div class="loginbm">版权所有 2018 <a href="">北京工商管理专修学院</a></div>
<strong></strong>
</body>
</html>