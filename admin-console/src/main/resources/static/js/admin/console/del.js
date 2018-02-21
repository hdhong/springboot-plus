layui.define(['table', 'consoleApi'], function(exports) {
	var consoleApi = layui.consoleApi;
	var table=layui.table;
	var view = {
			init:function(){
				
			},
			delBatch:function(){
				var data = Common.getMoreDataFromTable(table,"consoleTable");
				if(data==null){
					return ;
				}
				Common.openConfirm("确认要删除这些CmsBlog?",function(){
					var ids =Common.concatBatchId(data);
					consoleApi.del(ids,function(){
						Common.info("删除成功");
						dataReload();
					})
				})
				
			}
				
	}
	 exports('del',view);
	
});