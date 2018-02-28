package com.ibeetl.admin.core.util.beetl;

import java.util.List;

import org.beetl.core.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ibeetl.admin.core.entity.CoreDict;
import com.ibeetl.admin.core.service.CoreDictService;
@Component
public class DictQueryFunction  {

	@Autowired
	CoreDictService dictService;
	public List<CoreDict> dictDownQuery(String type) {

		return dictService.findAllByType(type);
	}
	
	
	public List<CoreDict> dictListByValue(String group,String value){
	    
	    return dictService.findAllByGroup(group,value);
	}

}
