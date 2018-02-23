package com.ibeetl.admin.core.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibeetl.admin.core.dao.CoreDictDao;
import com.ibeetl.admin.core.entity.CoreDict;
import com.ibeetl.admin.core.util.PlatformException;
import com.ibeetl.admin.core.util.enums.DelFlagEnum;

/**
 * 描述: 字典 service，包含常规字典和级联字典的操作。
 * @author : xiandafu
 */
@Service
@Transactional
public class CoreDictService extends BaseService<CoreDict> {

    private static final Logger LOGGER = LoggerFactory.getLogger(CoreDictService.class);

    @Autowired
    private CoreDictDao dictDao;

    @Autowired
    CorePlatformService platformService;
    
    @Autowired 
    CoreDictService self ;

   

    /**
     * 新增一条数据,返回int型主键值
     * @param model 实体类
     * @return
     */
    public String saveReturnId(CoreDict model) {
        dictDao.insert(model);
        platformService.clearDictCache();
        return model.getValue();
    }

    /**
     * 更新
     * @param model 要更新的对象
     * @return
     */
    public boolean update(CoreDict model) {
        int count = dictDao.updateTemplateById(model);
        if (count > 0) {
            platformService.clearDictCache();
        }
        return count > 0;
    }

   


    /**
     * 根据类型获取字典集合
     * @param type 字典类型，
     * @return List
     */
    @Cacheable(value = CorePlatformService.DICT_CACHE_TYPE)
    public List<CoreDict> findAllByType(String type) {
        return dictDao.findAllList(type);
    }
    
    @Cacheable(value = CorePlatformService.DICT_CACHE_CHILDREN)
    public List<CoreDict> findChildrenByValue(String value) {
    		return self.findChildByParent(value);
    }
    
    @Cacheable(value = CorePlatformService.DICT_CACHE_VALUE)
    public CoreDict findCoreDict(String value) {
 	   CoreDict dict =  dictDao.unique(value);
 	   return dict;
    }
   
    /**
     * 级联字典，查询字典值后的所有子孙字典
     * @param value
     * @return
     */
    public List<List<CoreDict>> batchFindChidren(String value){
	    	List<List<CoreDict>>  all = new ArrayList();
	    	List<CoreDict> list = self.findChildrenByValue(value);
	    	if(list.isEmpty()) {
	    		return all;
	    	}else {
	    		all.add(list);
	    		addChildren(all,list.get(0));
	    	}
	    	return all;
    	
    }
    
    private void addChildren(List<List<CoreDict>> all,CoreDict first) {
	    	List<CoreDict> list = self.findChildrenByValue(first.getValue());
	    	if(list.size()==0) {
	    		return;
	    	}else {
	    		all.add(list);
	    		addChildren(all,list.get(0));
	    	}
    }
    
   
    /**
     * 级连字典数据，根据字典类型，获取每一级的字典第一项，用于页面展示，参考DictUpQueryFunction
     * @param type
     * @return
     */
    public List<CoreDict> findDefalutLevel(String type){
	    	CoreDict dict =  self.findAllByType(type).get(0);
	    	if(dict==null) {
	    		throw new PlatformException("字典不存在 ,type="+type);
	    	}
	    	List<CoreDict> level = new ArrayList<CoreDict>(); 
	    	level.add(dict);
	    	while(dict!=null) {
	    		dict = self.getFirstCoreDictByParent(dict.getValue());
	    		if(dict!=null) {
	    			level.add(dict);
	    		}else {
	    			break;
	    		}
	    	}
	    	return level;
    }
    
    /**
     * 级联字典，根据最末端的值，向上找到级联的每个字典
     * @param value
     * @return
     */
    public List<CoreDict> findLevelByValue(String value){
	    	List<CoreDict> level = new ArrayList<CoreDict>(); 
	    	CoreDict dict = self.findCoreDict(value);
	    	if(dict==null) {
	    		throw new PlatformException("字典不存在,value= "+value);
	    	}
	    	level.add(dict);
	    	while(dict!=null) {
	    		String  strParentId = dict.getParent();
	    		if(StringUtils.isEmpty(strParentId)) {
	    			break;
	    		}
	    		dict = self.findCoreDict(strParentId);
	    		level.add(0,dict);
	    	}
	    	
	    	return level;
      	
    }
    
   
   
   public CoreDict getFirstCoreDict(String type) {
	   CoreDict dict =  (CoreDict)dictDao.createQuery().lambda().andEq(CoreDict::getType, type).desc(CoreDict::getSort).single();
	   return dict;
   }
   
   public CoreDict getFirstCoreDictByParent(String value) {
	   List<CoreDict> list = self.findChildrenByValue(value);
	   if(list.size()==0) {
		   return null;
	   }
	   return list.get(0);
   }
   
    /**
     * 查询字段类型列表
     * @return
     */
    public List<Map<String, String>> findTypeList() {
        return dictDao.findTypeList(DelFlagEnum.NORMAL.getValue());
    }

    /**
     * 级联字段下一级的字段列表
     * @param parentValue
     * @return
     */
    public List<CoreDict> findChildByParent(String parentValue) {
        return dictDao.findChildByParent(parentValue);
    }

    
  
}
