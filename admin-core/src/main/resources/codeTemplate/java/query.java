package ${package};

import com.ibeetl.admin.core.annotation.Query;
import com.ibeetl.admin.core.util.enums.CoreDictType;
import com.ibeetl.admin.core.web.query.PageParam;
import java.util.Date;
/**
 *${entity.displayName}查询
 */
public class ${entity.name}Query extends PageParam {
@for(attr in attrs) {
    \@Query(name = "${attr.displayName}", display = true)
    private ${attr.javaType} ${attr.name};
@}
@for(attr in attrs) {
    public ${attr.javaType} get${upperFirst(attr.name)}(){
        return  ${attr.name};
    }
    public void set${upperFirst(attr.name)}(${attr.javaType} ${attr.name} ){
        this.${attr.name} = ${attr.name};
    }
@}
 
}
