layui.define([ 'form', 'laydate', 'table','codeApi'], function(exports) {
	var form = layui.form;
	var codeApi = layui.codeApi;
	var index = layui.index;
	var view = {
			init:function(){
				Lib.initGenrealForm($("#updateForm"),form);
				this.initSubmit();
			},
			initSubmit:function(){
				var that = this;
				toolbar = {
						html:function() { //获取选中数据
							codeApi.previewHtml(function(data){
								that.openCode(data)
							});
						},
						js:function() { //获取选中数目
							codeApi.previewJs(function(data){
								that.openCode(data)
							});
							
						},
						java:function() { //获取选中数目
							codeApi.previewJava(function(data){
								that.openCode(data)
							});
							
						},
						sql:function() { //获取选中数目
							codeApi.previewSql(function(data){
								that.openCode(data)
							});
							
						},
						gen:function(){
							codeApi.gen(function(){
								Common.info("代码生成成功，请刷新工程");
								Lib.closeFrame();
							});
						},
						cancel:function(){
							Lib.closeFrame();
						}
						
					};
				$('.ext-toolbar').on('click', function() {
					var type = $(this).data('type');
					toolbar[type] ? toolbar[type].call(this) : '';
				});
				
				
			},
			openCode:function(data){
				var tab=[];
				for(var key in data){
					var title = key;
					var content = this.formatCode(key,data[key]);
					tab.push({"title":title,"content":content}); 
				}
				var index = layer.tab({
					  area: ['600px', '500px'],
					  tab:tab,
					  success: function(layero, index){
						  layui.use('code', function(){ //加载code模块
							  layui.code({
								  about: false
							  }); //引用code方法
						});
					  }
				});
				layer.full(index);
				
			},
			formatCode:function( name,content){
				if(name.indexOf(".html")){
					content =  $('<div/>').text(content).html(); 
				}
				
				content = "<pre class='layui-code'>"+content+"<pre>";
				return content;
			}
				
	}
	
	
	
	 exports('edit',view);
	
});