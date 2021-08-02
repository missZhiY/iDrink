package com.iDrink.service;
//Service层接口

import com.iDrink.pojo.BaseDict;

import java.util.List;

/**
 * 数据字典Service接口
 */
public interface BaseDictService {
	//根据类别代码查询数据字典
	List<BaseDict> findBaseDictByType(String type);
}
