/*访问后台的代码*/
layui.define([], function(exports) {
    var api={
            updateCmsBlog:function(form,callback){
                Lib.submitForm("/admin/cmsBlog/update.json",form,{},callback)
            },
            addCmsBlog:function(form,callback){
                Lib.submitForm("/admin/cmsBlog/add.json",form,{},callback)
            },
            del:function(ids,callback){
                Common.post("/admin/cmsBlog/delete.json",{"ids":ids},function(){
                    callback();
                })
            }
		
    };
    exports('cmsBlogApi',api);
});