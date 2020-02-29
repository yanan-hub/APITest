package cn.bgs.service;

import cn.bgs.pojo.WhUser;

import java.util.List;

public interface WhUserService {
    WhUser  login(String username, String password);

    WhUser queryWhUser(String username);

    List<WhUser> findAll();

    boolean addOrUpdateWhUser(WhUser whUser);

    boolean deleteWhUser(Integer id);
}
