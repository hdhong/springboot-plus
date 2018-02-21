layui.define([ 'form', 'laydate', 'table','consoleApi'], function(exports) {
	var form = layui.form;
	var consoleApi = layui.consoleApi;
	var index = layui.index;
	var view = {
			init:function(){
				Lib.initGenrealForm($("#updateForm"),form);
				this.initSubmit();
			},
			initSubmit:function(){
				$("#updateButton").click(function(){
					consoleApi.updateConsole(function(){
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