/*访问后台的代码*/
layui.define([], function(exports) {
	var api={
			updateConsole:function(callback){
				Lib.submitForm($('#updateForm'),{},callback)
			},
			addConsole:function(callback){
				Lib.submitForm($('#addForm'),{},callback)
			},
			del:function(ids,callback){
				Common.post("/admin/console/delete.json",{"ids":ids},function(){
					callback();
				})
			}
		
	};
	
	 exports('consoleApi',api);
	
});