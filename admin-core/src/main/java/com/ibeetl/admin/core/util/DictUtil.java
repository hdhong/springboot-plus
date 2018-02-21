package com.ibeetl.admin.core.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ibeetl.admin.core.entity.CoreDict;
import com.ibeetl.admin.core.service.CoreDictService;

/**
 * 描述:
 * @author : xiandafu
 */
@Component
public class DictUtil {
  
    @Autowired
    CoreDictService platformDictService;
    
 
    

    /**
     * 根据字典值和类型，得到字典显示内容
     * @param value        字典值
     * @param type         字典类型 参考 @link{com.}
     * @param defaultValue
     * @return
     */
    public String getDictName(String value) {
    		CoreDict dict = platformDictService.findCoreDict(value);
        return dict.getName();
    }

  

}
