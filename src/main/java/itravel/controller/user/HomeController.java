package itravel.controller.user;
import itravel.dao.HomeDao;
import itravel.model.HomeAvator;
import itravel.model.Notification;
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
//            request.getSession().setAttribute("userId",4);
            Object userId = request.getSession().getAttribute("userId");
            Integer currentLoginUserID = (int)userId;
            // need to connect with session .
            List<Post> posts = HomeDao.getPosts(currentLoginUserID,1); //10 posts // hershw ...
            HomeAvator avator= HomeDao.getAvator(currentLoginUserID);
            List<String> placeVisited=HomeDao.getVisitedPlace(currentLoginUserID);
            List<Notification> notifications=null;
            notifications=HomeDao.getNotifications(currentLoginUserID);
            request.setAttribute("notifications",notifications );
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
