package itravel.controller.user;

import itravel.dao.FollowerDao;
import itravel.model.PeopleFollow;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/FollowUnfollowServlet")
public class FollowUnfollowServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String firstName = request.getParameter("firstName");
        doPost(request, response);
    }

        public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int ID = Integer.parseInt(request.getParameter("peopleID"));
            PrintWriter out = response.getWriter();
            out.println(ID);

        }
    }


