package cn.bgs.mapper;

import cn.bgs.pojo.WhUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WhUserMapper {

    //登录
    WhUser login(@Param("username") String username, @Param("password") String password);

    //查询
    WhUser queryWhUser(String username);

    //用户全查
    List<WhUser> findAll();

    //添加用户
    boolean addOrUpdateWhUser(WhUser whUser);

    //删除用户
    boolean deleteWhUser(Integer id);
}
