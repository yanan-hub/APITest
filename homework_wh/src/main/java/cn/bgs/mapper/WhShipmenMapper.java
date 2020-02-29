package cn.bgs.mapper;

import cn.bgs.pojo.WhShipment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WhShipmenMapper {

    //提交申请
    boolean applicationForSubmission(@Param("whShipment") WhShipment whShipment,@Param("uId") Integer uId);

    //查询所有未审批的记录
    List<WhShipment> findAllApprovalGoods();

    //通过申请
    boolean updateWhShipment(Integer id);

    //未通过申请
    boolean noPassApprovalGoods(@Param("id") Integer id, @Param("message") String message);

    //查询所有已经审批的记录
    List<WhShipment> findAllApprovalGoodsByA(Integer uId);

    //重新提交申请
    boolean applicationShipment2(WhShipment whShipment);

    //出货记录
    List<WhShipment> findAllApprovalGoodsByPass();

    //模糊查询
    List<WhShipment> selectWhShipmentByLikeName2(@Param("goodsname") String goodsname);

    //统计图
    List<WhShipment> numberHistogram();
}
