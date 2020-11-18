package itravel.controller.user;
import itravel.dao.HomeDao;
import itravel.model.HomeAvator;
import itravel.model.Post;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/home")
public class HomeController extends HttpServlet {
    @Override
    public void init() throws ServletException {
        super.init();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Object userId = request.getSession().getAttribute("userId");
            System.out.println("logged in userid:"+(int)userId);
            Integer currentLoginUserID = (int)userId;
            // need to connect with session .

            List<Post> posts = HomeDao.getPosts(); //10 posts
            HomeAvator avator= HomeDao.getAvator(currentLoginUserID);
            List<String> placeVisited=HomeDao.getVisitedPlace(currentLoginUserID);
            request.setAttribute("avator",avator );
            request.setAttribute("posts", posts);
            request.setAttribute("places",placeVisited);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
