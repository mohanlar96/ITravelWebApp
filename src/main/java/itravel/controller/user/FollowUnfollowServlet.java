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
       // doPost(request, response);
        int currentUser = Integer.parseInt(request.getParameter("currentUser"));
        System.out.println(currentUser);
        int travellerID = Integer.parseInt(request.getParameter("travellerID"));
        String followingStatus = request.getParameter("followingStatus").toString();
        // System.oxut.println(currentUser + " " + travellerID + " " + followingStatus);
        try {
            String newStatus = FollowerDao.followUnfollow(currentUser, travellerID, followingStatus);
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println(newStatus);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

   /* public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //int currentUser = Integer.parseInt(request.getParameter("currentUser"));
        int currentUser=2;
        int travellerID = Integer.parseInt(request.getParameter("travellerID"));
        String followingStatus = request.getParameter("followingStatus").toString();
       // System.oxut.println(currentUser + " " + travellerID + " " + followingStatus);
        try {
            int newStatus = FollowerDao.followUnfollow(currentUser, travellerID, followingStatus);
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println(newStatus);
        } catch (Exception e) {
            e.printStackTrace();
        }
    } */
}


