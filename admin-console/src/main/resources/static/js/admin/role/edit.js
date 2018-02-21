layui.define([ 'form', 'laydate', 'table','roleApi'], function(exports) {
	var form = layui.form;
	var roleApi = layui.roleApi;
	var index = layui.index;
	var view = {
			init:function(){
				Lib.initGenrealForm($("#updateForm"),form);
				this.initSubmit();
			},
			initSubmit:function(){
				$("#addButton").click(function(){
					roleApi.updateRole(function(){
						parent.window.dataReload();
						Common.info("更新成功");
						Lib.closeFrame();
					});
					
					
				});
				
				$("#addButton-cancel").click(function(){
					Lib.closeFrame();
				});
			}
				
	}
	
	
	
	 exports('edit',view);
	
});