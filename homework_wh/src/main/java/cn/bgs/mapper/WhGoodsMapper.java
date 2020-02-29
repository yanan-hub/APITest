package cn.bgs.mapper;

import cn.bgs.pojo.WhGoods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WhGoodsMapper {

    //全查
    List<WhGoods> findAllGoods();

    //添加
    boolean addWhGoods(WhGoods whGoods);

    //根据类别查询
    List<WhGoods> selectWhGoodsByCid(@Param("cId") Integer cId);

    //根据物品名称模糊查询
    List<WhGoods> selectWhGoodsByGoodsName(String goodsname);

    //修改
    boolean UpdateWhGoods(WhGoods whGoods);

    //删除
    boolean deleteWhGoods(Integer id);

    //通过申请，修改数量
    boolean UpdateWhGoodsByName(@Param("goodsname") String goodsname, @Param("number") Integer number);

    //求数量
    Integer selectNumnberByName(String goodsname);
}
