package com.ibeetl.admin.console.service;

import java.util.List;

import org.beetl.sql.core.engine.PageQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibeetl.admin.core.util.PlatformException;

import com.ibeetl.admin.console.dao.CmsBlogDao;
import com.ibeetl.admin.console.entity.CmsBlog;
import com.ibeetl.admin.core.service.BaseService;

/**
 * CmsBlog Service
 */

@Service
@Transactional
public class CmsBlogService extends BaseService<CmsBlog>{

    @Autowired private CmsBlogDao cmsBlogDao;

    public PageQuery<CmsBlog>queryByCondition(PageQuery query){
        PageQuery ret =  cmsBlogDao.queryByCondition(query);
        queryListAfter(ret.getList());
        return ret;
    }

    public void batchDelCmsBlog(List<Long> ids){
        try {
            cmsBlogDao.batchDelCmsBlogByIds(ids);
        } catch (Exception e) {
            throw new PlatformException("批量删除CmsBlog失败", e);
        }
    }
}