package itravel.controller.user;

import com.fasterxml.jackson.databind.ObjectMapper;
import itravel.dao.FollowerDao;
import itravel.model.Traveller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/FooterTravelersServlet")
public class FooterTravelersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int currentUser = Integer.parseInt(request.getParameter("currentUserID"));
        String myTravellerType = request.getParameter("travellerType").trim();
        HttpSession session=request.getSession();
        int sessionUser = 2;
//        session.setAttribute("currntUser",currentUser);

        FollowerDao dbu = new FollowerDao();

        List<Traveller> myTravllerLists  = null;
        try {
            if(myTravellerType.equals("Followers")){
                myTravllerLists = dbu.getTraveller(sessionUser,currentUser,"MyFollowers");
            }
            else if(myTravellerType.equals("Followees")){
                myTravllerLists = dbu.getTraveller(sessionUser,currentUser,"MyFollowees");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       // session.setAttribute("myFollowersList", myFollowersList);
       // session.setAttribute("myFolloweesList", myFolloweesList);
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = mapper.writeValueAsString(myTravllerLists);
        response.getWriter().println(jsonString);
    }


}
