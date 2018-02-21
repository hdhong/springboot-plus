layui.define([ 'form', 'laydate', 'table' ], function(exports) {
	var form = layui.form;
	var laydate = layui.laydate;
	var table = layui.table;
	var entityTable = null;
	var view ={
		
		init:function(){
			this.initTable();
			this.initSearchForm();
			this.initToolBar();
			window.dataReload = function(){
				Lib.doSearchForm($("#searchForm"),roleTable,form)
			}
			
			
		},
		initTable:function(){
			entityTable = table.render({
				elem : '#entityTable',
				height : Lib.getTableHeight(1),
				method : 'post',
				url : Common.CTX + '/admin/entity/list.json' //数据接口
				,page : Lib.tablePage //开启分页
				,limit : 10,
				cols : [ [ //表头
				{
					type : 'checkbox',
					fixed:'left',
				}, 

				] ]

			});
		},
		
		initSearchForm:function(){
			Lib.initSearchForm( $("#searchForm"),entityTable,form);
		},
		initToolBar:function(){
			toolbar = {
					add : function() { //获取选中数据
						var url = "/admin/entity/add.do";
						Common.openDlg(url,"CmsBlog管理>新增");
					},
					edit : function() { //获取选中数目
						var data = Common.getOneFromTable(table,"entityTable");
						if(data==null){
							return ;
						}
						var url = "/admin/entity/edit.do?id="+data.id;
						Common.openDlg(url,"CmsBlog管理>"+data.