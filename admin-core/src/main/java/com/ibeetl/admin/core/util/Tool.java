package com.ibeetl.admin.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 常用工具类方法
 * 
 * @author lijiazhi
 *
 */
public class Tool {
	static final String DATE_FORAMT = "yyyy-MM-dd";
	static final String DATETIME_FORAMT = "yyyy-MM-dd hh:mm:ss";

	public static Date[] parseDataRange(String str) {
		//查询范围
		String[] arrays = str.split("至");
		Date min = parseDate(arrays[0]);
		Date max = parseDate(arrays[1]);
	
		return new Date[] { min,max };
	}

	public static Date parseDate(String str) {
		try {
			return new SimpleDateFormat(DATE_FORAMT).parse(str.trim());
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
	}
}
