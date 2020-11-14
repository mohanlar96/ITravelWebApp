package itravel.controller.user;

import itravel.dao.DbUtil;
import itravel.dao.FollowerDao;
import itravel.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/allpeople")
public class allPeopleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String firstName = request.getParameter("firstName");
        int userID = 1;
        FollowerDao dbu = new FollowerDao();

        List<PeopleFollow> allPeople  = null;
        try {
            allPeople = dbu.getPeople(userID);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("PeopleList", allPeople);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/people.jsp");
        dispatcher.forward(request, response);

//        RequestDispatcher rd = getServletContext().getRequestDispatcher("/people.jsp");
//        rd.include(request, response);

//      PrintWriter out = response.getWriter();
//     out.println("Hiii" + request.getAttribute("PeopleList").toString());

    }

}
