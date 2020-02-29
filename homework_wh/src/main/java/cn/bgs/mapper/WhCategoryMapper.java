package cn.bgs.mapper;

import cn.bgs.pojo.WhCategory;

import java.util.List;

public interface WhCategoryMapper {

    //全查
    List<WhCategory> findAllWhCategory();

    //添加
    boolean addWhCategory(WhCategory whCategory);

    //修改
    boolean updateWhCategory(WhCategory whCategory);

    //删除
    boolean deleteWhCategory(WhCategory whCategory);

    //查所有类别名称
    List<WhCategory> findAllWhCategoryName();
}
