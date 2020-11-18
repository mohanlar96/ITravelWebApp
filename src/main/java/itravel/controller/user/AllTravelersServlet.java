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
        int sessionUser = 2;
        FollowerDao dbu = new FollowerDao();
        List<Traveller> allTravelers  = null;
        Profile profile = null;

        try {
            allTravelers = dbu.getTraveller(sessionUser,currentUser,"All");
            profile = ProfileServlet.getProfile(request.getParameter("id"));

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("TravelersList", allTravelers);
        request.setAttribute("profile",profile );
        request.getParameter("id");
        // Sesssion
        Object userId = request.getSession().getAttribute("userId");
        Integer currentLoginUserID = (int)userId;
        request.setAttribute("userID",currentLoginUserID );

        RequestDispatcher dispatcher = request.getRequestDispatcher("Traveller.jsp");
        dispatcher.forward(request, response);




//      PrintWriter out = response.getWriter();
//     out.println("Hiii" + request.getAttribute("PeopleList").toString());

    }

}