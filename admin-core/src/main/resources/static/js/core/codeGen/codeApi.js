/*访问后台的代码*/
layui.define([], function(exports) {
	var api={
			gen:function(callback){
				Lib.submitForm($('#updateForm'),{},callback)
			},
			previewHtml:function(callback){
				var form = $('#updateForm');
				var formPara = form.serializeJson();
				Common.post("/core/codeGen/html.json", formPara, callback);
			},
			previewJs:function(callback){
				var form = $('#updateForm');
				var formPara = form.serializeJson();
				Common.post("/core/codeGen/js.json", formPara, callback);
			},
			previewJava:function(callback){
				var form = $('#updateForm');
				var formPara = form.serializeJson();
				Common.post("/core/codeGen/java.json", formPara, callback);
			},
			previewSql:function(callback){
				var form = $('#updateForm');
				var formPara = form.serializeJson();
				Common.post("/core/codeGen/sql.json", formPara, callback);
			}
		
	};
	
	 exports('codeApi',api);
	
});