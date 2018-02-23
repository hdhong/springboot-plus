/*访问后台的代码*/
layui.define([], function(exports) {
    var api={
            update${upperFirst(entity.code)}:function(form,callback){
                Lib.submitForm("/${target.urlBase}/${entity.code}/update.json",form,{},callback)
            },
            add${upperFirst(entity.code)}:function(form,callback){
                Lib.submitForm("/${target.urlBase}/${entity.code}/add.json",form,{},callback)
            },
            del:function(ids,callback){
                Common.post("/${target.urlBase}/${entity.code}/delete.json",{"ids":ids},function(){
                    callback();
                })
            }
		
    };
    exports('${entity.code}Api',api);
});