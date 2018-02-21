layui.define([ 'form', 'laydate', 'table','cmsBlogApi'], function(exports) {
	var form = layui.form;
	var cmsBlogApi = layui.cmsBlogApi;
	var index = layui.index;
	var view = {
			init:function(){
				Lib.initGenrealForm($("#addForm"),form);
				this.initSubmit();
			},
			initSubmit:function(){
				$("#addButton").click(function(){
					cmsBlogApi.addCmsBlog(function(){
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