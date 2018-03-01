package com.ibeetl.admin.console.service;

import java.util.List;

import org.beetl.sql.core.engine.PageQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibeetl.admin.console.dao.DictConsoleDao;
import com.ibeetl.admin.core.entity.CoreDict;
import com.ibeetl.admin.core.entity.CoreUser;
import com.ibeetl.admin.core.service.BaseService;
import com.ibeetl.admin.core.util.PlatformException;

/**
 * CoreDict Service
 */

@Service
@Transactional
public class DictConsoleService extends BaseService<CoreDict>{

    @Autowired private DictConsoleDao dictDao;

    public PageQuery<CoreDict>queryByCondition(PageQuery query){
        PageQuery ret =  dictDao.queryByCondition(query);
        queryListAfter(ret.getList());
        return ret;
    }

    public void batchDelCoreDict(List<Long> ids){
        try {
        	//TODO,找到数据字典所有子类，设置删除标记
            dictDao.batchDelCoreDictByIds(ids);
        } catch (Exception e) {
            throw new PlatformException("批量删除CoreDict失败", e);
        }
    }
    public List<CoreDict> queryExcel(PageQuery<CoreUser> query) {
        //同查询，不需要额外数据
        PageQuery ret =  dictDao.queryByCondition(query);
        queryListAfter(ret.getList());
        return ret.getList();
        
    }
    
    public void batchInsert(List<CoreDict> list) {
        dictDao.insertBatch(list);
    }
    
    
}