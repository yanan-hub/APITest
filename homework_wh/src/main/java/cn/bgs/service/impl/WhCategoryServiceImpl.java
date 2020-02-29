package cn.bgs.service.impl;

import cn.bgs.mapper.WhCategoryMapper;
import cn.bgs.pojo.WhCategory;
import cn.bgs.service.WhCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WhCategoryServiceImpl implements WhCategoryService {

    @Autowired
    private WhCategoryMapper whCategoryMapper;

    @Override
    public List<WhCategory> findAllWhCategory() {
        return whCategoryMapper.findAllWhCategory();
    }

    @Override
    public boolean addWhCategory(WhCategory whCategory) {
        return whCategoryMapper.addWhCategory(whCategory);
    }

    @Override
    public boolean updateWhCategory(WhCategory whCategory) {
        return whCategoryMapper.updateWhCategory(whCategory);
    }

    @Override
    public boolean deleteWhCategory(WhCategory whCategory) {
        return whCategoryMapper.deleteWhCategory(whCategory);
    }

    @Override
    public List<WhCategory> findAllWhCategoryName() {
        return whCategoryMapper.findAllWhCategoryName();
    }
}
