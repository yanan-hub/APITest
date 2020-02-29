<%--
  Created by IntelliJ IDEA.
  User: yangt
  Date: 2020/2/12
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%--ztree的核心代码jquery.ztree.core.js
        ztree关于选中的代码jquery.ztree.excheck.js（如果有复选框引入）
        ztree关于是否可编辑的代码jquery.exedit.js（允许修改节点时引入）--%>

    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.core.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.excheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.exedit.min.js"></script>

    <%--引用上三个js,或者下面一个js即可--%>
    <%-- <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.all.min.js"></script>--%>

    <%--zTreeStyle.css 引此css,图标为黄色--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/zTreeStyle/zTreeStyle.css">

    <%--metroStyle.css 引此css,图标变为黑色--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/metroStyle/metroStyle.css">--%>

</head>
<script>
    var aaabbb;
    var zTreeObj;
    // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
    // 进行ztree树形菜单设置，开启简单json数据支持


    var setting = {
        view: {
            showIcon: true,//设置 zTree 是否显示节点的图标。
            addHoverDom: addHoverDom, //当鼠标移动到节点上时，显示用户自定义控件
            removeHoverDom: removeHoverDom, //离开节点时的操作
            fontCss: getFontCss //个性化样式
            /*fontCss: {/!*background:"blue",*!/ 'color': 'blue', 'font-family':"Times New Roman"} //个性化样式*/
        },
        edit: {
            enable: true, //单独设置为true时，可加载修改、删除图标
            editNameSelectAll: true,
            removeTitle:'删除',
            renameTitle:'重命名'
        },
        /*check: {
            enable: true  //设置 zTree 的节点上是否显示 checkbox / radio
        },*/
        data: {
            simpleData: {
                enable: true,  //true 、 false 分别表示 使用 、 不使用 简单数据模式
                idKey: "id",  //节点数据中保存唯一标识的属性名称   设置之后id为在简单数据模式中的父子节点关联的桥梁
                pIdKey: "pid",    //节点数据中保存其父节点唯一标识的属性名称   设置之后pid为在简单数据模式中的父子节点关联的桥梁和id互相对应
                rootPId: 0,  //用于修正根节点父节点数据，即 pIdKey 指定的属性值    eg: rootId:"null" 表示：pid为null的表示根节点
            },
            keep:{
                parent:true  //zTree 的节点父节点属性锁，是否始终保持 isParent = true     true / false 分别表示 锁定 / 不锁定 父节点属性
            },
            key:{
                name:"name",
            }
        },
        callback: { //回调函数
            beforeRename: zTreeBeforeRename,    //修改之前
            onRename: zTreeOnRename,            //修改
            beforeRemove: zTreeBeforeRemove,   //删除之前
            onRemove: zTreeOnRemove,//删除
        }
    };

    /*$(function() {}) 是$(document).ready(function()的简写。页面加载函数*/
    $(document).ready(function(){
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/WhCategory/findAllWhCategory",
            async:false,
            success:function(data){
                zTreeObj = $.fn.zTree.init($("#treeId"), setting, data); //初始化树  　获取树对象的完成方式为：var treeObj = $.fn.zTree.getZTreeObj("tree")，参数为DOM的ID。
                zTreeObj.expandAll(true)  　//expandAll:展开或者折叠节点   使用方式为 treeObj.expandAll(true) - >展开所有节点，设置为false为折叠所有节点。
            }
        });
    });
    function getFontCss(treeId, node) {
        return node.font ? node.font : {'color': 'blue', 'font-family':"Times New Roman"};
    }

    //添加新的节点
    /*鼠标移上，展示添加按钮，并且含点击添加按钮触发的事件*/
    function addHoverDom(treeId, treeNode) {
        var pid=treeNode.pId;
        var id=treeNode.id;

        //根据id 获取节点对象     /* 获取此标签（通过id选择器获取）：<span id="treeId_5_span" class="node_name">邢台市</span>   "_span"：页面节点标签是什么就写什么*/
        // tId:  treeNode 节点的唯一标识
        var aObj = $("#" + treeNode.tId + "_span");

        /*treeNode.editNameFlag：用于记录节点是否处于编辑名称状态。
		true 表示节点处于编辑名称状态
		false 表示节点未处于编辑名称状态(默认)*/
        /*$("#addBtn_"+treeNode.tId).length>0   判断添加按钮是否存在*/
        /*直接return  ：不走一下追加操作*/
        if ($("#addBtn_"+treeNode.tId).length>0 || treeNode.editNameFlag) return;

        /*追加操作*/
        /*字符串拼接
        按照一下格式写：<span class="button edit" id="treeId_1_edit" title="重命名" treenode_edit="" style=""></span>
        onFocus是JavaScript的里面的在对象获得焦点时发生的事件*/
        var addStr = "<span class='button add' id='addBtn_" +treeNode.tId
            + "' title='add node' onfocus='this.blur()'> </span>"

        /* after：在此节点（aObj）后，追加元素（addStr）*/
        aObj.after(addStr);


        /*给 加号图标 添加点击事件*/
        /*先根据id获取加号标签元素*/
        var btnAdd = $("#addBtn_"+treeNode.tId);
        /*绑定事件 ：先判断元素是否存在*/
        if(btnAdd) btnAdd.bind("click",function () {

            /*判断当前节点是否为父节点 */
            if(treeNode.isParent){
                /*if(treeNode.type != 'xian'){*/

                /*函数用来弹出添加节点模态框*/
                setValueToDialog(treeNode);

            }else{
                alert("该类别不能添加子节点！")
            }
        })
    };

    /*用于当鼠标移出节点时，隐藏用户自定义控件*/
    function removeHoverDom(treeId, treeNode) {

        /*unbind().remove() ：解除绑定，执行移除操作*/
        $("#addBtn_" + treeNode.tId).unbind().remove();

    };

    /*添加子节点：显示模态框*/
    function setValueToDialog(treeNode) {
        aaabbb = treeNode;
        $("#id").attr("value",treeNode.id);
        $("#pid").attr("value",treeNode.pid);
        $("#name").attr("value",treeNode.name);
        $("#nameId").text(treeNode.name);
        $("#type").attr("value",treeNode.type);

        $("#addChildNodeDivId1").modal("show");


    }

    /*添加节点：模态框  添加*/
    function addNode() {
        var treeNode = aaabbb;
        $.ajax({
            url:"${pageContext.request.contextPath}/WhCategory/addWhCategory",
            type:"post",
            data:$("#addChildNodeForm1").serialize(),
            success:function (data) {
                var name = $("#code").val()
                layer.confirm("添加成功",{icon:1,title:"添加成功"},function (index) {
                    layer.close(index);
                    /*清空模态框form表单数据*/
                    document.getElementById("addChildNodeForm1").reset();
                    /*隐藏模态框*/
                    $("#addChildNodeDivId1").modal("hide");
                    /* 获取 id 为 treeId 的 zTree 对象*/
                    var treeObj = $.fn.zTree.getZTreeObj("treeId");
                    /*根据节点数据的属性搜索，获取条件完全匹配的节点数据 JSON 对象*/
                    var parentZNode=treeObj.getNodeByParam("id",treeNode.id,null);

                   /* window.location.reload();*/
                    if(treeNode.type == "1"){
                        var newNode = {name:name,id:data,type:"2",isParent:true};
                        newNode = treeObj.addNodes(parentZNode,newNode);
                    }else{
                        var newNode = {name:name,id:data,type:"3",isParent:false};
                        newNode = treeObj.addNodes(parentZNode,newNode);
                    }

                })
            },
            error:function (data) {
                alert("子节点添加404")
            }
        })
    }

    /*修改之前的判断*/
    function zTreeBeforeRename(treeId, treeNode, newName, isCancel) {

        /*isCancel = true 表示取消编辑操作（按下 ESC 或 使用 cancelEditName 方法）
        isCancel = false 表示确认修改操作*/

        if(confirm("是否确认修改？")==true){
            return true;
        }else{
            var treeObj=$.fn.zTree.getZTreeObj("treeId");
            treeObj.refresh();
            return false;
        }
    }

    /*修改*/
    function zTreeOnRename(event, treeId, treeNode, isCancel) {

        if(!isCancel){
            var id = treeNode.id;
            var name = treeNode.name;
            $.ajax({
                url:path+"/WhCategory/updateWhCategory",
                type:"post",
                data:{
                    id:id,
                    name:name
                },
                success:function (data) {
                    if(data){
                        layer.confirm("修改成功",{icon:1,title:"提示框"},function (index) {
                            layer.close(index);
                            var treeObj=$.fn.zTree.getZTreeObj("treeId");
                            treeObj.refresh();
                        })
                    }else{
                        layer.confirm("修改失败",{icon:1,title:"提示框"},function (index) {
                            layer.close(index);
                            var treeObj=$.fn.zTree.getZTreeObj("treeId");
                            treeObj.refresh();
                        })
                    }
                },
                error:function (data) {
                    alert("修改节点404")
                }
            })

        }
    }

    /*删除之前的判断*/
    function zTreeBeforeRemove(treeId, treeNode) {
        /*  返回值是 true / false
            如果返回 false，zTree 将不删除节点，也无法触发 onRemove 事件回调函数  */
        if(treeNode.type == "1" ){
            if(confirm("不能删除一级类别")){
                return false;
            }else{
                return false;
            }
        }else if(treeNode.type == "2"){
            if(confirm("不能删除二级类别")){
                return false;
            }else{
                return false;
            }
        }else{
            if(confirm("是否删除？")){
                return true;
            }else{
                return false;
            }
        }
    }

    /*删除*/
    function zTreeOnRemove(event, treeId, treeNode) {
        var id = treeNode.id;
        var name = treeNode.name;
        var type = treeNode.type;
        /* if(confirm("是否删除"+name+"?")){*/
        $.ajax({
            url:path+"/WhCategory/deleteWhCategory",
            type:"post",
            data:{
                id:id,
                type:type
            },
            success:function (data) {
                if(data){
                    layer.confirm("删除成功",{icon:1,title:"提示框"},function (index) {
                        layer.close(index);
                        var treeObj=$.fn.zTree.getZTreeObj("treeId");
                        treeObj.refresh();
                    })
                }else{
                    layer.confirm("删除失败",{icon:1,title:"提示框"},function (index) {
                        layer.close(index);
                        var treeObj=$.fn.zTree.getZTreeObj("treeId");
                        treeObj.refresh();
                    })
                }
            },
            error:function (data) {
                alert("修改节点404")
            }
        })
        /* }else{
             var treeObj=$.fn.zTree.getZTreeObj("treeId");
             treeObj.refresh();
         }*/
    }
