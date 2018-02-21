/*访问后台的代码*/
layui.define([], function(exports) {
	var api={
			updateOrg:function(callback){
				Lib.submitForm($('#updateForm'),{},callback)
			},
			addOrg:function(callback){
				Lib.submitForm($('#addForm'),{},callback)
			},
			del:function(ids,callback){
				Common.post("/admin/org/delete.json",{"ids":ids},function(){
					callback();
				})
			}
			
		
	};
	
	 exports('orgApi',api);
	
});