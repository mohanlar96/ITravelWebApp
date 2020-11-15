package itravel.controller.user;

import itravel.dao.FollowerDao;
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
        int currentUser = Integer.parseInt(request.getParameter("currentUserID"));
        HttpSession session=request.getSession();
        session.setAttribute("currntUser",currentUser);
        FollowerDao dbu = new FollowerDao();

        List<Traveller> allTravelers  = null;
        try {
            allTravelers = dbu.getTraveller(currentUser);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("TravelersList", allTravelers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Traveller.jsp");
        dispatcher.forward(request, response);


//      PrintWriter out = response.getWriter();
//     out.println("Hiii" + request.getAttribute("PeopleList").toString());

    }

}
