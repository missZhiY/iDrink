package com.iDrink.service.impl;

import com.iDrink.mapper.BaseDictMapper;
import com.iDrink.pojo.BaseDict;
import com.iDrink.service.BaseDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 数据字典Service接口实现类
 */
@Service("baseDictService")
public class BaseDictServiceImpl implements BaseDictService {
	@Autowired
	private BaseDictMapper baseDictMapper;

	@Override
	public List<BaseDict> findBaseDictByType(String type) {
		return baseDictMapper.selectBaseDictByType(type);
	}
}
