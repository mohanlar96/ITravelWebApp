package itravel.controller.user;

import itravel.dao.UserDao;
import itravel.model.Address;
import itravel.model.User;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class UserServlet extends HttpServlet {
    private UserDao userDao = new UserDao();
    private static final long serialVersionuid = 1l;


    public void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {


//person table
        String Email = req.getParameter("email");
        String firstName = req.getParameter("firstName");
        //middle name = null
        String LastName = req.getParameter("lastName");
        String Gender = req.getParameter("gender");
        String Password = req.getParameter("password");

        if (Gender.equals("Male")||Gender.equals("Gender")) Gender = "M";
        else Gender = "F";
        String BirthYear = req.getParameter("birth");

        // address address
        String Country = req.getParameter("country");


        //in user table


        // String Email = req.getParameter("Email");

        User usr = new User();
       // Person person = new Person();
        //  Person pr = new Person();
        usr.setFirstName(firstName);
        usr.setLastName(LastName);
        usr.setGender(Gender);
        usr.setBirthYear(BirthYear);
        //usr.setAddress(new Address().setCountry(Country));

     //   usr.setEmail(Email);
     //   usr.setPassword(Password);


        //userDao.registerUser(usr);
        userDao.registerUserInPersontable(usr);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/profile.jsp");
        dispatcher.forward(req, response);

    }
}
