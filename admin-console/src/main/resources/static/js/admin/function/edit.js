layui.define([ 'form', 'laydate', 'table','functionApi'], function(exports) {
	var form = layui.form;
	var functionApi = layui.functionApi;
	var index = layui.index;
	var view = {
			init:function(){
				Lib.initGenrealForm($("#updateForm"),form);
				this.initSubmit();
			},
			initSubmit:function(){
				$("#saveFunction").click(function(){
					functionApi.updateFunction(function(){
						Common.info("更新成功");
						Lib.closeFrame();
					});
					parent.window.dataReload();
					
				});
				
				$("#saveFunction-cancel").click(function(){
					Lib.closeFrame();
				});
			}
				
	}
	
	
	
	 exports('edit',view);
	
});