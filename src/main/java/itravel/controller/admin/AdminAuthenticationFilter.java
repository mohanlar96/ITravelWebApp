package itravel.controller.admin;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

//@WebFilter(filterName = "AdminAuthenticationFilter")
@WebFilter({"/admin/*", "/admin"})
public class AdminAuthenticationFilter implements Filter {

    // Admin user authentication filter, it will affect to all URL starting /admin/*, /admin
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        String action = req.getServletPath();

        //it should not block css, jpg ...
        if (action.startsWith("/admin/css") || action.startsWith("/admin/js") || action.startsWith("/admin/img") || action.startsWith("/admin/bootstrap")) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        System.out.println("URL:" + action);

        // Read the session object
        Object isLoggedObj = req.getSession().getAttribute("isLoggedIn");

        // if not null, check if it is logged in successfully
        if (isLoggedObj != null) {
            boolean isLoggedIn = (Boolean) isLoggedObj;
            if (isLoggedIn) {//if logged in, dont show login page, go in to admin home page
                if("/admin".equals(action) || "/admin/login".equals(action) || "/admin/adminLogin.jsp".equals(action)){
                    servletResponse.setContentType("text/html");
                    PrintWriter pw = servletResponse.getWriter();
                    ((HttpServletResponse) servletResponse).sendRedirect("/admin/controlWords");
                    pw.close();
                    return;
                }
                // otherwise, go other pages in /admin url
                filterChain.doFilter(servletRequest, servletResponse);
                return;
            }
        }
        // if starts only /admin, redirect to admin/login
        if (action.equals("/admin")) {
            //if this happens, redirect to /admin/login
            servletResponse.setContentType("text/html");
            PrintWriter pw = servletResponse.getWriter();
            ((HttpServletResponse) servletResponse).sendRedirect("admin/login");
            pw.close();
            return;
        }
        // everything else, just serve.
        filterChain.doFilter(servletRequest, servletResponse);


//        // if never logged in, it will reach here.
//        if ("/admin".equals(action) || "/admin/login".equals(action) || "/admin/adminLogin.jsp".equals(action)) {
//            if (action.equals("/admin")) {
//                //if this happens, redirect to /admin/login
//                servletResponse.setContentType("text/html");
//                PrintWriter pw = servletResponse.getWriter();
//                ((HttpServletResponse) servletResponse).sendRedirect("admin/login");
//                pw.close();
//                return;
//            }
//            filterChain.doFilter(servletRequest, servletResponse);
//        } else { //all other cases like http://localhost:8080/admin/test, http://localhost:8080/admin/go  these URL will be redirected to /admin/login
//            System.out.println("last condition reached");
//            servletResponse.setContentType("text/html");
//            PrintWriter pw = servletResponse.getWriter();
//            ((HttpServletResponse) servletResponse).sendRedirect("/admin/login");
//            pw.close();
//        }


//          This doesnt works so well.
//        if("/admin".equals(action) || "/admin/login".equals(action) || "/admin/adminLogin.jsp".equals(action)){
//            if (action.equals("/admin")){
//                //if this happens, redirect to /admin/login
//                servletResponse.setContentType("text/html");
//                PrintWriter pw = servletResponse.getWriter();
//                ((HttpServletResponse) servletResponse).sendRedirect("admin/login");
//                pw.close();
//                return;
////                servletRequest.getRequestDispatcher("/admin/login").forward(servletRequest, servletResponse);
//            }
//            filterChain.doFilter(servletRequest, servletResponse);
//        } else{
//            Object isLoggedObj = req.getSession().getAttribute("isLoggedIn");
//            if(isLoggedObj != null){
//                boolean isLoggedIn = (Boolean) isLoggedObj;
//                if(isLoggedIn){
//                    filterChain.doFilter(servletRequest, servletResponse);
//                    return;
//                }
//            }
////            http://localhost:8080/filter_demo_war_exploded/
//            String path = req.getContextPath()+ "/admin/login";
//            resp.sendRedirect(path);
//        }
//        System.out.println("AuthenticationFilter ---2-------");
    }

}
