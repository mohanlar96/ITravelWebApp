package itravel.controller.user;

import itravel.dao.FollowerDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/FollowUnfollowServlet")
public class FollowUnfollowServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object userId = request.getSession().getAttribute("userId");
        int currentUser = (int)userId;

        int travellerID = Integer.parseInt(request.getParameter("TravellerID"));
        String followingStatus = request.getParameter("FollowingStatus").toString();
        try {
            String newStatus = FollowerDao.followUnfollow(currentUser, travellerID, followingStatus);
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println(newStatus);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}