</script>
<body>

<%--zTree显示ul--%>
<div>
    <ul id="treeId" class="ztree"></ul>
</div>
<%--添加子节点模态框--%>
<%--在模态框在最外层添加     data-backdrop="static"   就可以使模态框点击除了×号和关闭按钮外的其他区域不消失。--%>
<div class="modal fade" style="background: rgba(0,0,0,0.4);overflow: auto" id="addChildNodeDivId1" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel1">添加机构</h4>
                <button type="button" class="close" data-dismiss="modal">
                    &times;
                </button>
            </div>
            <form id="addChildNodeForm1" role="form" class="form-horizontal">

                <%--当前节点的id--%>
                <input type="hidden"  id="id"  name="id" value="" >
                <%--当前节点的pid（父id）--%>
                <input type="hidden"  id="pid"  name="pid" value="" >
                <%--type--%>
                <input type="hidden"  id="type"  name="type" value="" >
                <%--name--%>
                <input type="hidden"  id="name"  name="name" value="" >

                <div class="modal-body">
                    <label>所属类别：</label>
                    <span id="nameId"></span>
                </div>
                <div class="modal-body">
                    <label>类别名称：</label>
                    <input type="text"  id="code"  name="code">
                </div>
                <div class="modal-footer">
                    <input id="sub" type="button" class="btn btn-primary" onclick="addNode()" value="添加"/>
                </div>
            </form>
        </div>
    </div>
</div>
<%--结束模态框--%>
</body>
</html>
