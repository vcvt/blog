package com.blog.realm;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator
 */
public class MyRealm extends AuthorizingRealm {

    @Resource
    private BloggerService bloggerService;
    //为当前登录的用户授予角色和权限
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //个人博客不需要进行角色和权限认证，因为就一个用户
        return null;
    }

    //对当前登录用户进行身份验证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal(); //根据刚刚传过来的获取用户名
        Blogger blogger = bloggerService.getByUsername(username);   //根据用户名查找博主信息
        if (blogger != null) {
            SecurityUtils.getSubject().getSession().setAttribute("currentUser", blogger); //把当前用户存到session中
            //把从数据库中查询出来的博主信息放到authenticationInfo中返回给shiro
            AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(blogger.getUsername(), blogger.getPassword(), "MyRealm");
            return authenticationInfo;
        } else {
            return null;
        }
    }
}
