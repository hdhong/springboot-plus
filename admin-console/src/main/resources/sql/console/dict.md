queryByCondition
===


    select 
    @pageTag(){
    t.*
    @}
    from core_dict t
    where del_flag=0  
    @//数据权限，该sql语句功能点  
    and #function("dict.query")#
    @if(!isEmpty(value)){
        and  t.VALUE =#value#
    @}
    @if(!isEmpty(name)){
        and  t.NAME =#name#
    @}
    @if(!isEmpty(typeName)){
        and  t.TYPE_NAME =#typeName#
    @}
    @if(!isEmpty(parent)){
        and  t.PARENT =#parent#
    @}
	@pageIgnoreTag(){
		order by create_time  desc
	@}
	    
    
    

batchDelCoreDictByIds
===

* 批量逻辑删除

    update core_dict set del_flag = 1 where value in( #join(ids)#)
    
