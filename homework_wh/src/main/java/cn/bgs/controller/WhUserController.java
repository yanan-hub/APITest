package cn.bgs.controller;

import cn.bgs.pojo.WhUser;
import cn.bgs.service.WhUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/WhUser")
public class WhUserController {

    @Autowired
    private WhUserService whUserService;

    //查询
    @RequestMapping("/queryWhUser")
    @ResponseBody
    public boolean queryWhUser(String username , String password){
        WhUser user = whUserService.queryWhUser(username);
        if(user.getPassword().equals(password)){
            return true;
        }
        return false;
    }

    //登录
    @RequestMapping("/login")
    @ResponseBody
    public WhUser login(String username, String password, HttpSession session){
        WhUser user= whUserService.login(username,password);
        if(user != null){
            session.setAttribute("user",user);
            return user;
        }
        return null;
    }

    //清楚session
    @RequestMapping("/cleanSession")
    @ResponseBody
    public boolean cleanSession(HttpSession session){
        session.removeAttribute("user");
        WhUser user =  (WhUser) session.getAttribute("user");
        if(user != null){
            return  false;
        }else{
            return true;
        }
    }

    //用户全查
    @RequestMapping("/findAll")
    @ResponseBody
    public List<WhUser> findAll(){
        List<WhUser> list = whUserService.findAll();
        return list;
    }

    /*添加、修改用户*/
    @RequestMapping("/addOrUpdateWhUser")
    @ResponseBody
    public boolean addOrUpdateWhUser(WhUser whUser){
        boolean b = whUserService.addOrUpdateWhUser(whUser);
        return b;
    }

    /*删除用户*/
    @RequestMapping("/deleteWhUser")
    @ResponseBody
    public boolean deleteWhUser(Integer id){
        boolean b = whUserService.deleteWhUser(id);
        return b;
    }
}
