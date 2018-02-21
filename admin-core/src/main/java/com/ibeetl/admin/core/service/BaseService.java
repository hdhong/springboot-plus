package com.ibeetl.admin.core.service;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.beetl.sql.core.SQLManager;
import org.beetl.sql.core.TailBean;
import org.beetl.sql.core.db.KeyHolder;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibeetl.admin.core.annotation.Dict;
import com.ibeetl.admin.core.util.DictUtil;
import com.ibeetl.admin.core.util.FieldDict;
import com.ibeetl.admin.core.util.PlatformException;
import com.ibeetl.admin.core.util.enums.DelFlagEnum;

/**
 * 描述:
 * @author : xiandafu
 */
public class BaseService<T> {

    @Autowired
    protected DictUtil dictUtil;
    @Autowired
    protected SQLManager sqlManager;
    
    

    /**
     * 根据id查询对象，如果主键ID不存在
     * @param id
     * @return
     */
    public T queryById(Object id) {
        T t = sqlManager.single(getCurrentEntityClassz(), id);
        queryEntityAfter((Object) t);			
        return t;
    }

    /**
     * 根据id查询
     * @param classz 返回的对象类型
     * @param id     主键id
     * @return
     */
    public T queryById(Class<T> classz, Object id) {
        T t = sqlManager.unique(classz, id);
        queryEntityAfter((Object) t);
        return t;
    }

    /**
     * 新增一条数据
     * @param model 实体类
     * @return
     */
    public boolean save(T model) {
        return sqlManager.insert(model,true) > 0;
    }

   

    /**
     * 删除数据（一般为逻辑删除，更新del_flag字段为1）
     * @param ids
     * @return
     */
    public boolean deleteById(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            throw new PlatformException("删除数据ID不能为空");
        }
        
        for (Long id : ids) {
          
        }

        List<Object> list = new ArrayList<>();
        for (Long id : ids) {
            Map map = new HashMap();
            // always id,delFlag for pojo
            map.put("id", id);
            map.put("delFlag", DelFlagEnum.DELETED.getValue());
          
            list.add(map);
        }
        int[] count = sqlManager.updateBatchTemplateById(getCurrentEntityClassz(), list);
        int successCount = 0;
        for (int successFlag : count) {
            successCount += successFlag;
        }
        return successCount == ids.size();
    }

    public boolean deleteById(Long id) {
       
            Map map = new HashMap();
            // always id,delFlag for pojo
            map.put("id", id);
            map.put("delFlag", DelFlagEnum.DELETED.getValue());
            int ret = sqlManager.updateTemplateById(getCurrentEntityClassz(), map);
            return ret==1;
    }
    /**
     * 根据id删除数据
     * @param id 主键值
     * @return
     */
    public int forceDelete(Long id) {
        return sqlManager.deleteById(getCurrentEntityClassz(), id);
    }

    /**
     * 根据id删除数据
     * @param id 主键值
     * @return
     */
    public int forceDelete(Class<T> classz, Long id) {
        return sqlManager.deleteById(classz, id);
    }

    /**
     * 更新，只更新不为空的字段
     * @param model
     * @return
     */
    public boolean updateTemplate(T model) {
        return sqlManager.updateTemplateById(model)>0;
    }

    /**
     * 更新所有字段
     * @param model
     * @return
     */
    public boolean update(T model) {
    		return sqlManager.updateById(model) > 0;
    }

  

    /**
     * 获取当前注入泛型T的类型
     * @return 具体类型
     */
    @SuppressWarnings("unchecked")
    private Class<T> getCurrentEntityClassz() {
        return (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }
    
    public void queryListAfter(List list,FieldDict[] more){
    	 for (Object bean : list) {
             queryEntityAfter(bean,more);
         }
    }
    
    public void queryEntityAfter(Object  bean){
    	 this.queryEntityAfter(bean, null);
    }

    public void queryListAfter(List list) {
        for (Object bean : list) {
            queryEntityAfter(bean);
        }
    }

    public void queryEntityAfter(Object  bean,FieldDict[] more) {
        if (bean == null) {
            return;
        }
        
        if(!(bean instanceof TailBean)){
        	throw new PlatformException("指定的pojo"+bean.getClass()+" 不能获取数据字典，需要继承TailBean");
        }
        
        TailBean ext  = (TailBean)bean;
        Field[] fields = ext.getClass().getDeclaredFields();
        for (Field field : fields) {
            if (field.isAnnotationPresent(Dict.class)) {
                field.setAccessible(true);
                Dict dict = field.getAnnotation(Dict.class);
                
                try {
                    String display = "";
                    Object fieldValue = field.get(ext);
                    if (fieldValue != null) {
                        display = dictUtil.getDictName(fieldValue.toString());
                    }
                    ext.set(field.getName() + dict.suffix(), display);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        }
        
        if(more==null){
        	return ;
        }
        
        for(FieldDict desc:more){
        	
        	Object fieldValue = ext.get(desc.getField());
        	String display = "";
        	if (fieldValue != null) {
                display = dictUtil.getDictName(fieldValue.toString());
            }
        	ext.set(desc.getDisplayField(), display);
        	
        }
        
    }

}
