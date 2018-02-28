package com.ibeetl.admin.console.web;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

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

import com.ibeetl.admin.console.service.DictConsoleService;
import com.ibeetl.admin.console.web.query.CoreDictQuery;
import com.ibeetl.admin.core.annotation.Function;
import com.ibeetl.admin.core.entity.CoreDict;
import com.ibeetl.admin.core.util.ConvertUtil;
import com.ibeetl.admin.core.util.ValidateConfig;
import com.ibeetl.admin.core.web.JsonResult;

/**
 * CoreDict 接口
 */
@Controller
public class DictConsoleController{

    private final Log log = LogFactory.getLog(this.getClass());
    private static final String MODEL = "/admin/dict";


    @Autowired private DictConsoleService dictService;

    /* 页面 */

    @GetMapping(MODEL + "/index.do")
    @Function("dict.query")
    public ModelAndView index() {
        ModelAndView view = new ModelAndView("/admin/dict/index.html") ;
        view.addObject("search", CoreDictQuery.class.getName());
        return view;
    }

    @GetMapping(MODEL + "/edit.do")
    @Function("dict.edit")
    public ModelAndView edit(Long id) {
        ModelAndView view = new ModelAndView("/admin/dict/edit.html");
        CoreDict dict = dictService.queryById(id);
        view.addObject("dict", dict);
        return view;
    }

    @GetMapping(MODEL + "/add.do")
    @Function("dict.add")
    public ModelAndView add() {
        ModelAndView view = new ModelAndView("/admin/dict/add.html");
        return view;
    }

    /* ajax json */

    @PostMapping(MODEL + "/list.json")
    @Function("dict.query")
    @ResponseBody
    public JsonResult<PageQuery> list(CoreDictQuery condtion)
    {
        PageQuery page = condtion.getPageQuery();
        dictService.queryByCondition(page);
        return JsonResult.success(page);
    }

    @PostMapping(MODEL + "/add.json")
    @Function("dict.add")
    @ResponseBody
    public JsonResult add(@Validated(ValidateConfig.ADD.class)CoreDict dict)
    {
        dict.setCreateTime(new Date());
        dictService.save(dict);
        return new JsonResult().success();
    }

    @PostMapping(MODEL + "/update.json")
    @Function("dict.update")
    @ResponseBody
    public JsonResult<String> update(@Validated(ValidateConfig.UPDATE.class)  CoreDict dict) {
        boolean success = dictService.update(dict);
        if (success) {
            return new JsonResult().success();
        } else {
            return JsonResult.failMessage("保存失败");
        }
    }


   
    @GetMapping(MODEL + "/view.json")
    @Function("dict.query")
    @ResponseBody
    public JsonResult<CoreDict>queryInfo(Long id) {
        CoreDict dict = dictService.queryById(id);
        return  JsonResult.success(dict);
    }
    

    @PostMapping(MODEL + "/delete.json")
    @Function("dict.delete")
    @ResponseBody
    public JsonResult delete(String ids) {
    	List<Long> dels = ConvertUtil.str2longs(ids);
        dictService.batchDelCoreDict(dels);
        return new JsonResult().success();
    }

}
