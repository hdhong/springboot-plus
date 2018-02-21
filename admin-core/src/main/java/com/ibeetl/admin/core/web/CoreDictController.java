package com.ibeetl.admin.core.web;


import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibeetl.admin.core.entity.CoreDict;
import com.ibeetl.admin.core.service.CoreDictService;
import com.ibeetl.admin.core.service.CorePlatformService;
import com.ibeetl.admin.core.util.DictUtil;

@Controller
@SuppressWarnings("unchecked")
public class CoreDictController {
    private final Log log = LogFactory.getLog(this.getClass());
    private static final String MODEL = "/core/dict";

    @Autowired
    CorePlatformService platformService;

    @Autowired
    CoreDictService dictService;

    @Autowired
    DictUtil dictUtil;
 

    /**
     * 查看字典类型对应的列表
     * @param type
     * @return
     */
    @RequestMapping(MODEL + "/view.json")
    @ResponseBody
    public JsonResult<List<CoreDict>> view(String type) {
        List<CoreDict> list = dictService.findAllByType(type);
        return  JsonResult.success(list);
    }
    
    /**
     * 查看字典值的子字典
     * @param value
     * @return
     */
  
    @RequestMapping(MODEL + "/viewChildren.json")
    @ResponseBody
    public JsonResult<List<CoreDict>> viewChild(String value) {
        List<CoreDict> list = dictService.findChildrenByValue(value);
        return  JsonResult.success(list);
    }
    
    /**
     * 查看字典值的所有后代字典
     * @param value
     * @return
     */
    @RequestMapping(MODEL + "/batchViewChildren.json")
    @ResponseBody
    public JsonResult<List<List<CoreDict>>> batchViewChildren(String value) {
        List<List<CoreDict>> list = dictService.batchFindChidren(value);
        return  JsonResult.success(list);
    }

    


   
    /**
     * 批量获取字典数据
     * @param types
     * @return
     */
    @RequestMapping(MODEL + "/batchView.json")
    @ResponseBody
    public JsonResult<Map<String, List<CoreDict>>> batchView(String types) {
        String[] strs = types.split(",");
        //按照顺序返回
        Map<String, List<CoreDict>> map = new LinkedHashMap<String, List<CoreDict>>();
        for (int i = 0; i < strs.length; i++) {
            List<CoreDict> list = dictService.findAllByType(strs[i]);
            map.put(strs[i], list);
        }
        return JsonResult.success(map);
    }

}
