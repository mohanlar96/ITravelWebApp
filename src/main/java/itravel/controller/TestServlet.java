package itravel.controller;

import itravel.dao.DbUtil;
import itravel.dao.PostDao;
import itravel.model.Comment;
import itravel.model.Post;
import itravel.model.Student;
import javax.annotation.Resource;
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
    @Override
    public void init() throws ServletException {
        super.init();

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        out.println("Welcome to Test Servelet");
        List<Post> posts=null;
        try {
            posts = PostDao.getPosts();

//            List<Student> students = DbUtil.getStudents();

            // add students to the request
//            request.setAttribute("STUDENT_LIST", students);
//            // send to JSP page (view)
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
//            dispatcher.forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        out.println(posts);




    }



}
