<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./common/header.jsp"%>
<%@include file="./common/left.jsp"%>
 <script type="text/javascript">
 		$(function(){

 		    /*admin  用户管理  用户管理*/
           /* userManagement1();*/

            /*admin  货物管理    类别管理*/
           /* categoryManagement1();*/

            /*admin  货物管理    物品管理*/
            /*goodsManagement();*/

            /*非admin  申请出货  申请出货*/
            /*applicationShipment();*/

            /*admin  审批管理  出货审批*/
           /* shipmentApproval1();*/

            /*非admin  申请出货  申请记录*/
            /*applicationRecord1();*/

            /*admin  审批管理  出货记录*/
            /*chuHuoJiLu();*/

            /*admin  数据统计  统计图*/
           /* statisticalChartT();*/
 		})


 		//展示用户详情信息
		function createTab1(id,name,url,isClose){
			//id tab标签的id，不允许重复；
			//name tab便签上面显示的标题
			//url 标签页里面要加载的页面 不知跨域
			//closalbe boolean类型，是否显示关闭图标。
		 	closableTab.addTab({'id': id, 'name': name, 'url': url, 'closable': isClose});
		}

        /*admin  数据统计  统计图*/
        function statisticalChartT(){
            createTab1("statisticalChartT1Id","统计图","${pageContext.request.contextPath }/jsps/chartT/tongJiTu.jsp",true);

        }

        /*admin  审批管理  出货记录*/
		function chuHuoJiLu() {
            createTab1("chuHuoJiLu1Id","出货记录","${pageContext.request.contextPath }/jsps/goods/chuHuoJiLu1.jsp",true);
        }

        /*非admin  申请出货  申请记录*/
       function applicationRecord1() {
           createTab1("applicationRecord1Id","申请记录","${pageContext.request.contextPath }/jsps/goods/approvalRecordGoods.jsp",true);
       }

        /*admin  审批管理  出货审批*/
        function shipmentApproval1(){
            createTab1("hipmentApproval1Id","出货审批","${pageContext.request.contextPath }/jsps/goods/approvalGoods.jsp",true);
        }

        /*非admin  申请出货  申请出货*/
       function applicationShipment() {
           createTab1("applicationShipment1Id","申请出货","${pageContext.request.contextPath }/jsps/goods/applyGoods.jsp",true);
       }

        /*admin  货物管理    物品管理*/
       function goodsManagement() {
           createTab1("goodsManagement1Id","物品管理","${pageContext.request.contextPath }/jsps/goods/allGoods.jsp",true);
       }

        /*admin  货物管理    类别管理*/
        function categoryManagement1(){
            createTab1("CategoryManagement1Id","类别管理","${pageContext.request.contextPath }/jsps/whCategory/allCategory.jsp",true);
        }

        /*admin  用户管理  用户管理*/
        function userManagement1() {
            createTab1("userManagementId","用户管理","${pageContext.request.contextPath }/jsps/user/userFindAll.jsp",true);
        }

		//时间日期格式转换
		function dateFormats(dd) {
			var month = fix(dd.getMonth() + 1, 2);
			var year = dd.getFullYear();
			var hours = fix(dd.getHours(), 2);
			var minutes = fix(dd.getMinutes(), 2);
			var dates = fix(dd.getDate(), 2);
			//	var d1=year+"-"+month+"-"+dates+hours+":"+minutes ;
			var d1 = year + "-" + month + "-" + dates;
			return d1;
		}
		function fix(num, length) {
			return ('' + num).length < length ? ((new Array(length + 1))
					.join('0') + num).slice(-length) : '' + num;
		}
	</script>  
<%@include file="./common/footer.jsp"%>
<body>
</body>
</html>