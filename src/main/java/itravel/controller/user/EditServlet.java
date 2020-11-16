package itravel.controller.user;

import itravel.dao.DbUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(value = "/edit")
public class EditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int state = -1;

        state = updateInfo(request.getParameter("id"), state, request.getParameter("section"));

        response.setContentType("text/plain");
        response.getWriter().write("Dear user: " + (state>0? "Successfully updated" : "Information was not updated"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    private int updateInfo(String userid, int state, String section){
        //connect to DB
        Connection myConn = null;
        PreparedStatement ps = null;

        try {
            // get a connection
            myConn = DbUtil.connectDb();
            // deactivate user
            //TODO: WORK IN THE UPDATE***
            ps = getStatement(myConn, section, userid);
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

    private PreparedStatement getStatement(Connection myConn, String section, String userid) throws SQLException {
        String statement;
        switch (section){
            case "user":
                statement = "UPDATE itraveldb.XXX SET [col1=X, col2=X] WHERE id="+userid;
                break;
            case "person":
                statement = "UPDATE itraveldb.XXX SET [col1=X, col2=X] WHERE id="+userid;
                break;
            case "address":
                statement =  "UPDATE itraveldb.XXX SET [col1=X, col2=X] WHERE id="+userid;
                break;
            default:
                statement = "error";
        }
        return myConn.prepareStatement(statement);
    }
}
