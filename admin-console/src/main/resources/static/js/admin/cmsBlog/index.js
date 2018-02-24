layui.define([ 'form', 'laydate', 'table' ], function(exports) {
    var form = layui.form;
    var laydate = layui.laydate;
    var table = layui.table;
    var cmsBlogTable = null;
    var view ={
        init:function(){
            this.initTable();
            this.initSearchForm();
            this.initToolBar();
            window.dataReload = function(){
                Lib.doSearchForm($("#searchForm"),cmsBlogTable,form)
            }
        },
        initTable:function(){
            cmsBlogTable = table.render({
                elem : '#cmsBlogTable',
                height : Lib.getTableHeight(1),
                method : 'post',
                url : Common.CTX + '/admin/cmsBlog/list.json' // 数据接口
                ,page : Lib.tablePage // 开启分页
                ,limit : 10,
                cols : [ [ // 表头
                {
                type : 'checkbox',
                fixed:'left',
                }, 
                {
                field : 'id',
                title : 'id',
                fixed:'left',
                width : 100,
                }, 
                {
                field : 'title',
                title : 'title',
                width : 100,
                }, 
                {
                field : 'content',
                title : 'content',
                width : 100,
                }, 
                {
                field : 'createTime',
                title : 'createTime',
                width : 100,
                }, 
                {
                field : 'createUserId',
                title : 'createUserId',
                width : 100,
                }, 
                {
                field : 'type',
                title : 'type',
                width : 100,
                } 
        
                ] ]
        
            });
        },
        	
        initSearchForm:function(){
            Lib.initSearchForm( $("#searchForm"),cmsBlogTable,form);
        },
        initToolBar:function(){
            toolbar = {
                add : function() { // 获取选中数据
                    var url = "/admin/cmsBlog/add.do";
                    Common.openDlg(url,"CmsBlog管理>新增");
                },
                edit : function() { // 获取选中数目
                    var data = Common.getOneFromTable(table,"cmsBlogTable");
                    if(data==null){
                        return ;
                    }
                    var url = "/admin/cmsBlog/edit.do?id="+data.id;
                    Common.openDlg(url,"CmsBlog管理>"+data.title+">编辑");
                },
                del : function() { 
                    layui.use(['del'], function(){
                        var delView = layui.del
                        delView.delBatch();
                    });
                }
            };
            $('.ext-toolbar').on('click', function() {
                var type = $(this).data('type');
                toolbar[type] ? toolbar[type].call(this) : '';
            });
        }
	}
    exports('index',view);
	
});