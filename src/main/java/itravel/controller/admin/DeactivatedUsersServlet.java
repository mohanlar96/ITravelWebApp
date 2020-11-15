package itravel.controller.admin;

import itravel.dao.AdminDeactivatedUserDao;
import itravel.dao.AdminWordDao;
import itravel.dao.DbUtil;
import itravel.model.BanWord;
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

@WebServlet(value = "/admin/deactivatedUsers")
public class DeactivatedUsersServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String theCommand = request.getParameter("cmdUserServlet");
        try{
            switch(theCommand) {
                case "ACTIVATE":
                    activateUsers(request, response);
                    break;
                case "GET_CNT":
                    getNumUsers(request, response);
                    break;
                default:
                    errorPage(request,response);
            }
        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }

    }

    private void getNumUsers(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int userCnt = AdminDeactivatedUserDao.getCntUsers();
        PrintWriter out = response.getWriter();
        String respStr = "{\"result\" : \"success\", \"count\" :\""+userCnt+"\"}";
        out.println(respStr);
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
                    listDeactivatedUsers(request, response);
                    break;
                default:
                    errorPage(request,response);
            }
        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }

    }

    private void activateUsers(HttpServletRequest request, HttpServletResponse response) throws  Exception{

        //System.out.println("input ids: "+request.getParameter("userIds"));
        String[] tempIds = request.getParameter("userIds").split(",");
        // update the database table user, column "isDeactivated=0"
        AdminDeactivatedUserDao.updateDeactivateDUsers(tempIds);

        // give response back to ajax call;
        PrintWriter out = response.getWriter();
        out.println("success");
        out.flush();
        out.close();
    }

    private void errorPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("Error");
        out.println("</html></body>");
    }

    private void listDeactivatedUsers(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int selectedPageN;
        String tempStr = request.getParameter("page");
        if (tempStr==null) {
            selectedPageN = 1;
        } else {
            selectedPageN = Integer.parseInt(tempStr);
        }

        // get count of all users
        int rowCnt = AdminDeactivatedUserDao.getCntUsers();

        // each page contains 10 words
        int totalPageN = ((rowCnt-1)/10)+1;

        if (selectedPageN>totalPageN && selectedPageN<=0) {
            //selected page is out of range
            //change it to first page
            selectedPageN = 1;
        }

        List<User> theUsers = AdminDeactivatedUserDao.getDeactivatedUser(selectedPageN);
        // add users to the request
        request.setAttribute("USER_LIST", theUsers);
        request.setAttribute("PAGE", selectedPageN);
        request.setAttribute("TOTAL_LENGTH", totalPageN);
        request.setAttribute("TOTAL_USER_CNT", rowCnt);

        // send to JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/activateUsers.jsp");
        dispatcher.forward(request, response);
    }
}
