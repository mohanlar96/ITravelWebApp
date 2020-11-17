package itravel.controller.user;
import itravel.dao.LoginDao;
import itravel.model.MD5;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   String uname = request.getParameter("username");
   String pword =request.getParameter("password");
        LoginDao c = new LoginDao();
         User usr =c.findUser(uname);
        System.out.println("user = "+usr);
        System.out.println(uname+"  "+pword);

        MD5 md5 = new MD5();
        String hashedPassword = md5.getMd5(pword);


             if(usr!=null&&usr.getEmail().equals(uname)&&usr.getPassword().equals(hashedPassword)) {
                 System.out.println("success");
                 HttpSession session = request.getSession();
                 session.setAttribute("username",uname);
                 response.sendRedirect("home.jsp");
             }


        else{
             response.sendRedirect("signup.jsp");

        }

    }
}
