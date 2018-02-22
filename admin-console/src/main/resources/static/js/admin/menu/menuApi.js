/*访问后台的代码*/
layui.define([], function(exports) {
	var api={
			updateMenu:function(callback){
				Lib.submitForm($('#updateForm'),{},callback)
			},
			addMenu:function(callback){
				Lib.submitForm($('#addForm'),{},callback)
			},
			del:function(ids,callback){
				Common.post("/admin/menu/batchDel.json",{"ids":ids},function(){
					callback();
				})
			}
			
		
	};
	
	 exports('menuApi',api);
	
});