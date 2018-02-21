queryByCondition
===


    select 
    \@pageTag(){
    t.*
    \@}
    from ${entity.tableName} t
    where 1=1  
    \@//数据权限，该sql语句功能点  
    and #function("${entity.code}.query")#
    @for(attr in entity.list){
    		@if(attr.showInQuery){
    \@if(!isEmpty(${attr.name})){
        and  t.${attr.colName} =#${attr.name}#
    \@}
    		@}
    @}
    
    
    

batchDel${entity.name}ByIds
===

* 批量逻辑删除

    update ${entity.tableName} set del_flag = 1 where ${entity.idAttribute.colName}  in( #join(ids)#)
    
