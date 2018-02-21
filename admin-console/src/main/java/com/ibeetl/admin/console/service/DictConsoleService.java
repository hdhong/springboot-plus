package com.ibeetl.admin.console.service;

import java.util.List;

import org.beetl.sql.core.engine.PageQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibeetl.admin.console.dao.DictConsoleDao;
import com.ibeetl.admin.core.entity.CoreDict;
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

    public void batchDelCoreDict(List<String> ids){
        try {
            dictDao.batchDelCoreDictByIds(ids);
        } catch (Exception e) {
            throw new PlatformException("批量删除CoreDict失败", e);
        }
    }
}