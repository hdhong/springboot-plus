/*访问后台的代码*/
layui.define([], function(exports) {
	var api={
			updateCmsBlog:function(callback){
				Lib.submitForm($('#updateForm'),{},callback)
			},
			addCmsBlog:function(callback){
				Lib.submitForm($('#addForm'),{},callback)
			},
			del:function(ids,callback){
				Common.post("/admin/cmsBlog/delete.json",{"ids":ids},function(){
					callback();
				})
			}
		
	};
	
	 exports('cmsBlogApi',api);
	
});