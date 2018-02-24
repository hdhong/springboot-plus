package com.ibeetl.admin.core.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibeetl.admin.core.gen.AutoGen;
import com.ibeetl.admin.core.gen.HtmlGen;
import com.ibeetl.admin.core.gen.JSGen;
import com.ibeetl.admin.core.gen.JavaCodeGen;
import com.ibeetl.admin.core.gen.MavenProjectTarget;
import com.ibeetl.admin.core.gen.MdGen;
import com.ibeetl.admin.core.gen.WebTarget;
import com.ibeetl.admin.core.gen.model.Attribute;
import com.ibeetl.admin.core.gen.model.Entity;
import com.ibeetl.admin.core.service.CoreCodeGenService;
import com.ibeetl.admin.core.util.PlatformException;

@Controller
public class CoreCodeGenController {
	private final Log log = LogFactory.getLog(this.getClass());
	private static final String MODEL = "/core/codeGen";

	@Autowired
	CoreCodeGenService codeGenService;

	@GetMapping(MODEL + "/index.do")
	public ModelAndView index() {
		ModelAndView view = new ModelAndView("/core/codeGen/index.html");
		return view;

	}

	@GetMapping(MODEL + "/tableDetail.do")
	public ModelAndView tableDetail(String table) {
		ModelAndView view = new ModelAndView("/core/codeGen/edit.html");
		Entity entity = codeGenService.getEntityInfo(table);
		view.addObject("entity", entity);
		return view;

	}

	@PostMapping(MODEL + "/table.json")
	@ResponseBody
	public JsonResult<List<Entity>> getTable() {
		List<Entity> list = codeGenService.getAllEntityInfo();
		return JsonResult.success(list);
	}

	@PostMapping(MODEL + "/tableDetail.json")
	@ResponseBody
	public JsonResult<Entity> getInfo(String table) {
		Entity entity = codeGenService.getEntityInfo(table);
		if (entity == null) {
			JsonResult.failMessage("表不存在");
		}
		return JsonResult.success(entity);

	}

	@PostMapping(MODEL + "/gen.json")
	@ResponseBody
	public JsonResult gen(EntityInfo data) {
		Entity  entity = getEntitiyInfo(data);;
		String urlBase = data.getUrlBase();
		String basePackage = data.getBasePackage();
		
		MavenProjectTarget target = new MavenProjectTarget(entity, basePackage);
		target.setUrlBase(urlBase);

		JSGen jsGen = new JSGen();
		jsGen.make(target, entity);

		HtmlGen htmlGen = new HtmlGen();
		htmlGen.make(target, entity);

		JavaCodeGen javaGen = new JavaCodeGen(basePackage, entity);
		javaGen.make(target, entity);

		MdGen mdGen = new MdGen();
		mdGen.make(target, entity);
		return JsonResult.success();

	}

	@PostMapping(MODEL + "/html.json")
	@ResponseBody
	public JsonResult<Map<String, String>> html(EntityInfo data) {
		
		Entity entity = getEntitiyInfo(data);
		String urlBase = data.getUrlBase();
		String basePackage = data.getBasePackage();
		WebTarget webTarget = new WebTarget(entity, basePackage);
		webTarget.setUrlBase(urlBase);
		HtmlGen htmlGen = new HtmlGen();
		htmlGen.make(webTarget, entity);
		Map<String, String> content = new HashMap<String, String>();
		for (Entry<Object, String> entry : webTarget.map.entrySet()) {
			AutoGen gen = (AutoGen) entry.getKey();
			String code = entry.getValue();
			content.put(gen.getName(), code);
		}
		return JsonResult.success(content);

	}
	
	@PostMapping(MODEL + "/js.json")
	@ResponseBody
	public JsonResult<Map<String, String>> js(EntityInfo data) {
		
		Entity entity = getEntitiyInfo(data);
		String urlBase = data.getUrlBase();
		String basePackage = data.getBasePackage();
		WebTarget webTarget = new WebTarget(entity, basePackage);
		webTarget.setUrlBase(urlBase);
		JSGen jsGen = new JSGen();
		jsGen.make(webTarget, entity);
		Map<String, String> content = new HashMap<String, String>();
		for (Entry<Object, String> entry : webTarget.map.entrySet()) {
			AutoGen gen = (AutoGen) entry.getKey();
			String code = entry.getValue();
			content.put(gen.getName(), code);
		}
		return JsonResult.success(content);

	}
	
	@PostMapping(MODEL + "/java.json")
	@ResponseBody
	public JsonResult<Map<String, String>> javaCode(EntityInfo data) {
		
		Entity entity = getEntitiyInfo(data);
		String urlBase = data.getUrlBase();
		String basePackage = data.getBasePackage();
		WebTarget webTarget = new WebTarget(entity, basePackage);
		webTarget.setUrlBase(urlBase);
		JavaCodeGen javaGen = new JavaCodeGen(basePackage,entity);
		javaGen.make(webTarget, entity);
		Map<String, String> content = new HashMap<String, String>();
		for (Entry<Object, String> entry : webTarget.map.entrySet()) {
			AutoGen gen = (AutoGen) entry.getKey();
			String code = entry.getValue();
			content.put(gen.getName(), code);
		}
		return JsonResult.success(content);

	}
	
