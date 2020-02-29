package cn.bgs.controller;

import cn.bgs.pojo.WhGoods;
import cn.bgs.pojo.WhShipment;
import cn.bgs.pojo.WhUser;
import cn.bgs.service.WhGoodsService;
import cn.bgs.service.WhShipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/WhShipment")
public class WhShipmentController {

    @Autowired
    private WhShipmentService whShipmentService;
    @Autowired
    private WhGoodsService whGoodsService;

    //提交申请
    @RequestMapping("/applicationForSubmission")
    @ResponseBody
    public boolean applicationForSubmission(WhShipment whShipment, HttpSession session){
        WhUser user = (WhUser) session.getAttribute("user");
        Integer uId = user.getId();
        boolean b = whShipmentService.applicationForSubmission(whShipment,uId);
        return b;
    }

    //查询所有未审批的记录
    @RequestMapping("/findAllApprovalGoods")
    @ResponseBody
    public List<WhShipment> findAllApprovalGoods(){
        List<WhShipment>  list = whShipmentService.findAllApprovalGoods();
        return list;
    }

    //通过
    @RequestMapping("/successApprovalGoods")
    @ResponseBody
    public boolean successApprovalGoods(WhShipment whShipment){
        Integer id = whShipment.getId();
        String goodsname = whShipment.getGoodsname();
        Integer number = whShipment.getNumber();
        Integer number1 = whGoodsService.selectNumnberByName(goodsname);
        Integer number2 = number1-number;
        boolean  b = whShipmentService.updateWhShipment(id);
        b = whGoodsService.UpdateWhGoodsByName(goodsname,number2);

        return b;
    }

    //未通过
    @RequestMapping("/noPassApprovalGoods")
    @ResponseBody
    public boolean noPassApprovalGoods(Integer id,String message){
        boolean b = whShipmentService.noPassApprovalGoods(id,message);
        return b;
    }

    //查询所有已经审批的记录
    @RequestMapping("/findAllApprovalGoodsByA")
    @ResponseBody
    public List<WhShipment> findAllApprovalGoodsByA(HttpSession session){
        WhUser user = (WhUser) session.getAttribute("user");
        Integer uId = user.getId();
        List<WhShipment>  list = whShipmentService.findAllApprovalGoodsByA(uId);
        return list;
    }

    //重新提交申请
    @RequestMapping("/applicationShipment2")
    @ResponseBody
    public boolean applicationShipment2(WhShipment whShipment){
        boolean  b = whShipmentService.applicationShipment2(whShipment);
        return b;
    }

    //出货记录
    @RequestMapping("/findAllApprovalGoodsByPass")
    @ResponseBody
    public List<WhShipment> findAllApprovalGoodsByPass(){
        List<WhShipment>  list = whShipmentService.findAllApprovalGoodsByPass();
        return list;
    }

    //模糊查询
    @RequestMapping("/selectWhShipmentByLikeName2")
    @ResponseBody
    public List<WhShipment> selectWhShipmentByLikeName2(String goodsname){
        List<WhShipment>  list = whShipmentService.selectWhShipmentByLikeName2(goodsname);
        return list;
    }

    //柱状图
    @RequestMapping("/numberHistogram")
    @ResponseBody
    public List<WhShipment> numberHistogram(){
        List<WhShipment>  list = whShipmentService.numberHistogram();
        return list;
    }
}
