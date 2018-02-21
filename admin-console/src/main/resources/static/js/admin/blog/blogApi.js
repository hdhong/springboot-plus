/*访问后台的代码*/
layui.define([], function(exports) {
	var api={
			updateBlog:function(callback){
				Lib.submitForm($('#updateForm'),{},callback)
			},
			addBlog:function(callback){
				Lib.submitForm($('#addForm'),{},callback)
			},
			del:function(ids,callback){
				Common.post("/admin/blog/delete.json",{"ids":ids},function(){
					callback();
				})
			}
		
	};
	
	 exports('blogApi',api);
	
});