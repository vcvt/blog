package com.blog.util;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator
 * 字符串工具类
 */
public class StringUtil {
    public static boolean isEmpty(String str){
        if(str == null || "".equals(str.trim())){
            return true;
        }else {
            return false;
        }
    }
    //格式化模糊查询
    public static String formatLike(String str){
        if(!isEmpty(str)){
            return "%" + str + "%";
        }else {
            return null;
        }
    }

    //过滤集合中的空格
    public static List<String> filterWhite(List<String> list){
        List<String> resultList = new ArrayList<>();
        for(String l:list){
            if(!isEmpty(l)) {
                resultList.add(l);
            }
        }
        return resultList;
    }
}
