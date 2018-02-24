layui.define(['table', 'cmsBlogApi'], function(exports) {
    var cmsBlogApi = layui.cmsBlogApi;
    var table=layui.table;
    var view = {
        init:function(){
        },
        delBatch:function(){
            var data = Common.getMoreDataFromTable(table,"cmsBlogTable");
            if(data==null){
                return ;
            }
            Common.openConfirm("确认要删除这些CmsBlog?",function(){
            var ids =Common.concatBatchId(data,"id");
            cmsBlogApi.del(ids,function(){
                Common.info("删除成功");
                    dataReload();
                })
            })
        }
    }
    exports('del',view);
	
});