package ${package};

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
* ${comment}
* gen by Spring Boot2 Admin ${date(),"yyyy-MM-dd"}
*/
public class ${className} extends BaseEntity{

    @for(attr in attrs){
	@if(!isEmpty(attr.comment)){
	//${attr.comment}
	@}
	@if(attr.isId) {
    \@NotNull(message = "ID不能为空", groups =ValidateConfig.UPDATE.class)
    \@SeqID(name = ORACLE_CORE_SEQ_NAME)
    \@AutoID	
	@}
    private ${attr.type} ${attr.name} ;
	
	@}
    public ${className}()
    {
    }

    @for(attr in attrs){
	@if(!isEmpty(attr.comment)){
	/**${attr.comment}
	*\@return 
	*/
	@}
    public ${attr.type} get${attr.methodName}(){
	    return  ${attr.name};
    }
	@if(!isEmpty(attr.comment)){
	/**${attr.comment}
	*\@param  ${attr.name}
	*/
	@}
    public void set${attr.methodName}(${attr.type} ${attr.name}){
        this.${attr.name} = ${attr.name};
    }

    @}

}
