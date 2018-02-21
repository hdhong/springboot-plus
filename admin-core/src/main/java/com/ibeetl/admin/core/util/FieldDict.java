package com.ibeetl.admin.core.util;

import com.ibeetl.admin.core.annotation.Dict;

public class FieldDict {
	String defaultValue= "";
	String suffix;
	String type ;
	String field ;
	
	public FieldDict(String field,String type){
		this(field,type,"Text",null);
	}
	
	public FieldDict(String field,Dict dict){
		this(field,dict.type(),dict.suffix(),dict.defaultDisplay());
	}
	
	
	public FieldDict(String field,String type,String suffix,String defaultValue){
		this.field = field;
		this.type = type;
		this.suffix = suffix;
		this.defaultValue = defaultValue;
	}



	public String getDefaultValue() {
		return defaultValue;
	}



	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}



	public String getSuffix() {
		return suffix;
	}



	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getField() {
		return field;
	}



	public void setField(String field) {
		this.field = field;
	}
	
	public String getDisplayField(){
		return this.field+this.suffix;
	}
	
	
}
