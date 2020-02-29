package cn.bgs.controller;

import cn.bgs.pojo.WhGoods;
import cn.bgs.service.WhGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("WhGoods")
public class WhGoodsController {

    @Autowired
    private WhGoodsService whGoodsService;

    //全查
    @RequestMapping("findAllGoods")
    @ResponseBody
    public List<WhGoods> findAllGoods(){
        List<WhGoods> list = whGoodsService.findAllGoods();
        return list;
    }

    //添加
    @RequestMapping("/addWhGoods")
    @ResponseBody
    public boolean addWhGoods(WhGoods whGoods){
        boolean b = whGoodsService.addWhGoods(whGoods);
        return b;
    }

    //根据类别查询
    @RequestMapping("selectWhGoodsByCid")
    @ResponseBody
    public List<WhGoods> selectWhGoodsByCid(Integer cId){
        List<WhGoods> list = whGoodsService.selectWhGoodsByCid(cId);
        return list;
    }

    //根据物品名称模糊查询
    @RequestMapping("selectWhGoodsByGoodsName")
    @ResponseBody
    public List<WhGoods> selectWhGoodsByGoodsName(String goodsname){
        List<WhGoods> list = whGoodsService.selectWhGoodsByGoodsName(goodsname);
        return list;
    }

    //修改
    @RequestMapping("/UpdateWhGoods")
    @ResponseBody
    public boolean UpdateWhGoods(WhGoods whGoods){
        boolean b = whGoodsService.UpdateWhGoods(whGoods);
        return b;
    }

    //删除deleteWhGoods
    @RequestMapping("/deleteWhGoods")
    @ResponseBody
    public boolean deleteWhGoods(Integer id){
        boolean b = whGoodsService.deleteWhGoods(id);
        return b;
    }
}
