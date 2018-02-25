package com.ibeetl.admin.console.entity;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

import org.beetl.sql.core.annotatoin.AutoID;
import org.beetl.sql.core.annotatoin.SeqID;

import com.ibeetl.admin.core.util.ValidateConfig;

import org.beetl.sql.core.TailBean;
import java.math.*;
import com.ibeetl.admin.core.entity.BaseEntity;

/* 
* 
* gen by Spring Boot2 Admin 2018-02-24
*/
public class CmsBlog extends BaseEntity{

    @NotNull(message = "ID不能为空", groups =ValidateConfig.UPDATE.class)
    @SeqID(name = ORACLE_CORE_SEQ_NAME)
    @AutoID	
    private Integer id ;
	
    private String title ;
	
    private String content ;
	
    private Date createTime ;
	
    private Integer createUserId ;
	
    private String type ;
	
    public CmsBlog()
    {
    }

    public Integer getId(){
	    return  id;
    }
    public void setId(Integer id){
        this.id = id;
    }

    public String getTitle(){
	    return  title;
    }
    public void setTitle(String title){
        this.title = title;
    }

    public String getContent(){
	    return  content;
    }
    public void setContent(String content){
        this.content = content;
    }

    public Date getCreateTime(){
	    return  createTime;
    }
    public void setCreateTime(Date createTime){
        this.createTime = createTime;
    }

    public Integer getCreateUserId(){
	    return  createUserId;
    }
    public void setCreateUserId(Integer createUserId){
        this.createUserId = createUserId;
    }

    public String getType(){
	    return  type;
    }
    public void setType(String type){
        this.type = type;
    }


}
