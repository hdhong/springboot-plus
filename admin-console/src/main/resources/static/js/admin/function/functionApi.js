/*访问后台的代码*/
layui.define([], function(exports) {
	var api={
			updateFunction:function(callback){
				Lib.submitForm($('#updateForm'),{},callback)
			},
			addFunction:function(callback){
				Lib.submitForm($('#addForm'),{},callback)
			},
			del:function(ids,callback){
				Common.post("/admin/function/batchDel.json",{"ids":ids},function(){
					callback();
				})
			}
			
		
	};
	
	 exports('functionApi',api);
	
});