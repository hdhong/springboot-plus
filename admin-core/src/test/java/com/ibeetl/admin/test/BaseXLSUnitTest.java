package com.ibeetl.admin.test;

import java.util.List;

import org.beetl.sql.core.SQLManager;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.coamc.xlsunit.BeetlSqlDBAccess;
import com.coamc.xlsunit.XLSFileLoader;
import com.coamc.xlsunit.XLSLoader;
import com.ibeetl.admin.core.entity.CoreOrg;
import com.ibeetl.admin.core.entity.CoreUser;
import com.ibeetl.admin.core.service.CorePlatformService;
import com.ibeetl.admin.core.service.CoreUserService;
import com.ibeetl.admin.core.util.HttpRequestLocal;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional 
public class BaseXLSUnitTest {
protected BeetlSqlDBAccess dbAccess = null;
	
	@Autowired
	protected SQLManager sqlManager;
	
	@MockBean
	protected HttpRequestLocal httpRequestLocal;
	
	
	@Autowired
	protected CoreUserService userService;
	
	public static XLSLoader loader = null;
	@BeforeClass
	public static void initData(){
		
		String root = System.getProperty("user.dir")+"/src/test/resources/xls";
		loader = new XLSFileLoader(root);
	}

	public void init() {
		dbAccess = new BeetlSqlDBAccess(sqlManager);
		
	}
	/**
	 * 模拟用户登录
	 * @param userId
	 * @param orgId
	 */
	protected void login(Long userId,Long orgId){
		CoreUser user = userService.getUserById(userId);
		CoreOrg org = userService.getOrgById(orgId);
		List<CoreOrg> orgs = userService.getUserOrg(userId,orgId);
		Mockito.when(httpRequestLocal.getSessionValue(Mockito.eq(CorePlatformService.ACCESS_CURRENT_USER))).thenReturn(user);
		Mockito.when(httpRequestLocal.getSessionValue(Mockito.eq(CorePlatformService.ACCESS_CURRENT_ORG))).thenReturn(org);
		Mockito.when(httpRequestLocal.getSessionValue(Mockito.eq(CorePlatformService.ACCESS_USER_ORGS))).thenReturn(orgs);
		Mockito.when(httpRequestLocal.getSessionValue(Mockito.eq("ip"))).thenReturn("127.0.01");
		
	}
    @Test
    public void testSkip(){

    }

	
}
