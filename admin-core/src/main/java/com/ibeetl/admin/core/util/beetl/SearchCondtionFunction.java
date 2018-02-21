package com.ibeetl.admin.core.util.beetl;


import java.util.List;
import java.util.Map;

import org.beetl.core.Context;
import org.beetl.core.Function;
import org.beetl.ext.simulate.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibeetl.admin.core.annotation.Query;
import com.ibeetl.admin.core.util.AnnotationUtil;

/**
 * 描述: 通过解析注解，获取表达查询条件信息
 *
 * @author : lijiazhi
 */
@Component
public class SearchCondtionFunction implements Function {

	
    /**
     *
     * @param paras 查询条件类名
     * @param ctx
     * @return
     */
    @Override
    public Object call(Object[] paras, Context ctx) {
        String className = (String) paras[0];
        try {
            List<Map<String, Object>> list = AnnotationUtil.getInstance().getAnnotations(Query.class, Class.forName(className));
            return list;
        } catch (ClassNotFoundException e ) {
            e.printStackTrace();
            return null;
        }
    }
}
