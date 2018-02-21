package com.ibeetl.admin.console.service;

import java.util.Date;
import java.util.List;

import org.beetl.sql.core.engine.PageQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibeetl.admin.console.dao.UserConsoleDao;
import com.ibeetl.admin.console.exception.DeletedException;
import com.ibeetl.admin.console.exception.NoResourceException;
import com.ibeetl.admin.console.web.query.UserRoleQuery;
import com.ibeetl.admin.core.conf.PasswordConfig.PasswordEncryptService;
import com.ibeetl.admin.core.entity.CoreUser;
import com.ibeetl.admin.core.entity.CoreUserRole;
import com.ibeetl.admin.core.service.BaseService;
import com.ibeetl.admin.core.util.PlatformException;
import com.ibeetl.admin.core.util.enums.DelFlagEnum;
import com.ibeetl.admin.core.util.enums.GeneralStateEnum;

@Service
@Transactional
public class UserConsoleService extends BaseService<CoreUser> {

	@Autowired
	UserConsoleDao userDao;
	
	@Autowired
	PasswordEncryptService passwordEncryptService;

	/**
	 * 根据条件查询
	 *
	 * @param query
	 */
	public void queryByCondtion(PageQuery<CoreUser> query) {
		PageQuery<CoreUser> ret = userDao.queryByCondtion(query);
		queryListAfter(ret.getList());
	}

	/**
	 * 插入一条用户数据
	 *
	 * @param user
	 */
	public void saveUser(CoreUser user) {
		CoreUser query = new CoreUser();
		query.setCode(user.getCode());
		CoreUser dbUser = userDao.templateOne(query);
		if (dbUser != null) {
			throw new PlatformException("保存用户信息失败,用户已经存在");
		}
		user.setCreateTime(new Date());
        user.setState(GeneralStateEnum.ENABLE.getValue());
		user.setPassword(passwordEncryptService.password(user.getPassword()));
		user.setDelFlag(DelFlagEnum.NORMAL.getValue());
		userDao.insert(user,true);
		
	}

	/**
	 * 根据用户id查询一条数据
	 *
	 * @param userId
	 */
	public CoreUser queryUserById(Long userId) {
		return userDao.unique(userId);
	}

	/**
	 * 更新用户 只更新不为空的字段
	 *
	 * @param user
	 * @return
	 */
	public int updateSysUser(CoreUser user) {
		return userDao.updateTemplateById(user);
	}

	/**
	 * 删除用户
	 *
	 * @param userId
	 *            用户id
	 */
	public void delSysUser(Long userId) {
		CoreUser user = queryUserById(userId);
		if (user == null) {
			throw new NoResourceException("用户不存在!");
		}
		if (user.getDelFlag()==DelFlagEnum.DELETED.getValue()) {
			throw new DeletedException("用户已被删除!");
		}
		user = new CoreUser();
		user.setId(userId);
		user.setDelFlag(DelFlagEnum.DELETED.getValue());
		userDao.updateTemplateById(user);
	}

	/**
	 * 批量删除用户 <br/>
	 * 软删除 标记用户删除状态
	 *
	 * @param userIds
	 *            用户id
	 */
	public void batchDelSysUser(List<Long> userIds) {
		try {
			userDao.batchDelUserByIds(userIds);
		} catch (Exception e) {
			throw new PlatformException("批量删除用户失败", e);
		}
	}

	/**
	 * 批量停用用户 <br/>
	 * 标记用户状态 停用
	 *
	 * @param userIds
	 *            用户id
	 */
	public void batchUpdateUserState(List<Long> userIds, GeneralStateEnum stateEnum) {
		userDao.batchUpdateUserState(userIds, stateEnum);
	}

	/**
	 * 重置用户密码
	 *
	 * @param uId
	 * @param password
	 */
	public int resetPassword(Long id, String password) {
		CoreUser user = new CoreUser();
		user.setId(id);
		user.setPassword(passwordEncryptService.password(password));
		user.setUpdateTime(new Date());
		return userDao.updateTemplateById(user);
	}
	
	  public List<CoreUserRole> getUserRoles(UserRoleQuery roleQuery) {
	        return userDao.queryUserRole(roleQuery.getUserId(),roleQuery.getOrgId(),roleQuery.getRoleId());
	  }
	  
	  public void deleteUserRoles(List<Long> ids) {
	        //考虑到这个操作较少使用，就不做批处理优化了
	        for (Long id : ids) {
	        	sqlManager.deleteById(CoreUserRole.class, id);
	        }

	    }
	    
	    public void saveUserRole(CoreUserRole userRole) {

	        long queryCount = sqlManager.templateCount(userRole);

	        if (queryCount > 0) {
	            throw new PlatformException("已存在用户角色关系");
	        }
	        sqlManager.insert(userRole);
	    }

}
