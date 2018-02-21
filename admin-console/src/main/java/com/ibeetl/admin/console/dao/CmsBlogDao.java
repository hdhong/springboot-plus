package com.ibeetl.admin.console.dao;

import java.util.List;

import org.beetl.sql.core.annotatoin.SqlResource;
import org.beetl.sql.core.mapper.BaseMapper;
import org.beetl.sql.core.engine.PageQuery;

import  com.ibeetl.admin.console.entity.*;

/**
 * CmsBlog Dao
 */
@SqlResource("console.cmsBlog")
public interface CmsBlogDao extends BaseMapper<CmsBlog>{
    public PageQuery<CmsBlog> queryByCondition(PageQuery query);
    public void batchDelCmsBlogByIds( List<Long> ids);
}