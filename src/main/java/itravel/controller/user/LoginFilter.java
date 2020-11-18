package itravel.controller.user;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter({"/*"})
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        filterChain.doFilter(servletRequest, servletResponse);
//        return;

        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String action = req.getServletPath();
//        System.out.println("URL:"+action);
        // let it pass if wants to access admin panel
        if (action.startsWith("/admin")) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        //it should not block css, jpg ...
        if (action.startsWith("/css") || action.startsWith("/js") || action.startsWith("/images") || action.startsWith("/layout")) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        Object isLoggedObj = req.getSession().getAttribute("userId");
        // if not null, check if it is logged in successfully
        if (isLoggedObj != null) {
            int isLoggedIn = (int) isLoggedObj;
            if (isLoggedIn>0) {
                //if logged in, dont show login page, go in to admin home page
                if("/".equals(action) || "/login".equals(action) || "/signup.jsp".equals(action) || "/signup".equals(action)) {
                    servletResponse.setContentType("text/html");
                    PrintWriter pw = servletResponse.getWriter();
                    ((HttpServletResponse) servletResponse).sendRedirect("/home");
                    pw.close();
                    return;
                }
                // otherwise, go other pages in /admin url
                filterChain.doFilter(servletRequest, servletResponse);
                return;
            }
        }
        if (action.startsWith("/signup")) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        // if starts only /admin/login, let it go login page
        if (action.equals("/login")) {
            //if this happens, redirect to /admin/login
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        // everything else, just redirect to login page
        servletResponse.setContentType("text/html");
        PrintWriter pw = servletResponse.getWriter();
        ((HttpServletResponse) servletResponse).sendRedirect("/login");
        pw.close();
        return;

    }

}
