/*访问后台的代码*/
layui.define([], function(exports) {
	var api={
			updateUser:function(callback){
				Lib.submitForm($('#updateForm'),{},callback)
			},
			addUser:function(callback){
				Lib.submitForm($('#addForm'),{},callback)
			},
			del:function(ids,callback){
				Common.post("/admin/user/delete.json",{"ids":ids},function(){
					callback();
				})
			},
			changePassword:function(callback){
				Lib.submitForm($('#changePasswordForm'),{},callback)
			},
			addUserRole:function(form,callback){
				Lib.submitForm(form,{},callback)
			},
			delUserRole:function(ids,callback){
				Common.post("/admin/user/role/delete.json",{"ids":ids},function(){
					callback();
				})
			},
		
	};
	
	 exports('userApi',api);
	
});