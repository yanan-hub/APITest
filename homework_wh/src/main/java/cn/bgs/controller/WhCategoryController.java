package cn.bgs.controller;

import cn.bgs.pojo.WhCategory;
import cn.bgs.service.WhCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/WhCategory")
public class WhCategoryController {

    @Autowired
    private WhCategoryService whCategoryService;

    //全查
    @RequestMapping("/findAllWhCategory")
    @ResponseBody
    public List<WhCategory> findAllWhCategory(){
        List<WhCategory> list = whCategoryService.findAllWhCategory();
        return list;
    }

    //添加类别
    @RequestMapping("/addWhCategory")
    @ResponseBody
    public Integer addWhCategory(WhCategory whCategory){

        boolean b = whCategoryService.addWhCategory(whCategory);
        Integer idStr = whCategory.getId();
        if(b){
            return idStr;
        }else{
            return  null;
        }

       /* boolean b = whCategoryService.addWhCategory(whCategory);
        return b;*/
    }

    //修改
    @RequestMapping("/updateWhCategory")
    @ResponseBody
    public boolean updateWhCategory(WhCategory whCategory){
        boolean b = whCategoryService.updateWhCategory(whCategory);
        return b;
    }

    //删除
    @RequestMapping("/deleteWhCategory")
    @ResponseBody
    public boolean deleteWhCategory(WhCategory whCategory){
        boolean b = whCategoryService.deleteWhCategory(whCategory);
        return b;
    }

    //查所有类别名称
    @RequestMapping("/findAllWhCategoryName")
    @ResponseBody
    public List<WhCategory> findAllWhCategoryName(){
        List<WhCategory> list = whCategoryService.findAllWhCategoryName();
        return list;
    }
}
