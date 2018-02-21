layui.define(['table', 'entityApi'], function(exports) {
	var entityApi = layui.entityApi;
	var table=layui.table;
	var view = {
			init:function(){
				
			},
			delBatch:function(){
				var data = Common.getMoreDataFromTable(table,"entityTable");
				if(data==null){
					return ;
				}
				Common.openConfirm("确认要删除这些CmsBlog?",function(){
					var ids =Common.concatBatchId(data);
					entityApi.del(ids,function(){
						Common.info("删除成功");
						dataReload();
					})
				})
				
			}
				
	}
	 exports('del',view);
	
});