layui.define([ 'form', 'laydate', 'table' ], function(exports) {
    var form = layui.form;
    var laydate = layui.laydate;
    var table = layui.table;
    var ${entity.code}Table = null;
    var view ={
        init:function(){
            this.initTable();
            this.initSearchForm();
            this.initToolBar();
            window.dataReload = function(){
                Lib.doSearchForm($("#searchForm"),${entity.code}Table)
            }
        },
        initTable:function(){
            ${entity.code}Table = table.render({
                elem : '#${entity.code}Table',
                height : Lib.getTableHeight(1),
                method : 'post',
                url : Common.ctxPath + '/${target.urlBase}/${entity.code}/list.json' // 数据接口
                ,page : Lib.tablePage // 开启分页
                ,limit : 10,
                cols : [ [ // 表头
                {
                type : 'checkbox',
                fixed:'left',
                }, 
                @for(attr in entity.list){
                {
                field : '${attr.name}',
                title : '${attr.displayName}',
                @if(attrLP.first){
                fixed:'left',
                @}
                @if(attr.javaType=="date"){
                templet:function(d){
                	return Common.getDate(d.${attr.name});
                },
                @}
                width : 100,
                }${!attrLP.last?","} 
                @}
        
                ] ]
        
            });
        },
        	
        initSearchForm:function(){
            Lib.initSearchForm( $("#searchForm"),${entity.code}Table,form);
        },
        initToolBar:function(){
            toolbar = {
                add : function() { // 获取选中数据
                    var url = "/${target.urlBase}/${entity.code}/add.do";
                    Common.openDlg(url,"${entity.displayName}管理>新增");
                },
                edit : function() { // 获取选中数目
                    var data = Common.getOneFromTable(table,"${entity.code}Table");
                    if(data==null){
                        return ;
                    }
                    var url = "/${target.urlBase}/${entity.code}/edit.do?${entity.idAttribute.name}="+data.${entity.idAttribute.name};
                    Common.openDlg(url,"${entity.displayName}管理>"+data.${entity.nameAttribute.name}+">编辑");
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