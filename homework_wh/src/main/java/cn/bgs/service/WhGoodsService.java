package cn.bgs.service;

import cn.bgs.pojo.WhGoods;

import java.util.List;

public interface WhGoodsService {
    List<WhGoods> findAllGoods();

    boolean addWhGoods(WhGoods whGoods);

    List<WhGoods> selectWhGoodsByCid(Integer cId);

    List<WhGoods> selectWhGoodsByGoodsName(String goodsname);

    boolean UpdateWhGoods(WhGoods whGoods);

    boolean deleteWhGoods(Integer id);

    boolean UpdateWhGoodsByName(String goodsname, Integer number);

    Integer selectNumnberByName(String goodsname);
}
