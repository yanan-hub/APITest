<%--
  Created by IntelliJ IDEA.
  User: yangt
  Date: 2020/2/13
  Time: 0:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- 引入 echarts.js -->
    <script src="${pageContext.request.contextPath}/static/echarts/echarts.min.js"></script>
</head>

<script type="text/javascript">

    var items = [];
    var goodsname = [];
    var itemsMoney = [];

    $(function () {

        //加载统计图
        $.ajax({
            url:path+"/WhShipment/numberHistogram",
            type:"post",
            async:false,
            dataType:"json",
            success:function (data) {
                if(data != null){
                    for (var i = 0; i < data.length; i++) {

                        items.push({name:data[i].goodsname,value:data[i].number});
                        goodsname.push(data[i].goodsname);
                        itemsMoney.push(data[i].number);
                    }
                }
            },
            error:function (data) {
                layer.confirm("加载统计图404",{icon:3,title:"提示框"},function (index) {
                    layer.close(index);
                })
            }
        })

        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option={
            title: {
                text:'各物品出货统计柱状图',
                x: 'center',
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} "
            },
            xAxis: {
                type: 'category',
                data: goodsname
            },
            yAxis: [{
                name:"数量(件)",
                //max:30,
                min:0,
                type: 'value',
                minInterval: 5,
                interval:2,//每次增加几个
                axisLabel: {
                    formatter: '{value}'
                }
            }],
            series: [
                {
                    name: '数量统计',
                    type: 'bar',
                    data:items,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option)

    })


</script>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom 容器    float: left (浮动：左浮)-->
    <div id="main" style="width: 1200px;height:400px;margin-top:110px;" ></div>
</body>
</html>