	@PostMapping(MODEL + "/sql.json")
	@ResponseBody
	public JsonResult<Map<String, String>> sql(EntityInfo data) {
		
		Entity entity = getEntitiyInfo(data);
		String urlBase = data.getUrlBase();
		String basePackage = data.getBasePackage();
		WebTarget webTarget = new WebTarget(entity, basePackage);
		webTarget.setUrlBase(urlBase);
		MdGen javaGen = new MdGen();
		javaGen.make(webTarget, entity);
		Map<String, String> content = new HashMap<String, String>();
		for (Entry<Object, String> entry : webTarget.map.entrySet()) {
			AutoGen gen = (AutoGen) entry.getKey();
			String code = entry.getValue();
			content.put(gen.getName(), code);
		}
		return JsonResult.success(content);

	}
	
	private Entity getEntitiyInfo(EntityInfo data) {
		Entity info = data.getEntity();
		String urlBase = data.getUrlBase();
		String basePackage = data.getBasePackage();
		Entity entity = codeGenService.getEntityInfo(info.getTableName());
		entity.setCode(info.getCode());
		entity.setDisplayName(info.getDisplayName());
		entity.setSystem(info.getSystem());
		for (int i = 0; i < entity.getList().size(); i++) {
		    Attribute attr = entity.getList().get(i);
		    attr.setDisplayName(info.getList().get(i).getDisplayName());
		    attr.setShowInQuery(info.getList().get(i).isShowInQuery());
		    if(attr.getName().equals(data.getNameAttr())) {
		        entity.setNameAttribute(attr);
		    }
			
		}

		if (StringUtils.isEmpty(entity.getCode()) || StringUtils.isEmpty(entity.getSystem())) {
			throw new PlatformException("code,system不能为空");
		}
		
		
		
		return entity;
	}

	@GetMapping(MODEL + "/{table}/test.json")
	@ResponseBody
	public void test(@PathVariable String table) {

		Entity entity = new Entity();
		entity.setCode("blog");
		entity.setName("CmsBlog");
		entity.setDisplayName("博客");
		entity.setTableName("CMS_BLOG");
		entity.setSystem("console");

		Attribute idAttr = new Attribute();
		idAttr.setColName("id");
		idAttr.setJavaType("Long");
		idAttr.setName("id");
		idAttr.setDisplayName("编号");
		idAttr.setId(true);
		entity.setIdAttribute(idAttr);

		Attribute nameAttr = new Attribute();
		nameAttr.setColName("title");
		nameAttr.setJavaType("String");
		nameAttr.setName("title");
		nameAttr.setDisplayName("标题");
		nameAttr.setShowInQuery(true);

		Attribute contentAttr = new Attribute();
		contentAttr.setColName("content");
		contentAttr.setJavaType("String");
		contentAttr.setName("content");
		contentAttr.setDisplayName("内容");
		contentAttr.setShowInQuery(true);

		Attribute createTimeAttr = new Attribute();
		createTimeAttr.setColName("create_time");
		createTimeAttr.setJavaType("Date");
		createTimeAttr.setName("createTime");
		createTimeAttr.setDisplayName("创建日期");
		createTimeAttr.setShowInQuery(true);

		Attribute createUserIdAttr = new Attribute();
		createUserIdAttr.setColName("create_user_id");
		createUserIdAttr.setJavaType("Long");
		createUserIdAttr.setName("createUserId");
		createUserIdAttr.setDisplayName("创建人");
		createUserIdAttr.setShowInQuery(true);

		Attribute typeAttr = new Attribute();
		typeAttr.setColName("type");
		typeAttr.setJavaType("String");
		typeAttr.setName("type");
		typeAttr.setDisplayName("博客类型");
		typeAttr.setShowInQuery(true);

		entity.getList().add(idAttr);
		entity.getList().add(nameAttr);
		entity.getList().add(contentAttr);
		entity.getList().add(createTimeAttr);
		entity.getList().add(createUserIdAttr);
		entity.getList().add(typeAttr);

		entity.setNameAttribute(nameAttr);
		entity.setComment("这是一个测试模型");
		// ConsoleTarget target = new ConsoleTarget();

		String basePackage = "com.ibeetl.admin.console";
		MavenProjectTarget target = new MavenProjectTarget(entity, basePackage);
		target.setUrlBase("admin");

		JSGen jsGen = new JSGen();
		jsGen.make(target, entity);

		HtmlGen htmlGen = new HtmlGen();
		htmlGen.make(target, entity);

		JavaCodeGen javaGen = new JavaCodeGen(basePackage, entity);
		javaGen.make(target, entity);

		MdGen mdGen = new MdGen();
		mdGen.make(target, entity);

	}

}

class EntityInfo {
	Entity entity;
	String urlBase;
	String basePackage;
	String nameAttr;

	public Entity getEntity() {
		return entity;
	}

	public void setEntity(Entity entity) {
		this.entity = entity;
	}

	public String getUrlBase() {
		return urlBase;
	}

	public void setUrlBase(String urlBase) {
		this.urlBase = urlBase;
	}

	public String getBasePackage() {
		return basePackage;
	}

	public void setBasePackage(String basePackage) {
		this.basePackage = basePackage;
	}

    public String getNameAttr() {
        return nameAttr;
    }

    public void setNameAttr(String nameAttr) {
        this.nameAttr = nameAttr;
    }

}
