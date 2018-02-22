layui.define([ 'form', 'laydate', 'table','menuApi'], function(exports) {
	var form = layui.form;
	var menuApi = layui.menuApi;
	var index = layui.index;
	var view = {
			init:function(){
				Lib.initGenrealForm($("#addForm"),form);
				this.initSubmit();
				$('#parentMenuId').val(0);
				$('#seq').val(1);
			},
			initSubmit:function(){
				$("#saveMenu").click(function(){
					menuApi.addMenu(function(){
						Common.info("添加成功");
						Lib.closeFrame();
					});
					parent.window.dataReload();
					
				});
				
				$("#saveMenu-cancel").click(function(){
					Lib.closeFrame();
				});
			}
				
	}
	 exports('add',view);
	
});