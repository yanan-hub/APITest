<%--
  Created by IntelliJ IDEA.
  User: yangt
  Date: 2020/2/12
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>

    $(function () {

        tableGoods();

    })

    /*bootstrap表格*/
    function tableGoods() {

        $("#ApprovalWhGoodsFindAll").bootstrapTable("destroy");

        /*设置表格中的数据：上下居中*/
        $("#ApprovalWhGoodsFindAll").addClass("text-center");

        $("#ApprovalWhGoodsFindAll").bootstrapTable({
            url:path+"/WhShipment/findAllApprovalGoods",
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
                },
                {
                    title:"操作",
                    align:"center",
                    formatter:function (index,rows,value) {
                        var obj = JSON.stringify(rows);
                      /*  return  "<a href='javascript:successApproval1("+rows.id+","+rows.number+")' class='btn btn-default btn-sm'>通过</a>"+
                            "<a href='javascript:errorApproval("+rows.id+")' class='btn btn-danger'>不通过</a>"*/
                        return  "<a href='javascript:successApproval1("+obj+")' class='btn btn-default btn-sm'>通过</a>"+
                            "<a href='javascript:errorApproval("+rows.id+")' class='btn btn-danger'>不通过</a>"
                    }
                }


            ]
        })
    }

    /*通过*/
    function successApproval1(obj) {
        var id = obj.id;
        var number = obj.number;
        var name = obj.goodsname;
        layer.confirm("确认通过？",{icon:1,title:"提示框"},function (index) {
            layer.close(index);
            $.ajax({
                url:path+"/WhShipment/successApprovalGoods",
                type:"post",
                data:{
                    id:id,
                    number:number,
                    goodsname:name
                },
                dataType:"json",
                success:function (data) {
                    if(data){
                        layer.confirm("成功",{icon:1,title:"提示框"},function (index) {
                            layer.close(index);
                            tableGoods();
                        })
                    }else{
                        alert("失败")
                    }
                },
                error:function (data) {
                    alert("404")
                }
            })
        })
    }

    /*不通过*/
    function errorApproval(id) {
        layer.prompt({
            formType: 2,
            value: '',
            title: '不通过原因',
            area: ['400px', '250px'] //自定义文本域宽高
        }, function(value, index, elem){
            layer.close(index);

            $.ajax({
                url:path+"/WhShipment/noPassApprovalGoods",
                type:"post",
                data:{
                    id:id,
                    message:value
                },
                dataType:"json",
                success:function (data) {
                    if(data){
                        layer.alert("未通过",{icon:1,title:"提示框"},function (index) {
                            layer.close(index);
                            tableGoods();
                        })

                    }
                },
                error:function (data) {
                    alert("404")
                }
            })

        });
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
    <%--出货审批bootstrap全查--%>
    <table id="ApprovalWhGoodsFindAll"></table>
</body>
</html>
