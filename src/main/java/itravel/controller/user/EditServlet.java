package itravel.controller.user;

import itravel.dao.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(value = "/edit")
public class EditServlet extends HttpServlet {

    @Override
    public void init() throws ServletException{
        super.init();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int state = -1;
        String userid = request.getParameter("id");

        state = updateInfo(state, request);
        System.out.println("Going out of update part");
        response.getWriter().println("Dear user "+userid+": " + (state>0? "Updated":"No changes were done"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    private int updateInfo(int state, HttpServletRequest request){
        //connect to DB
        Connection myConn = null;
        PreparedStatement ps = null;

        try {
            // get a connection
            myConn = DbUtil.connectDb();
            // deactivate user
            //TODO: WORK IN THE UPDATE***
            ps = getStatement(myConn, request);
            state = ps.executeUpdate();
            //sending update status to the user
            if(state > 0) System.out.println("EditServlet: Record Updated Successfully");
            else System.out.println("EditServlet: There is a problem in updating Record.");

        } catch (SQLException sql) {
            sql.printStackTrace();
        } finally {
            try{
                if(ps != null) ps.close();
            } catch (SQLException throwables){
                throwables.printStackTrace();
            }
            // close JDBC objects
            DbUtil.close(myConn, null, null);
        }
        return state;
    }

    private PreparedStatement getStatement(Connection myConn, HttpServletRequest request) throws SQLException {
        PreparedStatement statement;

        switch(request.getParameter("section")){
            case "user":
                // ... , u.password=? ...
                statement = myConn.prepareStatement("UPDATE itraveldb.user u " +
                        "SET u.email=?, u.Biography=?, u.password=? " +
                        "WHERE u.id=?");
                statement.setString(1, request.getParameter("email"));
                statement.setString(2, request.getParameter("bio"));
                statement.setString(3, request.getParameter("passw")); //if this uncommented, change next line to (4, ...)
                statement.setInt(4, Integer.parseInt(request.getParameter("id")));
                break;
            case "person":
                statement = myConn.prepareStatement("UPDATE itraveldb.person p INNER JOIN itraveldb.user u ON p.id=u.Person_id " +
                        "SET fname=?, mname=?, lname=?, gender=?, dateBirth=?, cityBirth=?, job=? " +
                        "WHERE u.id=?");
                statement.setString(1, request.getParameter("fname"));
                statement.setString(2, request.getParameter("mname"));
                statement.setString(3, request.getParameter("lname"));
                statement.setString(4, request.getParameter("gender"));
                statement.setString(5, request.getParameter("dateb"));
                statement.setString(6, request.getParameter("cityb"));
                statement.setString(7, request.getParameter("job"));
                statement.setInt(8, Integer.parseInt(request.getParameter("id")));
                break;
            case "address":
                String cityid = getCityId(myConn, request.getParameter("state"), request.getParameter("city"));
                statement =  myConn.prepareStatement("UPDATE itraveldb.address a INNER JOIN itraveldb.person p ON a.id=p.Address_id INNER JOIN itraveldb.user u ON p.id=u.Person_id " +
                        "SET a.street1=?, a.street2=?, a.zip=?, a.City_id=? " +
                        "WHERE u.id=?");
                statement.setString(1, request.getParameter("street1"));
                statement.setString(2, request.getParameter("street2"));
                statement.setString(3, request.getParameter("zip"));
                statement.setInt(4, Integer.parseInt(cityid));
                statement.setInt(5, Integer.parseInt(request.getParameter("id")));
                break;
            default:
                statement = myConn.prepareStatement("error");
        }
        return statement;
    }

    private String getCityId(Connection myConn, String state, String city){
        PreparedStatement info = null;
        ResultSet myRs = null;
        String cityid = "";
        try{
            String sql = "SELECT c.id FROM itraveldb.city c INNER JOIN itraveldb.state s ON c.State_id=s.id WHERE c.name=? AND s.name=?";

            info = myConn.prepareStatement(sql);
            info.setString(1, city);
            info.setString(2, state);

            myRs = info.executeQuery();
            while(myRs.next()){
                cityid = myRs.getString("id");
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally{
            try{
                if (myRs!=null)     myRs.close();
                if (info!=null)     info.close();
            } catch(Exception exc){ exc.printStackTrace(); }
        }
        return cityid;
    }
}
