package itravel.controller.user;

import com.fasterxml.jackson.databind.ObjectMapper;
import itravel.dao.FollowerDao;
import itravel.dao.HomeDao;
import itravel.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/allTraveller")
public class AllTravelersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int currentUser = Integer.parseInt(request.getParameter("id"));
        Object userId = request.getSession().getAttribute("userId");
        int sessionUser = (int)userId;

        FollowerDao dbu = new FollowerDao();
        List<Traveller> allTravelers  = null;
        Profile profile = null;
        HomeAvator avator = new HomeAvator(0, "", "", "");
        try {
            allTravelers = dbu.getTraveller(sessionUser,currentUser,"All");
            profile = ProfileServlet.getProfile(request.getParameter("id"));
            avator= HomeDao.getAvator(currentUser);

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("TravelersList", allTravelers);
        request.setAttribute("profile",profile );
        request.getParameter("id");
        request.setAttribute("avator",avator );
        // Sesssion
        request.setAttribute("userID",sessionUser );

        RequestDispatcher dispatcher = request.getRequestDispatcher("Traveller.jsp");
        dispatcher.forward(request, response);

    }

}
