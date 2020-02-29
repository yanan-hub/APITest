$(function () {

    /*用户名输入框  字 隐藏*/
    $("#username").mousedown(function () {
        $(".usernameIdI").html("");
    });

    /*密码输入框  字 隐藏*/
    $("#password").mousedown(function () {
        $(".passwordIdI").html("");
    });



    /*用户名、密码确认*/
    $("#password").blur(function () {
        var username=$("#username").val();
        var password=$("#password").val();
        $.ajax({
            url:path+"/WhUser/queryWhUser",
            type:"post",
            data:{
                username:username,
                password:password
            },
            success:function (data) {
                if (data != null) {
                    if(data){
                        $(".passwordSpan").html("");
                    }else{
                        $(".passwordSpan").html("密码错误");
                    }
                }else{
                    alert("没有此用户")
                }
            },
            error:function (data) {
                alert("用户404")
            }
        });
    });

    /*登录*/
    userlogin();

});

function userlogin() {
    /*登录*/
    $("#login_btn").bind("click",function () {
        var username=$("#username").val();
        var password=$("#password").val();
        $.ajax({
            url:path+"/WhUser/login",
            type:"post",
            dataType:"json",
            data:{
                username:username,
                password:password
            },
            success:function (data) {
                if (data != null) {
                    /*js存session*/
                    /*将对象转换为Json字符串*/
                    /*var user = JSON.stringify(data);*/
                    /*存储值*/
                  /*  sessionStorage.setItem("user",user);*/

                    layer.confirm("登录成功",{icon:1,title:"提示框"},function (index) {
                        layer.close(index);
                        window.location.href=path+"/jsps/usermanager.jsp";
                    })
                }else{
                    alert("登录失败")
                }
            },
            error:function (data) {
                alert("登录404")
            }
        });
    });
}