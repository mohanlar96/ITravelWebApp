package itravel.controller.user;

import itravel.dao.NewUserDao;
import itravel.model.MD5;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

@WebServlet(value = "/signup")
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String theCommand = request.getParameter("cmdUserServlet");

        System.out.println("new signup request");
        try{
            switch(theCommand) {
                case "CHECK_EMAIL":
                    checkEmail(request, response);
                    break;
                case "CREATE_USER":
                    createNewUser(request, response);
                    break;
                default:
                    errorPages(request,response,10);
            }
        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }

    }

    private void createNewUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String jsonStr = request.getParameter("payload");
        JSONObject newUserObj = new JSONObject(jsonStr);

        System.out.println("payload:"+jsonStr);

        //Validate the user input first
        if (!userValidate(newUserObj)){
            PrintWriter out = response.getWriter();
            String respStr = "{\"result\" : \"failed\", \"user\" : \"notCreated\"}";
            out.println(respStr);
            out.flush();
            out.close();
            return;
        }

        System.out.println("validation success");

        String city = newUserObj.getString("city");
        String firstName = newUserObj.getString("firstName");
        String lastName = newUserObj.getString("lastName");
        String email = newUserObj.getString("email");

        String password = newUserObj.getString("password");
        //create MD5 hash from password
        MD5 md5 = new MD5();
        String hashedPassword = md5.getMd5(password).toUpperCase();

        String gender = newUserObj.getString("gender");

        String dateOfBirth = newUserObj.getString("dateOfBirth");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        LocalDate birthDate = LocalDate.parse(dateOfBirth, formatter);

        int zipcode = Integer.parseInt(newUserObj.getString("zipcode"));
        String street = newUserObj.getString("street");

        // Insert the address into address Table
        int cityId = NewUserDao.getCityId(city);
        int addressId = NewUserDao.insertNewAddress(street, zipcode, cityId);

        if (addressId==0) {
            System.out.println("Error when inserting address");
            errorPages(request,response,1);
            return;
        }

        // Insert the person Info to person table
        int personId = NewUserDao.insertNewPerson(firstName, lastName, gender, birthDate, addressId);
        if (personId==0) {
            System.out.println("Error when inserting person");
            errorPages(request,response,2);
            return;
        }

        // Insert the user info to user table;
        int userId = NewUserDao.insertNewUser(email, hashedPassword, personId);
        if (userId==0) {
            System.out.println("Error when inserting user");
            errorPages(request,response,3);
            return;
        }

        // choose default profile, banner picture
        NewUserDao.setDefaultImages(userId);

        // all inserted successfully
        PrintWriter out = response.getWriter();
        String respStr = "{\"result\" : \"success\", \"userId\" : "+userId+"}";

        HttpSession session = request.getSession();
        session.setAttribute("userId", userId);
        out.println(respStr);
        out.flush();
        out.close();
    }

    // Server side new user info validation
    private boolean userValidate(JSONObject newUserObj) throws Exception{
        String city = newUserObj.getString("city");
        String firstName = newUserObj.getString("firstName");
        String lastName = newUserObj.getString("lastName");
        String email = newUserObj.getString("email");
        String password = newUserObj.getString("password");
        String gender = newUserObj.getString("gender");
        String dateOfBirth = newUserObj.getString("dateOfBirth");
        String zipcode = newUserObj.getString("zipcode");
        String street = newUserObj.getString("street");

        // check if email is already exists
        int emailExits = NewUserDao.checkEmailExists(email);
        if (emailExits>0){
            // email already exists
            System.out.println("email exists");
            return false;
        }

        // check if password is 1 number, 1 capital, 1 small letter with minimum 6 letters
        if(!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$")) {
            // password doesn't match the regex;
            System.out.println("password is invalid");
            return false;
        }

        if (firstName==null || firstName.equals("")){
            System.out.println("firstName is invalid");
            return false;
        }

        if (lastName==null || lastName.equals("")){
            System.out.println("lastName is invalid");
            return false;
        }

        // check the gender
        if (!gender.equals("M") && !gender.equals("F")) {
            // gender not matches
            System.out.println("gender doesnt match");
            return false;
        }

        // check the age
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        LocalDate birthDate = LocalDate.parse(dateOfBirth, formatter);
        LocalDate nowDate = LocalDate.now();
        if (Period.between(birthDate,nowDate).getYears() < 15) {
            // age is under 15
            System.out.println("age is invalid");
            return false;
        }

        // check if city is valid US city.
        int cityId = NewUserDao.getCityId(city);
        System.out.println("cityid:"+cityId);
        if (cityId==0){
            // invalid city name
            System.out.println("invalid city");
            return false;
        }

        if (zipcode==null || zipcode.length()!=5){
            System.out.println("zipcode is invalid");
            return false;
        }
        int zip = Integer.parseInt(zipcode);


        if (street==null || street.equals("")){
            System.out.println("street is invalid");
            return false;
        }
        return true;

    }

    private void checkEmail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String email = request.getParameter("email");
        int result = NewUserDao.checkEmailExists(email);
        PrintWriter out = response.getWriter();
        String respStr = "{\"result\" : \"success\", \"emailExists\" :"+result+"}";
        out.println(respStr);
        out.flush();
        out.close();
    }

    private void errorPages(HttpServletRequest request, HttpServletResponse response, int i) throws Exception{
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String respStr = "{\"result\" : \"failed\", \"errCode\" :\""+i+"\"}";
        out.println(respStr);
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
