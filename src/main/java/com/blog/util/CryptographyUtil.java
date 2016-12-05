package com.blog.util;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * Created by Administrator
 */
public class CryptographyUtil {

//    使用Shiro中的md5加密
    public static String md5(String str, String salt){
        return new Md5Hash(str,salt).toString();
    }

    //测试
    public static void main(String[] args) {
        String password = "1234";
        System.out.println("Md5加密:" + md5(password,"vcvt"));
    }
}

