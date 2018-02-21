package com.ibeetl.admin.core.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibeetl.admin.core.dao.CoreRoleDao;
import com.ibeetl.admin.core.entity.CoreRole;
import com.ibeetl.admin.core.util.enums.DelFlagEnum;
import com.ibeetl.admin.core.util.enums.RoleTypeEnum;

/**
 * 描述: 字典 service，包含常规字典和级联字典的操作。
 * @author : xiandafu
 */
@Service
@Transactional
public class CoreRoleService extends BaseService<CoreRole> {

    private static final Logger LOGGER = LoggerFactory.getLogger(CoreRoleService.class);

    @Autowired
    private CoreRoleDao roleDao;
    
    
    public List<CoreRole> getAllRoles(String type){
    	CoreRole template = new CoreRole();
    	template.setType(type);
    	return roleDao.template(template);
    }
   

    
    
  
}
