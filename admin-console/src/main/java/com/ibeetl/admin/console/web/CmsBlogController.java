package com.ibeetl.admin.console.web;

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
import com.ibeetl.admin.console.entity.*;
import com.ibeetl.admin.console.service.*;
import com.ibeetl.admin.console.web.query.*;

/**
 * CmsBlog 接口
 */
@Controller
public class CmsBlogController{

    private final Log log = LogFactory.getLog(this.getClass());
    private static final String MODEL = "/admin/cmsBlog";


    @Autowired private CmsBlogService cmsBlogService;

    /* 页面 */

    @GetMapping(MODEL + "/index.do")
    @Function("cmsBlog.query")
    public ModelAndView index() {
        ModelAndView view = new ModelAndView("/admin/cmsBlog/index.html") ;
        view.addObject("search", CmsBlogQuery.class.getName());
        return view;
    }

    @GetMapping(MODEL + "/edit.do")
    @Function("cmsBlog.edit")
    public ModelAndView edit(Long id) {
        ModelAndView view = new ModelAndView("/admin/cmsBlog/edit.html");
        CmsBlog cmsBlog = cmsBlogService.queryById(id);
        view.addObject("cmsBlog", cmsBlog);
        return view;
    }

    @GetMapping(MODEL + "/add.do")
    @Function("cmsBlog.add")
    public ModelAndView add() {
        ModelAndView view = new ModelAndView("/admin/cmsBlog/add.html");
        return view;
    }

    /* ajax json */

    @PostMapping(MODEL + "/list.json")
    @Function("cmsBlog.query")
    @ResponseBody
    public JsonResult<PageQuery> list(CmsBlogQuery condtion)
    {
        PageQuery page = condtion.getPageQuery();
        cmsBlogService.queryByCondition(page);
        return JsonResult.success(page);
    }

    @PostMapping(MODEL + "/add.json")
    @Function("cmsBlog.add")
    @ResponseBody
    public JsonResult addCmsBlog(@Validated(ValidateConfig.ADD.class)CmsBlog cmsBlog)
    {
        cmsBlogService.save(cmsBlog);
        return new JsonResult().success();
    }

    @PostMapping(MODEL + "/update.json")
    @Function("cmsBlog.update")
    @ResponseBody
    public JsonResult<String> update(@Validated(ValidateConfig.UPDATE.class)  CmsBlog cmsBlog) {
        boolean success = cmsBlogService.update(cmsBlog);
        if (success) {
            return new JsonResult().success();
        } else {
            return JsonResult.failMessage("保存失败");
        }
    }


   
    @GetMapping(MODEL + "/view.json")
    @Function("cmsBlog.query")
    @ResponseBody
    public JsonResult<CmsBlog>queryInfo(Long id) {
        CmsBlog cmsBlog = cmsBlogService.queryById(id);
        return  JsonResult.success(cmsBlog);
    }

    @PostMapping(MODEL + "/delete.json")
    @Function("cmsBlog.delete")
    @ResponseBody
    public JsonResult delete(String ids) {
        if (ids.endsWith(",")) {
            ids = StringUtils.substringBeforeLast(ids, ",");
        }
        List<Long> idList = ConvertUtil.str2longs(ids);
        cmsBlogService.batchDelCmsBlog(idList);
        return new JsonResult().success();
    }

}
