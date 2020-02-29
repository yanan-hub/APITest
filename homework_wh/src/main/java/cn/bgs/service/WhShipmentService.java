package cn.bgs.service;

import cn.bgs.pojo.WhShipment;

import java.util.List;

public interface WhShipmentService {

    boolean applicationForSubmission(WhShipment whShipment,Integer uId);

    List<WhShipment> findAllApprovalGoods();

    boolean updateWhShipment(Integer id);

    boolean noPassApprovalGoods(Integer id, String message);

    List<WhShipment> findAllApprovalGoodsByA(Integer uId);

    boolean applicationShipment2(WhShipment whShipment);

    List<WhShipment> findAllApprovalGoodsByPass();

    List<WhShipment> selectWhShipmentByLikeName2(String goodsname);

    List<WhShipment> numberHistogram();
}
