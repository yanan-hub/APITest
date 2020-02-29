<%--
  Created by IntelliJ IDEA.
  User: yangt
  Date: 2020/2/5
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>

    $(function () {

        /*表格*/
        table1()

        var b = false;


        /*姓名非空验证*/
        $("#username").bind(aaa);


        /*密码非空验证*/
        $("#password").blur(bbb);



        /*电话号码非空验证*/
        $("#phonenumber").blur(ccc);



        /*点击确认添加用户按钮*/
        $("#addWhUserSave").bind("click",function () {
            if( addOnSubmitFunction()){

                addAndUpdateWhUserSave()

            }

        })

    })



    /*控制表单提交*/
    function addOnSubmitFunction() {
        if( aaa() && bbb()  && ccc()){
            return true;
        }else{
            return  false;
        }
    }



    var aaa= function  () {
        var a1;
        var username =  $("#username").val();
        if(username == null || username == ""){
            $("#usernameSpan").html("姓名不能为空")
            a1=false;
        }else{
            $("#usernameSpan").html("")
            a1=true;
        }
        return a1;
    };

    var bbb=function  () {
        var password =  $("#password").val();
        if(password == null || password == ""){
            $("#passwordSpan").html("密码不能为空")
            return false;
        }else{
            $("#passwordSpan").html("")
            return true;
        }
    }
    var ccc=function  () {
        var phonenumber =  $("#phonenumber").val();
        if(phonenumber == null || phonenumber == ""){
            $("#phonenumberSpan").html("电话号码不能为空")
            return false;
        }else{
            $("#phonenumberSpan").html("")
            return true;
        }
    }



    /*bootstrap表格*/
    function table1() {

        $("#WhUserFindAll").bootstrapTable("destroy");

        /*设置表格中的数据：上下居中*/
        $("#WhUserFindAll").addClass("text-center");

        $("#WhUserFindAll").bootstrapTable({
            url:path+"/WhUser/findAll",
            method:"post",
            contentType:"application/x-www-form-ur lencoded;charset=UTF-8",
            pagination:true,
            sidePagination:"client",
            pageNumber:1,
            pageSize:5,
            pageList:[3,5,10],
            columns:[
                {
                    field:'id',
                    title:'编号',
                    align:"center"
                },
                {
                    field:'username',
                    title:'用户名',
                    align:"center"
                },
                {
                    field:'password',
                    title:'密码',
                    align:"center"
                },
                {
                    field:'sex',
                    title:'性别',
                    align:"center",
                    formatter:function (index,rows,value) {
                        var obj = JSON.stringify(rows);
                        if(rows.sex == 1){
                            return "男"
                        }
                        if(rows.sex == 2){
                            return "女"
                        }
                    }
                },
                {
                    field:'phonenumber',
                    title:'手机号',
                    align:"center"
                },
                {
                    title:"操作",
                    align:"center",
                    formatter:function (index,rows,value) {
                        var obj = JSON.stringify(rows);
                        return  "<a href='javascript:updateWhUser("+obj+")' class='btn btn-default btn-sm'>修改</a>"+
                            "<a href='javascript:deleteWhUser("+rows.id+")' class='btn btn-danger'>删除</a>"
                    }
                }


            ]
        })
    }


    /*点击添加用户按钮*/
    function addWhUserButtonId() {
        $("#id").attr("value",null)
        $("#username").attr("value","")
        $("#password").attr("value","")
        $("#sex1").attr('checked',"")
        $("#sex2").attr('checked',"")
        $("#phonenumber").attr("value","")
        $("#title").html("添加用户")
        /*显示添加模态框*/
        $("#addWhUserDivId").modal("show");
    }

    /*点击添加、修改模态框确定按钮*/
   /* function addWhUserSave() {
        var id = $("#id").val();
        if(id != 0){
            layer.confirm("是否进行修改？",{icon:1,title:"提示框"},function (index) {
                layer.close(index);
                aUAjax()
            })
        }else{
            layer.confirm("是否添加新用户？",{icon:1,title:"提示框"},function (index) {
                layer.close(index);
                aUAjax()
            })
        }

    }*/
    function addAndUpdateWhUserSave() {
        var id = $("#id").val();
        if(id != 0){
            layer.confirm("是否进行修改？",{icon:1,title:"提示框"},function (index) {
                layer.close(index);
                aUAjax()
            })
        }else{
            layer.confirm("是否添加新用户？",{icon:1,title:"提示框"},function (index) {
                layer.close(index);
                aUAjax()
            })
        }
    }

    /*添加修改的ajax*/
    function aUAjax() {
        var id = $("#id").val();
        $.ajax({
            url:path+"/WhUser/addOrUpdateWhUser",
            type:"post",
            data:$("#addWhUserFormId").serialize(),
            dataType:"json",
            success:function (data) {
                if(data){
                    if(id != 0){
                        layer.confirm("修改成功",{icon:1,title:"提示框"},function (index) {
                            layer.close(index);
                            document.getElementById("addWhUserFormId").reset();
                            $("#addWhUserDivId").modal("hide");
                            table1();
                        })
                    }else{
                        layer.confirm("添加成功",{icon:1,title:"提示框"},function (index) {
                            layer.close(index);
                            document.getElementById("addWhUserFormId").reset();
                            $("#addWhUserDivId").modal("hide");
                            table1();
                        })
                    }
                }else{
                    if(id != null){
                        alert("修改失败")
                    }else{
                        alert("添加失败")
                    }
                }

            },
            error:function (data) {
                alert("404")
            }
        })
    }

    /*删除用户*/
    function deleteWhUser(id) {
        layer.confirm("是否删除？",{icon:1,title:"提示框"},function (index) {
            layer.close(index);
            $.ajax({
                url:path+"/WhUser/deleteWhUser",
                type:"post",
                data:{id:id},
                dataType:"json",
                success:function (data) {
                    if(data){
                        layer.confirm("删除成功",{icon:1,title:"提示框"},function (index) {
                            layer.close(index);
                            table1();
                        })
                    }else{
                        alert("删除失败")
                    }

                },
                error:function (data) {
                    alert("删除用户404")
                }
            })
        })

    }

    /*修改用户信息*/
    function updateWhUser(whuser) {
        $("#id").attr("value",whuser.id)
        $("#username").attr("value",whuser.username)
        $("#password").attr("value",whuser.password)
        if(whuser.sex == 1){
            $("#sex1").attr('checked',"checked")
        }
        if(whuser.sex == 2){
            $("#sex2").attr("checked",'checked')
        }
        $("#phonenumber").attr("value",whuser.phonenumber)
        $("#title").html("修改用户")
        $("#addWhUserDivId").modal("show");
    }

