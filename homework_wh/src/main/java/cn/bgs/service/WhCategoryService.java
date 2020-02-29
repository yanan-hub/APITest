package cn.bgs.service;

import cn.bgs.pojo.WhCategory;

import java.util.List;

public interface WhCategoryService {
    List<WhCategory> findAllWhCategory();

    boolean addWhCategory(WhCategory whCategory);

    boolean updateWhCategory(WhCategory whCategory);

    boolean deleteWhCategory(WhCategory whCategory);

    List<WhCategory> findAllWhCategoryName();
}
