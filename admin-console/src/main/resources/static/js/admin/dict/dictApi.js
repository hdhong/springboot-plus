/*访问后台的代码*/
layui.define([], function(exports) {
	var api={
			updateDict:function(callback){
				Lib.submitForm($('#updateForm'),{},callback)
			},
			addDict:function(callback){
				Lib.submitForm($('#addForm'),{},callback)
			},
			del:function(ids,callback){
				Common.post("/admin/dict/delete.json",{"ids":ids},function(){
					callback();
				})
			}
		
	};
	
	 exports('dictApi',api);
	
});