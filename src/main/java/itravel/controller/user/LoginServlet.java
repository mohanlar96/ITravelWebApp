package itravel.controller.user;
import itravel.dao.LoginDao;
import itravel.model.MD5;
import itravel.model.User;
import itravel.model.UserLog;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pWord =request.getParameter("password");
        try {
            User theUser = LoginDao.findUser(email);
            // if no user found
            if (theUser==null) {
                response.sendRedirect("signup.jsp?error=noUser");
                return;
            }
            if (theUser.getIsDeactivated()==1) {
                response.sendRedirect("signup.jsp?error=notActive");
                return;
            }

            System.out.println("email:"+email);
            System.out.println("password:"+pWord);

            MD5 md5 = new MD5();
            String hashedPassword = md5.getMd5(pWord).toUpperCase();
            System.out.println("HashPassword:"+"  "+hashedPassword);

            System.out.println("user from DB:"+theUser);

            if(theUser.getPassword().equals(hashedPassword)) {
                System.out.println("success");
                HttpSession session = request.getSession();
                // need user id in the session
                session.setAttribute("userId", theUser.getId());
                response.sendRedirect("home");
            }
            else{
                // check if user tried to login 3 times within 10minutes
                Object tempUsers = request.getSession().getAttribute("TEMP_USER");
                HashMap<Integer, UserLog> sessionUsers;
                if (tempUsers==null) { // first time login try
                    // create the new userLog object and store it in the session
                    System.out.println("new session userlog list created");
                    sessionUsers = new HashMap<Integer, UserLog>();
                    sessionUsers.put(theUser.getId(),new UserLog(theUser));
                    //UserLog sessionUser = new UserLog(theUser);
                    request.getSession().setAttribute("TEMP_USER", sessionUsers);
                } else {
                    sessionUsers = (HashMap<Integer, UserLog>)tempUsers;
                    if (sessionUsers.get(theUser.getId())==null) { // the user is not in the map
                        // put the new object in the map
                        sessionUsers.put(theUser.getId(), new UserLog(theUser));
                    }
                }
                // get the user from the Map
                // and check if 3 attempt is made in 10 min
                if (!sessionUsers.get(theUser.getId()).addTimestamp()) {
                    System.out.println("user is deactivated");
                    // need deactivate the user
                    LoginDao.deactivateUser(theUser.getId());
                    sessionUsers.remove(theUser.getId());
                    //request.getSession().removeAttribute("TEMP_USER");
                    response.sendRedirect("signup.jsp?error=notActive");
                } else {
                    System.out.println("still trying wrong password");
                    response.sendRedirect("signup.jsp?error=wrongPass");
                }


            }

        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("login get request");
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }


}