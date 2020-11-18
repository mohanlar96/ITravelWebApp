package itravel.controller.admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet({"/admin/login"})
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if("admin".equals(username) && "123".equals(password)){
                HttpSession session = request.getSession();
                session.setAttribute("isLoggedIn", true);
                session.setAttribute("username", username);
                response.sendRedirect("deactivatedUsers"); //this page should be only acccessed after login
            }else{
                response.sendRedirect("login?error=true");
            }
        } catch (Exception exc) {
            throw new ServletException(exc);
        }


    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //System.out.println("admin get request");
        request.getRequestDispatcher("adminLogin.jsp").forward(request, response);


        //redirect
//        response.setContentType("text/html");
//        PrintWriter pw=response.getWriter();
//        response.sendRedirect("http://localhost:8080/admin/adminLogin.jsp");
//        pw.close();
    }
}
