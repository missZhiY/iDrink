package com.iDrink.pojo;
import java.io.Serializable;

/**
 * 数据字典持久化类
 */
public class BaseDict implements Serializable {
	private static final long serialVersionUID = 1L;
	//字典序
	private Integer dict_id;
	//类型
	private String dict_type;
	//查询条件
	private String dict_con;
	//内容
	private String dict_item;

	public Integer getDict_id() {
		return dict_id;
	}

	public void setDict_id(Integer dict_id) {
		this.dict_id = dict_id;
	}

	public String getDict_type() {
		return dict_type;
	}

	public void setDict_type(String dict_type) {
		this.dict_type = dict_type;
	}

	public String getDict_con() {
		return dict_con;
	}

	public void setDict_con(String dict_con) {
		this.dict_con = dict_con;
	}

	public String getDict_item() {
		return dict_item;
	}

	public void setDict_item(String dict_item) {
		this.dict_item = dict_item;
	}
}
