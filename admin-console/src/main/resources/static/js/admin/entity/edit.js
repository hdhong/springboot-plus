layui.define([ 'form', 'laydate', 'table','entityApi'], function(exports) {
	var form = layui.form;
	var entityApi = layui.entityApi;
	var index = layui.index;
	var view = {
			init:function(){
				Lib.initGenrealForm($("#updateForm"),form);
				this.initSubmit();
			},
			initSubmit:function(){
				$("#updateButton").click(function(){
					entityApi.updateEntity(function(){
						parent.window.dataReload();
						Common.info("更新成功");
						Lib.closeFrame();
					});
					
					
				});
				
				$("#updateButton-cancel").click(function(){
					Lib.closeFrame();
				});
			}
				
	}
	
	
	
	 exports('edit',view);
	
});