</script>
<style type="text/css">

    /*设置表格中的数据：上下居中*/
    .table tbody tr td{
        vertical-align: middle;
    }

</style>
<body>

<div  style="float: left;width: 1300px;">

    <div  style="float: left;width: 1300px;padding-top: 15px">
        <%--添加用户按钮--%>
        <button id="addWhUserButtonId" onclick="addWhUserButtonId()" type="button" style="float:left; background-color: #008CBA;color: white;padding: 10px 22px;font-size: 16px;">添加用户</button>
    <div>

    <div  style="float: left;width: 1300px;padding-top: 20px">
        <%--用户bootstrap全查--%>
        <table id="WhUserFindAll"></table>
     </div>

</div>
    <%--添加、修改用户模态框   开始--%>
    <div class="modal fade" id="addWhUserDivId">
        <form id="addWhUserFormId">
            <div class="modal-dialog">
                <div class="modal-content">
                    <%--隐藏id--%>
                    <input type="hidden" class="form-control" id="id" name="id">
                    <div class="modal-header">
                        <h4><span id="title">添加用户</span></h4>
                        <button class="close" data-dismiss="modal">x</button>
                    </div>
                    <div class="modal-body">
                        <label>用户名</label>
                        <input type="text" class="form-control" id="username" name="username">
                        <span id="usernameSpan"></span>
                    </div>
                    <div class="modal-body">
                        <label>密码</label>
                        <input type="password" class="form-control" id="password" name="password">
                        <span id="passwordSpan"></span>
                    </div>
                    <div class="modal-body">
                        <label>性别</label>
                        <input type="radio" id="sex1" name="sex" value="1">男
                        <input type="radio" id="sex2"  name="sex" value="2">女
                    </div>
                    <div class="modal-body">
                        <label>电话</label>
                        <input type="text" class="form-control" id="phonenumber" name="phonenumber">
                        <span id="phonenumberSpan"></span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="addWhUserSave" class="btn btn-primary">确定</button>
                      <%--  <button type="button" class="btn btn-primary" onclick="addWhUserSave()">确定</button>--%>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">返回</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <%--模态框结束--%>

</body>
</html>
