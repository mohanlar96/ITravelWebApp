package itravel.controller;

import itravel.dao.DbUtil;
import itravel.model.Student;

import javax.annotation.Resource;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(value = "/TestServlet")
public class TestServlet extends HttpServlet {

    private DbUtil myDbUtil;

    @Resource(name="jdbc/travelDb")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        super.init();
        // create out student db util ... and pass in the conn pool / datasource
        try {
            //myDbUtil = new DbUtil(dataSource);

        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//        out.println("<html><body>");
//        out.println("Hello world");
//        out.println("</html></body>");
        try {
            listStudents(request,response);
        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }


    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // get students from db util
        List<Student> students = myDbUtil.getStudents();

        // add students to the request
        request.setAttribute("STUDENT_LIST", students);

        // send to JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
        dispatcher.forward(request, response);
    }


}
