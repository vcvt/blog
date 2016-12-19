package com.blog.util;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期处理类
 * Created by Administrator
 */
public class DateJsonValueProcessor implements JsonValueProcessor{
    private String format;

    public DateJsonValueProcessor(String format) {
        this.format = format;
    }

    @Override
    public Object processArrayValue(Object value, JsonConfig jsonConfig) {
        return null;
    }

    @Override
    public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
        if(value == null){
            return "";
        }
        if (value instanceof Timestamp){
            String str = new SimpleDateFormat(format).format((Timestamp)value);
            return str;
        }
        if (value instanceof Date){
            String str = new SimpleDateFormat(format).format((Date)value);
            return str;
        }
        return value.toString();
    }
}
