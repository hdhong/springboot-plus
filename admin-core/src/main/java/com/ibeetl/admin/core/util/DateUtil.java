package com.ibeetl.admin.core.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    public static String now() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(new Date());
    }
    
    public static String now(String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(new Date());
    }
}
