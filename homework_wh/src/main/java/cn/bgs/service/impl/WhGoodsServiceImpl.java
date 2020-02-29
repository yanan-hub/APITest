package cn.bgs.service.impl;

import cn.bgs.mapper.WhGoodsMapper;
import cn.bgs.pojo.WhGoods;
import cn.bgs.service.WhGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WhGoodsServiceImpl implements WhGoodsService {

    @Autowired
    private WhGoodsMapper whGoodsMapper;

    @Override
    public List<WhGoods> findAllGoods() {
        return whGoodsMapper.findAllGoods();
    }

    @Override
    public boolean addWhGoods(WhGoods whGoods) {
        return whGoodsMapper.addWhGoods(whGoods);
    }

    @Override
    public List<WhGoods> selectWhGoodsByCid(Integer cId) {
        return whGoodsMapper. selectWhGoodsByCid(cId);
    }

    @Override
    public List<WhGoods> selectWhGoodsByGoodsName(String goodsname) {
        return whGoodsMapper.selectWhGoodsByGoodsName(goodsname);
    }

    @Override
    public boolean UpdateWhGoods(WhGoods whGoods) {
        return whGoodsMapper.UpdateWhGoods(whGoods);
    }

    @Override
    public boolean deleteWhGoods(Integer id) {
        return whGoodsMapper.deleteWhGoods(id) ;
    }

    @Override
    public boolean UpdateWhGoodsByName(String goodsname, Integer number) {
        return whGoodsMapper.UpdateWhGoodsByName(goodsname,number);
    }

    @Override
    public Integer selectNumnberByName(String goodsname) {
        return whGoodsMapper.selectNumnberByName( goodsname);
    }
}
