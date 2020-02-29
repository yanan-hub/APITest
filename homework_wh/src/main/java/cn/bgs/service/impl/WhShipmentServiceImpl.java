package cn.bgs.service.impl;

import cn.bgs.mapper.WhShipmenMapper;
import cn.bgs.pojo.WhShipment;
import cn.bgs.service.WhShipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WhShipmentServiceImpl implements WhShipmentService {

    @Autowired
    private WhShipmenMapper whShipmenMapper;

    @Override
    public boolean applicationForSubmission(WhShipment whShipment,Integer uId) {
        return whShipmenMapper.applicationForSubmission(whShipment, uId);
    }

    @Override
    public List<WhShipment> findAllApprovalGoods() {
        return whShipmenMapper.findAllApprovalGoods();
    }

    @Override
    public boolean updateWhShipment(Integer id) {
        return whShipmenMapper.updateWhShipment(id);
    }

    @Override
    public boolean noPassApprovalGoods(Integer id, String message) {
        return whShipmenMapper.noPassApprovalGoods(id,message);
    }

    @Override
    public List<WhShipment> findAllApprovalGoodsByA(Integer uId) {
        return whShipmenMapper.findAllApprovalGoodsByA(uId);
    }

    @Override
    public boolean applicationShipment2(WhShipment whShipment) {
        return whShipmenMapper.applicationShipment2(whShipment);
    }

    @Override
    public List<WhShipment> findAllApprovalGoodsByPass() {
        return whShipmenMapper.findAllApprovalGoodsByPass();
    }

    @Override
    public List<WhShipment> selectWhShipmentByLikeName2(String goodsname) {
        return whShipmenMapper.selectWhShipmentByLikeName2(goodsname) ;
    }

    @Override
    public List<WhShipment> numberHistogram() {
        return whShipmenMapper.numberHistogram() ;
    }
}
