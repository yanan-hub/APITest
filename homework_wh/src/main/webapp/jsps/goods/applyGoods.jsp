<%--
  Created by IntelliJ IDEA.
  User: yangt
  Date: 2020/2/12
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/css/fileinput.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/js/fileinput.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/js/locales/zh.js"></script>
</head>
<script>
    $(function () {

        /*所属类别*/
        $.ajax({
            url:path+"/WhCategory/findAllWhCategoryName",
            type:"post",
            dataType:"json",
            success:function (data) {
                if(data != null){
                    for (var i = 0; i < data.length; i++) {
                        var cId = document.getElementById("cId");
                        cId.options.add(new Option(data[i].name,data[i].id))
                    }
                }
            },
            error:function (data) {
                alert("获取部门下拉列表404等错误")
            }
        });

        /*物品名称*/
        $.ajax({
            url:path+"/WhGoods/findAllGoods",
            type:"post",
            dataType:"json",
            success:function (data) {
                if(data != null){
                    for (var i = 0; i < data.length; i++) {
                        var goodsname1 = document.getElementById("goodsname");
                        goodsname1.options.add(new Option(data[i].goodsname,data[i].goodsname))
                    }
                }
            },
            error:function (data) {
                alert("获取下拉列表404等错误")
            }
        });


    })


    /*提交申请*/
    $("#sub").click(function () {
        layer.confirm("是否提交申请？",{icon:3,title:"确认框"},function (index) {
            layer.close(index)
            $.ajax({
                url:path+"/WhShipment/applicationForSubmission",
                type:"post",
                data:decodeURIComponent($("#applyGoodsFormId").serialize(),true),
                success:function (data) {
                    if(data){
                        layer.confirm("添加成功",{icon:1,title:"提示框"},function (index) {
                            layer.close(index)
                            window.location.reload();
                        })
                    }else{
                        layer.msg("失败")
                        window.location.reload();
                    }
                },
                error:function (data) {
                    layer.msg("添加计划404")
                }
            })
        })
    })
</script>
<body>
<form id="applyGoodsFormId" role="form" class="form-horizontal" onsubmit="return shangjiao()">
    <%--id--%>
    <div class="form-group" id="nsuc">
        <label class="col-sm-2 control-label">所属类别:</label>
        <div class="col-sm-4">
            <select id="cId" name="cid">
                <option value="0">---请选择---</option>
            </select>
        </div>
    </div>
    <div class="form-group"  id="csuc">
        <label class="col-sm-2 control-label">物品名称:</label>
        <%--<div class="col-sm-4">
            <input type="text" name="goodsname" id="goodsname" value=""><span id="goodsnameSpan"></span>
        </div>--%>
        <select id="goodsname" name="goodsname">
            <option value="0">---请选择---</option>
        </select>
    </div>
    <div class="form-group"  id="ssuc">
        <label class="col-sm-2 control-label">申请数量:</label>
        <div class="col-sm-4">
            <input type="text" id="number" name="number" value="" >
            <span id="numberSpan"></span>
        </div>
    </div>
    <div class="form-group"  id="esuc">
        <label class="col-sm-2 control-label">申请时间:</label>
        <div class="col-sm-4">
            <input type="text" id="addingTime" name="addingTime" value="" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });">
            <span id="addingTimeSpan"></span>
        </div>
    </div>

    <div style="margin-left: 250px ;padding-top: 20px">
        <div class="form-group">
            <div class="col-sm-2">
                <input id="sub" type="button" class="btn btn-primary" value="提交"/>
            </div>
        </div>
    </div>
</form>
</body>
</html>
