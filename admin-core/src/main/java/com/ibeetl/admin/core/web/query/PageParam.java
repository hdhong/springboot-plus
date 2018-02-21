package com.ibeetl.admin.core.web.query;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.beetl.sql.core.engine.PageQuery;

/**
 * 子类继承此类获得翻页功能
 * @author lijiazhi
 */
public class PageParam {
    private Integer page = null;
    private Integer limit = null;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    @JsonIgnore
    public PageQuery getPageQuery() {
        PageQuery query = new PageQuery();
        query.setParas(this);
        if (page != null) {
            query.setPageNumber(page);
            query.setPageSize(limit);
        }
        return query;
    }

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}


}
