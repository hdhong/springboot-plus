layui.define([ 'form', 'laydate', 'table','consoleApi'], function(exports) {
	var form = layui.form;
	var consoleApi = layui.consoleApi;
	var index = layui.index;
	var view = {
			init:function(){
				Lib.initGenrealForm($("#addForm"),form);
				this.initSubmit();
			},
			initSubmit:function(){
				$("#addButton").click(function(){
					consoleApi.addConsole(function(){
						parent.window.dataReload();
						Common.info("添加成功");
						Lib.closeFrame();
					});
					
					
				});
				
				$("#addButton-cancel").click(function(){
					Lib.closeFrame();
				});
			}
				
	}
	 exports('add',view);
});