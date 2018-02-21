package com.ibeetl.admin.console.dao;

import org.beetl.sql.core.annotatoin.Param;
import org.beetl.sql.core.annotatoin.SqlResource;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.mapper.BaseMapper;

import com.ibeetl.admin.core.entity.CoreOrg;

import java.util.List;

@SqlResource("console.org")
public interface OrgConsoleDao extends BaseMapper<CoreOrg> {

   
 

    void queryByCondtion(PageQuery query);

    void batchDelByIds(@Param(value = "ids") List<Long> ids);
}
