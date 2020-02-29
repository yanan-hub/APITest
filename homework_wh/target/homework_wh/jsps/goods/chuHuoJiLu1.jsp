<%--
  Created by IntelliJ IDEA.
  User: yangt
  Date: 2020/2/13
  Time: 0:02
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

        tableGoods3();

    })

    /*bootstrap表格*/
    function tableGoods3() {

        $("#chuHuoJiLuTable1").bootstrapTable("destroy");

        /*设置表格中的数据：上下居中*/
        $("#chuHuoJiLuTable1").addClass("text-center");

        $("#chuHuoJiLuTable1").bootstrapTable({
            url:path+"/WhShipment/findAllApprovalGoodsByPass",
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
                    field:'whCategory.name',
                    title:'所属类别',
                    align:"center"
                },
                {
                    field:'goodsname',
                    title:'物品名称',
                    align:"center"
                },
                {
                    field:'number',
                    title:'申请数量',
                    align:"center",
                },
                {
                    field:'addingTime',
                    title:'申请时间',
                    align:"center",
                    //获取日期列的值进行转换
                    formatter:function (value,row,index) {
                        return changeDateFormat(value);
                    }
                }
            ]
        })
    }


    /*模糊查询*/
    function selectWhGoodsBylikeName2() {
        var likeNameId2=$("#likeNameId2").val();
        $("#chuHuoJiLuTable1").bootstrapTable("destroy");

        /*设置表格中的数据：上下居中*/
        $("#chuHuoJiLuTable1").addClass("text-center");

        $("#chuHuoJiLuTable1").bootstrapTable({
            url:path+"/WhShipment/selectWhShipmentByLikeName2?goodsname="+likeNameId2,
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
                    field:'whCategory.name',
                    title:'所属类别',
                    align:"center"
                },
                {
                    field:'goodsname',
                    title:'物品名称',
                    align:"center"
                },
                {
                    field:'number',
                    title:'物品数量',
                    align:"center"
                },
                {
                    field:'addingTime',
                    title:'添加时间',
                    align:"center",
                    //获取日期列的值进行转换
                    formatter:function (value,row,index) {
                        return changeDateFormat(value);
                    }
                }
            ]
        })
    }

    /*新增changeDateFormat方法*/
    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        var dateVal = cellval + "";
        if (cellval != null) {
            var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();

            var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
            var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
            var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

            return date.getFullYear() + "-" + month + "-" + currentDate + " " + hours + ":" + minutes + ":" + seconds;
        }
    }
</script>
<body>
<div  style="float: left;width: 1300px;padding-top: 15px">
    <input id="likeNameId2" name="goodsname">
    <button id="selectWhGoodsBylikeName2" onclick="selectWhGoodsBylikeName2()" type="button" style="float:left; background-color: #008CBA;">根据物品名称模糊查询</button>
    <div>
<%--出货记录bootstrap全查--%>
<table id="chuHuoJiLuTable1"></table>
</body>
</html>
