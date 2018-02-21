/*访问后台的代码*/
layui.define([], function(exports) {
	var api={
			update${upperFirst(entity.code)}:function(callback){
				Lib.submitForm($('#updateForm'),{},callback)
			},
			add${upperFirst(entity.code)}:function(callback){
				Lib.submitForm($('#addForm'),{},callback)
			},
			del:function(ids,callback){
				Common.post("/${target.urlBase}/${entity.code}/delete.json",{"ids":ids},function(){
					callback();
				})
			}
		
	};
	
	 exports('${entity.code}Api',api);
	
});