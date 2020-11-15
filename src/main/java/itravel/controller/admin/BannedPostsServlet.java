package itravel.controller.admin;

import itravel.dao.AdminDeactivatedUserDao;
import itravel.dao.AdminPostDao;
import itravel.model.Post;
import itravel.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(value = "/admin/bannedPosts")
public class BannedPostsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String theCommand = request.getParameter("cmdUserServlet");
        try{
            switch(theCommand) {
                case "ALLOW":
                    allowPosts(request, response);
                    break;
                case "GET_CNT":
                    getNumPosts(request, response);
                    break;
                default:
                    errorPage(request,response);
            }
        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    // if unknown command comes, return result: failed
    private void errorPage(HttpServletRequest request, HttpServletResponse response) throws Exception{
        PrintWriter out = response.getWriter();
        String respStr = "{\"result\" : \"failed\"}";
        out.println(respStr);
        out.flush();
        out.close();
    }

    // get the count of total post count, used for pagination and notification
    private void getNumPosts(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int postCnt = AdminPostDao.getCntPosts();
        PrintWriter out = response.getWriter();
        String respStr = "{\"result\" : \"success\", \"count\" :\""+postCnt+"\"}";
        out.println(respStr);
        out.flush();
        out.close();

    }

    // update the unhealthy column to 0
    private void allowPosts(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //System.out.println("input ids: "+request.getParameter("userIds"));
        String[] tempIds = request.getParameter("postIds").split(",");
        // update the database table post, column "unhealthy=0"
        AdminPostDao.updatePosts(tempIds);

        // give response back to ajax call;
        PrintWriter out = response.getWriter();
        out.println("success");
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String theCommand = request.getParameter("cmdUserServlet");

        if (theCommand == null) {
            theCommand = "LIST";
        }
        try {
            //listStudents(request,response);
            switch(theCommand) {
                case "LIST":
                    listUnhealthyPosts(request, response);
                    break;
                default:
                    errorPage(request,response);
            }
        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    private void listUnhealthyPosts(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int selectedPageN;
        String tempStr = request.getParameter("page");
        if (tempStr==null) {
            selectedPageN = 1;
        } else {
            selectedPageN = Integer.parseInt(tempStr);
        }

        // get count of all users
        int rowCnt = AdminPostDao.getCntPosts();

        // each page contains 10 words
        int totalPageN = ((rowCnt-1)/10)+1;

        if (selectedPageN>totalPageN && selectedPageN<=0) {
            //selected page is out of range
            //change it to first page
            selectedPageN = 1;
        }

        List<Post> thePosts = AdminPostDao.getUnhealthyPosts(selectedPageN);
        // add users to the request
        request.setAttribute("POST_LIST", thePosts);
        request.setAttribute("PAGE", selectedPageN);
        request.setAttribute("TOTAL_LENGTH", totalPageN);
        request.setAttribute("TOTAL_USER_CNT", rowCnt);

        // send to JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/bannedPosts.jsp");
        dispatcher.forward(request, response);
    }
}
