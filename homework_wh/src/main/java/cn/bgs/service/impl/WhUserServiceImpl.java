package cn.bgs.service.impl;

import cn.bgs.mapper.WhUserMapper;
import cn.bgs.pojo.WhUser;
import cn.bgs.service.WhUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WhUserServiceImpl implements WhUserService {

    @Autowired
    private WhUserMapper whUserMapper;

    @Override
    public   WhUser  login(String username, String password) {
        return whUserMapper.login(username, password);
    }

    @Override
    public WhUser queryWhUser(String username) {
        return whUserMapper.queryWhUser(username);
    }

    @Override
    public List<WhUser> findAll() {
        return whUserMapper.findAll();
    }

    @Override
    public boolean addOrUpdateWhUser(WhUser whUser) {
        return whUserMapper.addOrUpdateWhUser(whUser);
    }

    @Override
    public boolean deleteWhUser(Integer id) {
        return whUserMapper.deleteWhUser(id);
    }
}
