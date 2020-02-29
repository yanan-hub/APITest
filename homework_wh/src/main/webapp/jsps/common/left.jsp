<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>仓库管理系统 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script type="text/javascript">
        var path = "${pageContext.request.contextPath}"
        $(function () {
            var cid = $('#nav_list> li>.submenu');
            cid.each(function (i) {
                $(this).attr('id', "Sort_link_" + i);
            })
            $("#main-container").height($(window).height() - 76);
            $("#iframe").height($(window).height() - 140);
            $(".sidebar").height($(window).height() - 99);
            var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
            $(".submenu").height();
            $("#nav_list").children(".submenu").css("height", thisHeight);
            //当文档窗口发生改变时 触发
            $(window).resize(function () {
                $("#main-container").height($(window).height() - 76);
                $("#iframe").height($(window).height() - 140);
                $(".sidebar").height($(window).height() - 99);
                var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
                $(".submenu").height();
                $("#nav_list").children(".submenu").css("height", thisHeight);
            });
            $(document).on('click', '.iframeurl', function () {
                var cid = $(this).attr("name");
                var cname = $(this).attr("title");
                $("#iframe").attr("src", cid).ready();
                $("#Bcrumbs").attr("href", cid).ready();
                $(".Current_page a").attr('href', cid).ready();
                $(".Current_page").attr('name', cid);
                $(".Current_page").html(cname).css({"color": "#333333", "cursor": "default"}).ready();
                $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
                $("#parentIfour").html('').css("display", "none").ready();
            });
            $(document).on('click', '.link_cz > li', function () {
                $('.link_cz > li').removeClass('active');
                $(this).addClass('active');
            });

        });
        $(document).ready(function () {
            $('#nav_list,.link_cz').find('li.home').on('click', function () {
                $('#nav_list,.link_cz').find('li.home').removeClass('active');
                $(this).addClass('active');
            });

            function currentTime() {
                var d = new Date(), str = '';
                str += d.getFullYear() + '年';
                str += d.getMonth() + 1 + '月';
                str += d.getDate() + '日';
                str += d.getHours() + '时';
                str += d.getMinutes() + '分';
                str += d.getSeconds() + '秒';
                return str;
            }

            setInterval(function () {
                $('#time').html(currentTime)
            }, 1000);
        });

        function link_operating(name, title) {
            var cid = $(this).name;
            var cname = $(this).title;
            $("#iframe").attr("src", cid).ready();
            $("#Bcrumbs").attr("href", cid).ready();
            $(".Current_page a").attr('href', cid).ready();
            $(".Current_page").attr('name', cid);
            $(".Current_page").html(cname).css({"color": "#333333", "cursor": "default"}).ready();
            $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
            $("#parentIfour").html('').css("display", "none").ready();
        }




        /*退出*/
        function ovid1() {
            layer.confirm("是否确认退出？", {icon: 3, title: "确认框"}, function (index) {
                layer.close(index);
                $.ajax({
                    url: path + "/WhUser/cleanSession",
                    type: "post",
                    success: function (data) {
                        if (data) {
                            window.location.href = path + "/jsps/login.jsp";
                        } else {
                            alert("111");
                        }
                    },
                    error: function (data) {
                        alert("清session 404")
                    }
                });
            });
        }

    </script>
</head>
<style type="text/css">
    .menu-text .tooltip {
        background: #ffc711;
        bottom: 100%;
        color: #fff;
        display: block;
        margin-bottom: 15px;
        opacity: 0;
        padding: 10px;
        pointer-events: none;
        position: absolute;
        width: 200px;
        height: 40px;
        text-align: center;
        border-radius: 6px;
        z-index: 1;
        top: -5px;
        left: 110%;
        font-size: 14px;
        -webkit-transition: all .25s ease-out;
        -moz-transition: all .25s ease-out;
        -ms-transition: all .25s ease-out;
        -o-transition: all .25s ease-out;
        transition: all .25s ease-out;
        -webkit-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
        -moz-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
        -o-box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
        box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.28);
    }

    /* This bridges the gap so you can mouse into the tooltip without it disappearing */
    .menu-text .tooltip::after {
        content: " ";
        position: absolute;
        top: 50%;
        right: 100%; /* 提示工具左侧 */
        margin-top: -5px;
        border-width: 6px;
        border-style: solid;
        border-color: transparent #ffc711 transparent transparent;
    }

    .menu-text .tooltip {
        opacity: 1;
        pointer-events: auto;
        -webkit-transform: translateY(0px);
        -moz-transform: translateY(0px);
        -ms-transform: translateY(0px);
        -o-transform: translateY(0px);
        transform: translateY(0px);
        display: none;
    }
    .classId{
        height: 17px;
        width: 17px;
        line-height: 17px;
        border-radius: 50%;
        color: #0b3a58;
        display: inline-block;
        background-color: #0b6cbc;
        margin-top: 10px;
        text-align: center;
    }

