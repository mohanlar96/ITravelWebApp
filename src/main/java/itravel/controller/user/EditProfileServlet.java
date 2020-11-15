package itravel.controller.user;

import itravel.model.Profile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/editprofile")
public class EditProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid = request.getParameter("id");
        try {
            String filepath = "aaaaaaaaa";
            if(userid != null && userid.length()>0 && userid.chars().mapToObj(c -> (char) c).allMatch(Character::isDigit)){
                // get whatever from db util
                Profile profile = ProfileServlet.getProfile(userid);

                // add students to the request
                request.setAttribute("prof", profile);
                System.out.println("Id is: " + profile.getUserId());
                if (profile.getUserId() != null) filepath = "/edit_profile.jsp";
            }
            // send to JSP page (view)
            RequestDispatcher dispatcher = request.getRequestDispatcher(filepath);
            dispatcher.forward(request, response);

        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }
}