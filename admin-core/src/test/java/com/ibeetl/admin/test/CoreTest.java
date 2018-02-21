package com.ibeetl.admin.test;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;

import com.coamc.xlsunit.RowHolderFacotoy;
import com.coamc.xlsunit.VariableTable;
import com.coamc.xlsunit.XLSParser;
import com.ibeetl.admin.core.entity.CoreOrg;
import com.ibeetl.admin.core.rbac.UserLoginInfo;
import com.ibeetl.admin.core.rbac.tree.OrgItem;
import com.ibeetl.admin.core.service.CorePlatformService;
import com.ibeetl.admin.core.service.CoreUserService;

import junit.framework.Assert;


@RunWith(SpringRunner.class)
@SpringBootTest
public class CoreTest extends BaseXLSUnitTest{

	@Autowired
	CorePlatformService  platformService;
	
	@Autowired 
	CoreUserService sysUserService;
	
	XLSParser userParser = null;
	
	@Before
	public void init() {
		super.init();
		userParser = new XLSParser(BaseXLSUnitTest.loader, "coreTest.xlsx", dbAccess,
				new RowHolderFacotoy.RowBeetlSQLHolderFactory());
	
	}
	
	@Test
	public void testUserLogin() {
		VariableTable vars = new VariableTable();
		userParser.init(vars);
		//执行某个测试场景的初始化工作，初始化user表
		userParser.prepare("用户相关测试", vars);
		String password = vars.findString("user.password");
		
		UserLoginInfo userInfo = sysUserService.login("jk01", password);
		if(userInfo==null){
			fail("用户未找到");
		}
		List<CoreOrg> orgs = userInfo.getOrgs();
		
	}
	
	@Test
	public void testOrgInfo() {
		VariableTable vars = new VariableTable();
		userParser.init(vars);
		//执行某个测试场景的初始化工作，初始化user表
		userParser.prepare("用户相关测试", vars);
		
		Long adminId = vars.findLong("user.adminId");
		//根节点,能看到所有
		Long orgId = 1l;
		super.login(adminId, orgId);
		
		OrgItem root = platformService.getUserOrgTree();
		//超级管理员可以看到所有组织结构
		org.junit.Assert.assertEquals(1l, root.getId().longValue());
		
			
		//研发管理员,能看到所在公司的结果
		Long jkItManager = vars.findLong("user.deptAdmin");
		Long departmentId = vars.findLong("org.it");
		long corpId = vars.findLong("org.jk");
		
		super.login(jkItManager, corpId);
		OrgItem deptItem = platformService.getUserOrgTree();
		org.junit.Assert.assertEquals(corpId, deptItem.getId().longValue());
	}
	
	
	@Test
	public void testFunctionAccess() {
		VariableTable vars = new VariableTable();
		userParser.init(vars);
		//执行某个测试场景的初始化工作，初始化user表
		userParser.prepare("用户相关测试", vars);
		
		Long adminId = vars.findLong("user.adminId");
		//根节点,能看到所有
		Long orgId = 1l;
		super.login(adminId, orgId);
		
		boolean access = platformService.canAcessFunction(adminId, orgId, "user");
		org.junit.Assert.assertTrue(access);
		access = platformService.canAcessFunction(adminId, orgId, "user.edit");
		org.junit.Assert.assertTrue(access); 	
		
		Long ceo = vars.findLong("user.corpCEO");
		Long corpId = vars.findLong("org.jk");
		
		super.login(ceo, corpId);
	    access = platformService.canAcessFunction(ceo, corpId, "user.query");
		org.junit.Assert.assertTrue(access);
		//ceo 不能编辑
		access = platformService.canAcessFunction(ceo, corpId, "user.edit");
		org.junit.Assert.assertFalse(access);
		
		
		
		Long assist = vars.findLong("user.assist");
		super.login(assist, corpId);
		access = platformService.canAcessFunction(assist, corpId, "user.query");
		org.junit.Assert.assertTrue(access);
		// 助理能编辑用户 
		access = platformService.canAcessFunction(assist, corpId, "user.edit");
		org.junit.Assert.assertTrue(access);
	}
	
	
	
}