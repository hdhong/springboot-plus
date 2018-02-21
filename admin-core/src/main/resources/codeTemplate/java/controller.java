package ${package};

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.beetl.sql.core.engine.PageQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.ibeetl.admin.core.annotation.Function;
import com.ibeetl.admin.core.annotation.Query;
import com.ibeetl.admin.core.web.JsonResult;
import com.ibeetl.admin.core.util.*;
import ${basePackage}.entity.*;
import ${basePackage}.service.*;
import ${basePackage}.web.query.*;

/**
 * ${entity.displayName} 接口
 */
\@Controller
public class ${entity.name}Controller{

    private final Log log = LogFactory.getLog(this.getClass());
    private static final String MODEL = "/${target.urlBase}/${entity.code}";

    @var service=entity.code+"Service";

    \@Autowired private ${entity.name}Service ${service};

    /* 页面 */

    \@GetMapping(MODEL + "/index.do")
    \@Function("${entity.code}.query")
    \@ResponseBody
    public ModelAndView index() {
        ModelAndView view = new ModelAndView("/${target.urlBase}/${entity.code}/index.html") ;
        view.addObject("search", ${entity.name}Query.class.getName());
        return view;
    }

    \@GetMapping(MODEL + "/edit.do")
    \@Function("${entity.code}.edit")
    \@ResponseBody
    public ModelAndView edit(${entity.idAttribute.javaType} ${entity.idAttribute.name}) {
        ModelAndView view = new ModelAndView("/${target.urlBase}/${entity.code}/edit.html");
        ${entity.name} ${entity.code} = ${service}.queryById(${entity.idAttribute.name});
        view.addObject("${entity.code}", ${entity.code});
        return view;
    }

    \@GetMapping(MODEL + "/add.do")
    \@Function("${entity.code}.add")
    \@ResponseBody
    public ModelAndView add() {
        ModelAndView view = new ModelAndView("/${target.urlBase}/${entity.code}/add.html");
        return view;
    }

    /* ajax json */

    \@PostMapping(MODEL + "/list.json")
    \@Function("${entity.code}.query")
    \@ResponseBody
    public JsonResult<PageQuery> list(${entity.name}Query condtion)
    {
        PageQuery page = condtion.getPageQuery();
        ${service}.queryByCondition(page);
        return JsonResult.success(page);
    }

    \@PostMapping(MODEL + "/add.json")
    \@Function("${entity.code}.add")
    \@ResponseBody
    public JsonResult add(\@Validated(ValidateConfig.ADD.class)${entity.name} ${entity.code})
    {
        ${service}.save(${entity.code});
        return new JsonResult().success();
    }

    \@PostMapping(MODEL + "/update.json")
    \@Function("${entity.code}.update")
    \@ResponseBody
    public JsonResult<String> update(\@Validated(ValidateConfig.UPDATE.class)  ${entity.name} ${entity.code}) {
        boolean success = ${service}.update(${entity.code});
        if (success) {
            return new JsonResult().success();
        } else {
            return JsonResult.failMessage("保存失败");
        }
    }


   
    \@GetMapping(MODEL + "/view.json")
    \@Function("${entity.code}.query")
    \@ResponseBody
    public JsonResult<${entity.name}>queryInfo(${entity.idAttribute.javaType} ${entity.idAttribute.name}) {
        ${entity.name} ${entity.code} = ${service}.queryById( ${entity.idAttribute.name});
        return  JsonResult.success(${entity.code});
    }

    \@PostMapping(MODEL + "/delete.json")
    \@Function("${entity.code}.delete")
    \@ResponseBody
    public JsonResult delete(String ids) {
        if (ids.endsWith(",")) {
            ids = StringUtils.substringBeforeLast(ids, ",");
        }
        List<Long> idList = ConvertUtil.str2longs(ids);
        ${service}.batchDel${entity.name}(idList);
        return new JsonResult().success();
    }

}
