package itravel.controller.admin;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//@WebFilter(filterName = "AdminAuthenticationFilter")
@WebFilter("/admin/*")
public class AdminAuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        System.out.println("AuthenticationFilter ---1-------");

//        http://localhost:8080/filter_demo_war_exploded/login
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        String action = req.getServletPath();

        //it shouldnot block css, jpg ...
        if(action.matches(".*[css|jpg|png|gif|js].*")){
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        System.out.println("URL:"+action);

        if("/admin".equals(action) || "/admin/login".equals(action) || "/admin/adminLogin.jsp".equals(action)){
            filterChain.doFilter(servletRequest, servletResponse);
        } else{
            System.out.println("checking value:");
            Object isLoggedObj = req.getSession().getAttribute("isLoggedIn");
            if(isLoggedObj != null){
                boolean isLoggedIn = (Boolean) isLoggedObj;
                if(isLoggedIn){
                    filterChain.doFilter(servletRequest, servletResponse);
                    return;
                }
            }
//            http://localhost:8080/filter_demo_war_exploded/
            String path = req.getContextPath()+ "/admin/login";
            resp.sendRedirect(path);
        }
//        System.out.println("AuthenticationFilter ---2-------");
    }

}
