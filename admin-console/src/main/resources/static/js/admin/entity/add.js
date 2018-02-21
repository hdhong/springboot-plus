layui.define([ 'form', 'laydate', 'table','entityApi'], function(exports) {
	var form = layui.form;
	var entityApi = layui.entityApi;
	var index = layui.index;
	var view = {
			init:function(){
				Lib.initGenrealForm($("#addForm"),form);
				this.initSubmit();
			},
			initSubmit:function(){
				$("#addButton").click(function(){
					entityApi.addEntity(function(){
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