</style>
<body style="overflow: hidden">
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>


    <%--标题--%>
    <div class="navbar-header" style="height: 50px;padding-top: 20px">
        <a class="navbar-brand" href="#">&nbsp;&nbsp;&nbsp;仓库管理系统</a>
    </div>

    <%--时间框--%>
    <div class="navbar-header pull-right" role="navigation">
        <ul class="nav ace-nav">
            <li class="light-blue">
                <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                    <span class="time"><em id="time"></em></span><span
                        class="user-info"><small>欢迎光临,</small>${user.username}</span>
                    <i class="icon-caret-down"></i>
                </a>
                <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                    <li><a href="javascript:ovid1()" id="Exit_system"><i class="icon-off"></i>退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

</div>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>



    <div class="main-container-inner" style="width: auto;">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed')
                } catch (e) {
                }
            </script>


            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <a class="btn btn-success">
                        <i class="icon-signal"></i>
                    </a>

                    <a class="btn btn-info">
                        <i class="icon-pencil"></i>
                    </a>

                    <a class="btn btn-warning">
                        <i class="icon-group"></i>
                    </a>

                    <a class="btn btn-danger">
                        <i class="icon-cogs"></i>
                    </a>
                </div>
                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>
                    <span class="btn btn-info"></span>
                    <span class="btn btn-warning"></span>
                    <span class="btn btn-danger"></span>
                </div>
            </div>
            <div id="menu_style" class="menu_style">
                <ul class="nav nav-list" id="nav_list">
                    <%--admin用户--%>
                    <c:if test="${user.username == 'admin'}">
                        <li style="z-index: 0;"><a href="#" class="dropdown-toggle"><i class="icon-group"></i><span
                                class="menu-text"> 用户管理 </span><b class="arrow icon-angle-down"></b></a>
                            <ul class="submenu">
                                <li class="home"><a href="javascript:userManagement1();" title="用户管理" class="iframeurl"><i
                                        class="icon-double-angle-right"></i>用户管理</a></li>
                            </ul>
                        </li>
                        <li style="z-index: 0;"><a href="#" class="dropdown-toggle"><i class="icon-group"></i><span
                                class="menu-text"> 货物管理 </span><b class="arrow icon-angle-down"></b></a>
                            <ul class="submenu">
                                <li class="home"><a href="javascript:categoryManagement1();" title="类别管理" class="iframeurl"><i
                                        class="icon-double-angle-right"></i>类别管理</a></li>
                                <li class="home"><a href="javascript:goodsManagement();" title="物品管理" class="iframeurl"><i
                                        class="icon-double-angle-right"></i>物品管理</a></li>
                            </ul>
                        </li>
                        <li style="z-index: 0;"><a href="#" class="dropdown-toggle"><i class="icon-group"></i><span
                                class="menu-text"> 审批管理 </span><b class="arrow icon-angle-down"></b></a>
                            <ul class="submenu">
                                <li class="home"><a href="javascript:shipmentApproval1();" title="出货审批" class="iframeurl"><i
                                        class="icon-double-angle-right"></i>出货审批</a></li>
                                <li class="home"><a href="javascript:chuHuoJiLu();" title="出货记录" class="iframeurl"><i
                                        class="icon-double-angle-right"></i>出货记录</a></li>
                            </ul>
                        </li>
                        <li style="z-index: 0;"><a href="#" class="dropdown-toggle"><i class="icon-group"></i><span
                                class="menu-text"> 数据统计 </span><b class="arrow icon-angle-down"></b></a>
                            <ul class="submenu">
                                <li class="home"><a href="javascript:statisticalChartT();" title="统计图" class="iframeurl"><i
                                        class="icon-double-angle-right"></i>统计图</a></li>
                            </ul>
                        </li>
                    </c:if>

					<%--其他用户--%>
					<c:if test="${user.username != 'admin'}">
						<li style="z-index: 0;"><a href="#" class="dropdown-toggle"><i class="icon-group"></i>
                            <span class="menu-text">
                                申请出货
                            </span>
                            <b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home"><a href="javascript:applicationShipment();" title="申请出货"
													class="iframeurl"><i class="icon-credit-card"></i>申请出货</a>
								</li>
                                <li class="home"><a href="javascript:applicationRecord1();" title="申请记录"
                                                    class="iframeurl"><i class="icon-credit-card"></i>申请记录</a>
                                </li>
							</ul>
						</li>
					</c:if>
                </ul>
            </div>
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'collapsed')
                } catch (e) {
                }
            </script>
        </div>
        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs" style="width: 1340px">
                <ul id="aa" class="nav nav-tabs breadcrumb" role="tablist" style="z-index: 0;">
                </ul>
            </div>
            <div class="tab-content">
            </div>
        </div>
    </div>
</div>



<!--底部样式-->
<div class="footer_style" id="footerstyle">
    <script type="text/javascript">try {
        ace.settings.check('footerstyle', 'fixed')
    } catch (e) {
    }</script>
    <p class="l_f">版权所有：北京工商管理专修学院数据云1901AYA</p>
    <p class="r_f">qq：18192111</p>
</div>
</body>
<style>
    #aa {
        border: none;
    }

    #aa a {
        text-decoration: none;
        border: none;
        background-color: whitesmoke;
    }
</style>
</html>