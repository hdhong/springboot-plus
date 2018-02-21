layui.define(['table', 'blogApi'], function(exports) {
	var blogApi = layui.blogApi;
	var table=layui.table;
	var view = {
			init:function(){
				
			},
			delBatch:function(){
				var data = Common.getMoreDataFromTable(table,"blogTable");
				if(data==null){
					return ;
				}
				Common.openConfirm("确认要删除这些CmsBlog?",function(){
					var ids =Common.concatBatchId(data);
					blogApi.del(ids,function(){
						Common.info("删除成功");
						dataReload();
					})
				})
				
			}
				
	}
	 exports('del',view);
	
});