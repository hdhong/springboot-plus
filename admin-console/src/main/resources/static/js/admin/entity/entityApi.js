/*访问后台的代码*/
layui.define([], function(exports) {
	var api={
			updateEntity:function(callback){
				Lib.submitForm($('#updateForm'),{},callback)
			},
			addEntity:function(callback){
				Lib.submitForm($('#addForm'),{},callback)
			},
			del:function(ids,callback){
				Common.post("/admin/entity/delete.json",{"ids":ids},function(){
					callback();
				})
			}
		
	};
	
	 exports('entityApi',api);
	
});