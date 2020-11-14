package itravel.controller.user;

import itravel.dao.LoginDao;
import itravel.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   String uname = request.getParameter("username");
   String pword =request.getParameter("password");
        LoginDao c = new LoginDao();
      boolean s = c.isValidUserAccount(uname,pword);

             if(s) {

                 HttpSession session = request.getSession();
                 session.setAttribute("username",uname);
                 response.sendRedirect("home.jsp");
             }


        else{
             response.sendRedirect("signup.jsp");

        }

    }
}
