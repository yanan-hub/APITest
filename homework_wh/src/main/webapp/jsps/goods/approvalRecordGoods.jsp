
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

        tableGoods2();

        /*所属类别*/
        $.ajax({
            url:path+"/WhCategory/findAllWhCategoryName",
            type:"post",
            dataType:"json",
            success:function (data) {
                if(data != null){
                    for (var i = 0; i < data.length; i++) {
                        var cId = document.getElementById("cid000");
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
                        var goodsname00 = document.getElementById("goodsnameId00");
                        goodsname00.options.add(new Option(data[i].goodsname,data[i].goodsname))
                    }
                }
            },
            error:function (data) {
                alert("获取下拉列表404等错误")
            }
        });


    })

    /*bootstrap表格*/
    function tableGoods2() {

        $("#shenQingJiLuGoodsFindAll").bootstrapTable("destroy");

        /*设置表格中的数据：上下居中*/
        $("#shenQingJiLuGoodsFindAll").addClass("text-center");

        $("#shenQingJiLuGoodsFindAll").bootstrapTable({
            url:path+"/WhShipment/findAllApprovalGoodsByA",
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
                    field:'message',
                    title:'审批意见',
                    align:"center",
                },
                {
                    title:"审批状态",
                    align:"center",
                    formatter:function (index,rows,value) {
                        var obj = JSON.stringify(rows);
                        if(rows.available == 1){
                            return "<button class='btn btn-danger'>通过</button>"
                        }else if(rows.available == 2){
                            return  "<a href='javascript:replaceAppleWhShipment("+obj+")' class='btn btn-default btn-sm'>重新申请</a>"
                        }
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
                            tableGoods2();
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
                            tableGoods2();
                        })

                    }
                },
                error:function (data) {
                    alert("404")
                }
            })

        });
    }

    /*重新申请*/
    function replaceAppleWhShipment(obj) {

        $.ajax({
            url:path+"/WhGoods/findAllGoods",
            type:"post",
            dataType:"json",
            success:function (data) {
                if(data != null){
                    for (var i = 0; i < data.length; i++) {
                        var goodsname = document.getElementById("goodsnameId00");
                        goodsname.options.add(new Option(data[i].goodsname,data[i].goodsname))
                    }
                }
            },
            error:function (data) {
                alert("获取下拉列表404等错误")
            }
        });

        var id1 = obj.cid;
        var name1 = obj.whCategory.name;

        $("#id000").attr("value",obj.id)
        $("#uid000").attr("value",obj.uid)
        $("#number000").attr("value",obj.number)
        $("#addingTime000").attr("value",changeDateFormat(obj.addingTime))

        $("#optionId2").attr("value",id1);
        $("#optionId2").text(name1);

        $("#optionId3").attr("value",obj.goodsname);
        $("#optionId3").text(obj.goodsname);

        $("#chongxinshenqingDivId2").modal("show")
    }

    /*重新申请确认按钮*/
    $("#replaceSave").click(function () {
        layer.confirm("是否提交申请？",{icon:3,title:"确认框"},function (index) {
            layer.close(index)
            $.ajax({
                url:path+"/WhShipment/applicationShipment2",
                type:"post",
                data:decodeURIComponent($("#chongxinshenqingFormId2").serialize(),true),
                success:function (data) {
                    if(data){
                        layer.confirm("成功",{icon:1,title:"提示框"},function (index) {
                            layer.close(index)
                            document.getElementById("chongxinshenqingFormId2").reset();
                            $("#chongxinshenqingDivId2").modal("hide")
                            window.location.reload();
                        })
                    }else{
                        layer.msg("失败")
                        window.location.reload();
                    }
                },
                error:function (data) {
                    layer.msg("404")
                }
            })
        })
    })

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
<%--申请记录bootstrap全查--%>
<table id="shenQingJiLuGoodsFindAll"></table>

<%--重新申请模态框   开始--%>
<div class="modal fade" id="chongxinshenqingDivId2">
    <form id="chongxinshenqingFormId2">
        <div class="modal-dialog">
            <div class="modal-content">
                <%--隐藏id--%>
                <input type="hidden" class="form-control" id="id000" name="id">
                <input type="hidden" class="form-control" id="uid000" name="uid">
                <div class="modal-header">
                    <h4><span id="title">重新申请</span></h4>
                    <button class="close" data-dismiss="modal">x</button>
                </div>
                    <div class="modal-body">
                        <label>所属类别</label>
                        <select id="cid000" name="cid">
                            <%--<option value="0">---请选择---</option>--%>
                            <option id="optionId2"></option>
                        </select>
                    </div>
                <div class="modal-body">
                    <label>物品名称</label>
                    <select id="goodsnameId00" name="goodsname">
                        <%--<option value="0">---请选择---</option>--%>
                        <option id="optionId3"></option>
                    </select>
                   <%-- <input type="text" class="form-control" id="goodsname" name="goodsname">
                    <span id="goodsnameSpan"></span>--%>
                </div>
                <div class="modal-body">
                    <label>申请数量</label>
                    <input type="text" class="form-control" id="number000" name="number">
                    <span id="numberSpan"></span>
                </div>
                <div class="modal-body">
                    <label>申请时间</label>
                    <input type="text" id="addingTime000" name="addingTime" value="" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });">
                    <span id="addingTimeSpan"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" id="replaceSave" class="btn btn-primary">确定</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">返回</button>
                </div>
            </div>
        </div>
    </form>
</div>
<%--模态框结束--%>
</body>
</html>
