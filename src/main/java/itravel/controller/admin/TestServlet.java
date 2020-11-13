package itravel.controller.admin;

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

@WebServlet(value = "/TestServletAdmin")
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
        String theCommand = request.getParameter("cmdWordServlet");
        if (theCommand == null) {
            theCommand = "LIST";
        }

        try {
            //listStudents(request,response);
            switch(theCommand) {
                case "LIST":
                    listBanWords(request, response);
                    break;
                case "ADD":
                    addBanWord(request, response);
                    break;
                case "UPDATE":
                    updateBanWord(request, response);
                    break;
                case "DELETE":
                    deleteBanWord(request, response);
                    break;
                default:
                    errorPage(request,response);
            }
        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }


    }

    private void deleteBanWord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String tempStr = request.getParameter("newWord");
        String tempId = request.getParameter("currId");
        // if one of them is null, return
        if (tempStr==null || tempId==null) {
            return;
        }

        // update the table record
        myDbUtil.deleteWord(tempId);

        // give response back to ajax call;
        PrintWriter out = response.getWriter();
        out.println("success");
        out.flush();
        out.close();
    }

    private void updateBanWord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String tempStr = request.getParameter("newWord");
        String tempId = request.getParameter("currId");

        // if one of them is null, return
        if (tempStr==null || tempId==null) {
            return;
        }
        // create the new BanWord Object
        BanWord tempWord = new BanWord(tempId,tempStr);

        // update the table record
        myDbUtil.updateWord(tempWord);

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

    private void addBanWord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.print("new add request:");
        // get the new Word
        String tempStr = request.getParameter("newWord");
        System.out.println(tempStr);
        // create the new BanWord Object
        BanWord tempWord = new BanWord("0",tempStr);
        System.out.println("it is ok");

        // add new record to the DB;
        myDbUtil.addWord(tempWord);

        // give response back to ajax call;
        PrintWriter out = response.getWriter();
        out.println("success");
        out.flush();
        out.close();
        //send back to control words page
        //listBanWords(request,response);
    }

    private void listBanWords(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int selectedPageN = 0;
        String tempStr = request.getParameter("page");
        if (tempStr==null) {
            selectedPageN = 1;
        } else {
            selectedPageN = Integer.parseInt(tempStr);
        }

        System.out.println("Page number is:"+selectedPageN);

        // get count of all words
        int rowCnt = myDbUtil.getCntBanWords();

        // each page contains 10 words
        int totalPageN = ((rowCnt-1)/10)+1;
        System.out.println("RowCnt:"+rowCnt);
        System.out.println("TotalPageNumber:"+totalPageN);
        if (selectedPageN>totalPageN && selectedPageN<=0) {
            //selected page is out of range
            //change it to first page
            selectedPageN = 1;
        }


        List<BanWord> theBanWords = myDbUtil.getBanWords(selectedPageN);
        // add students to the request
        request.setAttribute("WORD_LIST", theBanWords);
        request.setAttribute("PAGE", selectedPageN);
        request.setAttribute("TOTAL_LENGTH", totalPageN);

        // send to JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/controlWords.jsp");
        dispatcher.forward(request, response);
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
