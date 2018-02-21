package com.ibeetl.admin.core.util.beetl;

import java.util.List;

import org.beetl.core.Context;
import org.beetl.core.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ibeetl.admin.core.entity.CoreDict;
import com.ibeetl.admin.core.service.CoreDictService;
@Component
public class DictQueryByValueFunction implements Function {

	@Autowired
	CoreDictService dictService;
	
	@Override
	public List<CoreDict> call(Object[] paras, Context arg1) {
		
		String value =(String)paras[0];
		CoreDict dict =  dictService.findCoreDict(value);
		if(dict==null) {
			throw new RuntimeException("未能发现数据字典 "+value);
		}
		List<CoreDict> list = dictService.findAllByType(dict.getType());
		return list;
		
	    
	}

}
