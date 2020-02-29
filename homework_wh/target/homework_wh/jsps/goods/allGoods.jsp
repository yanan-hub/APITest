<%--
  Created by IntelliJ IDEA.
  User: yangt
  Date: 2020/2/12
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/css/fileinput.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/js/fileinput.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/js/locales/zh.js"></script>
</head>
<script>

    $(function () {

        /*表格*/
        table1()

        /*所属类别*/
        $.ajax({
            url:path+"/WhCategory/findAllWhCategoryName",
            type:"post",
            dataType:"json",
            success:function (data) {
                if(data != null){
                    var selectId2 = $("#optionId1").val();
                    var cId = document.getElementById("cId");
                    var cId2 = document.getElementById("cId2");
                    var cId3 = document.getElementById("cId3");
                    for (var i = 0; i < data.length; i++) {


                        if(selectId2 == data[i].id){
                            continue;
                        }
                        cId.options.add(new Option(data[i].name,data[i].id))
                        cId2.options.add(new Option(data[i].name,data[i].id))
                        cId3.options.add(new Option(data[i].name,data[i].id))
                    }
                }
            },
            error:function (data) {
                alert("获取部门下拉列表404等错误")
            }
        });


    })

    /*bootstrap表格*/
    function table1() {

        $("#WhGoodsFindAll").bootstrapTable("destroy");

        /*设置表格中的数据：上下居中*/
        $("#WhGoodsFindAll").addClass("text-center");

        $("#WhGoodsFindAll").bootstrapTable({
            url:path+"/WhGoods/findAllGoods",
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
                },
                {
                    title:"操作",
                    align:"center",
                    formatter:function (index,rows,value) {
                        var obj = JSON.stringify(rows);
                        return  "<a href='javascript:updateWhGoods("+obj+")' class='btn btn-default btn-sm'>修改</a>"+
                            "<a href='javascript:deleteWhGoods("+rows.id+")' class='btn btn-danger'>删除</a>"
                    }
                }


            ]
        })
    }

    /*添加按钮*/
    function addWhGoodsButtonId() {
        $("#addWhGoodsDivId").modal('show');
    }

    /*添加*/
    $("#addWhGoodsSave").click(function () {
        layer.confirm("是否添加？",{icon:3,title:"确认框"},function (index) {
            layer.close(index)
            $.ajax({
                url:path+"/WhGoods/addWhGoods",
                type:"post",
                data:decodeURIComponent($("#addWhGoodsFormId").serialize(),true),
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

    /*根据所属类别选择*/
    function selectWhGoodsByCidButtonId1() {
        var cId=$("#cId2").val();
        table2(cId)
    }

    function table2(cId) {
        $("#WhGoodsFindAll").bootstrapTable("destroy");

        /*设置表格中的数据：上下居中*/
        $("#WhGoodsFindAll").addClass("text-center");

        $("#WhGoodsFindAll").bootstrapTable({
            url:path+"/WhGoods/selectWhGoodsByCid?cId="+cId,
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
                },
                {
                    title:"操作",
                    align:"center",
                    formatter:function (index,rows,value) {
                        var obj = JSON.stringify(rows);
                        return  "<a href='javascript:updateWhGoods("+obj+")' class='btn btn-default btn-sm'>修改</a>"+
                            "<a href='javascript:deleteWhGoods("+rows.id+")' class='btn btn-danger'>删除</a>"
                    }
                }


            ]
        })
    }
    
    /*根据物品名称模糊查询*/
    function selectWhGoodsByNameButtonId1() {
        var likeNameId=$("#likeNameId").val();
        $("#WhGoodsFindAll").bootstrapTable("destroy");

        /*设置表格中的数据：上下居中*/
        $("#WhGoodsFindAll").addClass("text-center");

        $("#WhGoodsFindAll").bootstrapTable({
            url:path+"/WhGoods/selectWhGoodsByGoodsName?goodsname="+likeNameId,
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
                },
                {
                    title:"操作",
                    align:"center",
                    formatter:function (index,rows,value) {
                        var obj = JSON.stringify(rows);
                        return  "<a href='javascript:updateWhGoods("+obj+")' class='btn btn-default btn-sm'>修改</a>"+
                            "<a href='javascript:deleteWhGoods("+rows.id+")' class='btn btn-danger'>删除</a>"
                    }
                }


            ]
        })
    }

    /*点击修改按钮*/
    function updateWhGoods(whGoods) {
        var id = whGoods.whCategory.id;
        var name = whGoods.whCategory.name;
        $("#id2").attr("value",whGoods.id)
        $("#goodsname2").attr("value",whGoods.goodsname)
        $("#number2").attr("value",whGoods.number)
        $("#optionId1").attr("value",id);
        $("#optionId1").text(name);
        $("#addingTime2").attr('value',changeDateFormat(whGoods.addingTime))
        /*显示模态框*/
        $("#addWhGoodsDivId2").modal("show");
    }

    /*确认修改*/
    $("#updateWhGoodsSave2").click(function () {
        layer.confirm("是否进行修改？",{icon:1,title:"提示框"},function (index) {
            layer.close(index);
            $.ajax({
                url:path+"/WhGoods/UpdateWhGoods",
                type:"post",
                data:decodeURIComponent($("#addWhGoodsFormId2").serialize(),true),
                dataType:"json",
                success:function (data) {
                    if(data){
                        layer.confirm("修改成功",{icon:1,title:"提示框"},function (index) {
                            layer.close(index);
                            document.getElementById("addWhGoodsFormId2").reset();
                            $("#addWhGoodsDivId2").modal("hide");
                            table1();
                        })
                    }else{
                        alert("修改失败")
                    }
                },
                error:function (data) {
                    alert("404")
                }
            })
        })
    })


    //删除
    function deleteWhGoods(id) {
        layer.confirm("是否删除？",{icon:1,title:"提示框"},function (index) {
            layer.close(index);
            $.ajax({
                url:path+"/WhGoods/deleteWhGoods",
                type:"post",
                data:{
                    id:id
                },
                dataType:"json",
                success:function (data) {
                    if(data){
                        layer.confirm("删除成功",{icon:1,title:"提示框"},function (index) {
                            layer.close(index);
                            table1();
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
<style type="text/css">

    /*设置表格中的数据：上下居中*/
    .table tbody tr td{
        vertical-align: middle;
    }

</style>
<body>
<div  style="float: left;width: 1300px;padding-top: 20px">

            <div  style="float: left;width: 1300px;">

                <div  style="float: left;width: 1300px;padding-top: 15px">
                    <%--添加用户按钮--%>
                    <button id="addWhGoodsButtonId" onclick="addWhGoodsButtonId()" type="button" style="float:left; background-color: #008CBA;color: white;padding: 10px 22px;font-size: 16px;">添加物品</button>
                 <div>

                     <div  style="float: left;width: 1300px;padding-top: 15px">
                         <select id="cId2" name="cId">
                             <option value="0">---请选择---</option>
                         </select>
                         <button id="selectWhGoodsByCidButtonId" onclick="selectWhGoodsByCidButtonId1()" type="button" style="float:left; background-color: #008CBA;">根据名称所属类别查询</button>
                      <div>

                          <div  style="float: left;width: 1300px;padding-top: 15px">
                             <input id="likeNameId" name="goodsname">
                              <button id="selectWhGoodsByNameButtonId" onclick="selectWhGoodsByNameButtonId1()" type="button" style="float:left; background-color: #008CBA;">根据物品名称模糊查询</button>
                              <div>

                 <div  style="float: left;width: 1300px;padding-top: 20px">
                            <%--WhGoods bootstrap全查--%>
                            <table id="WhGoodsFindAll"></table>
                  </div>
            </div>

            <%--添加物品模态框   开始--%>
            <div class="modal fade" id="addWhGoodsDivId">
                <form id="addWhGoodsFormId">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <%--隐藏id--%>
                            <input type="hidden" class="form-control" id="id" name="id">
                            <div class="modal-header">
                                <h4><span id="title">添加物品</span></h4>
                                <button class="close" data-dismiss="modal">x</button>
                            </div>
                                <div class="modal-body">
                                    <label>所属类别</label>
                                    <select id="cId" name="cId">
                                        <option>---请选择---</option>
                                    </select>
                                </div>
                            <div class="modal-body">
                                <label>物品名称</label>
                                <input type="text" class="form-control" id="goodsname" name="goodsname">
                                <span id="goodsnameSpan"></span>
                            </div>
                            <div class="modal-body">
                                <label>物品数量 </label>
                                <input type="text" class="form-control" id="number" name="number">
                                <span id="numberSpan"></span>
                            </div>
                            <div class="modal-body">
                                <label>添加时间</label>
                                <input type="text" id="addingTime" name="addingTime" value="" class="form-control" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });">

                            </div>
                            <div class="modal-footer">
                                <button type="button" id="addWhGoodsSave" class="btn btn-primary">确定</button>
                                <%--  <button type="button" class="btn btn-primary" onclick="addWhUserSave()">确定</button>--%>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">返回</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <%--模态框结束--%>

                              <%--修改物品模态框   开始--%>
                              <div class="modal fade" id="addWhGoodsDivId2">
                                  <form id="addWhGoodsFormId2">
                                      <div class="modal-dialog">
                                          <div class="modal-content">
                                              <%--隐藏id--%>
                                              <input type="hidden" class="form-control" id="id2" name="id">
                                              <div class="modal-header">
                                                  <h4><span id="title2">修改物品信息</span></h4>
                                                  <button class="close" data-dismiss="modal">x</button>
                                              </div>
                                              <div class="modal-body">
                                                  <label>所属类别</label>
                                                  <select id="cId3" name="cId">
                                                      <option id="optionId1"></option>
                                                  </select>
                                              </div>
                                              <div class="modal-body">
                                                  <label>物品名称</label>
                                                  <input type="text" class="form-control" id="goodsname2" name="goodsname">
                                                  <span id="goodsnameSpan2"></span>
                                              </div>
                                              <div class="modal-body">
                                                  <label>物品数量 </label>
                                                  <input type="text" class="form-control" id="number2" name="number">
                                                  <span id="numberSpan2"></span>
                                              </div>
                                              <div class="modal-body">
                                                  <label>添加时间</label>
                                                  <input type="text" id="addingTime2" name="addingTime" value="" class="form-control" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });">

                                              </div>
                                              <div class="modal-footer">
                                                  <button type="button" id="updateWhGoodsSave2" class="btn btn-primary">确定</button>
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
