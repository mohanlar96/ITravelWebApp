package itravel.controller.user;

import itravel.dao.DbUtil;
import itravel.model.Address;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(value = "/deactivate")
public class DeactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid = request.getParameter("id");
         int state = -1;
        //connect to DB
        Connection myConn = null;
        PreparedStatement ps = null;
        System.out.println("INSIDE DEACT SERVLET with user: "+userid);
        Statement info = null;
        try {
            // get a connection
            myConn = DbUtil.connectDb();

            // deactivate user
            String upd = "UPDATE itraveldb.user SET isDeactivated='1' WHERE id="+userid;
            ps = myConn.prepareStatement(upd);
            state = ps.executeUpdate();

            if(state > 0) System.out.println("DeactServlet: Record Updated Successfully");
            else System.out.println("DeactServlet: There is a problem in updating Record.");

        } catch (SQLException sql) {
            sql.printStackTrace();
        } finally {
            try {
                if(ps != null) ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            // close JDBC objects
            DbUtil.close(myConn, null, null);
        }

        // send to JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher(state>0? "/index.jsp" : "/home");
        dispatcher.forward(request, response);
    }
}
