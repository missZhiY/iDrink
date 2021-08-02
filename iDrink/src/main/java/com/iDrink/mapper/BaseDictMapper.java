package com.iDrink.mapper;


import com.iDrink.pojo.BaseDict;
import java.util.List;

/**
 * 数据字典
 */
public interface BaseDictMapper {
	// 根据类别代码查询数据字典
    public List<BaseDict> selectBaseDictByType(String type);
}
