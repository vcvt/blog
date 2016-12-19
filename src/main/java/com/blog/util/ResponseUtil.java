package com.blog.util;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Created by Administrator
 */
public class ResponseUtil {

    public static void write(HttpServletResponse response,Object object) throws Exception{
        response.setContentType("test/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(object.toString());
        out.flush();
        out.close();
    }
}
