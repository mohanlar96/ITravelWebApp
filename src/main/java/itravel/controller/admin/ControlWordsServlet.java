package itravel.controller.admin;

import itravel.model.BanWord;
import itravel.dao.AdminWordDao;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(value = "/admin/controlWords")
public class ControlWordsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // cmdWordServlet parameter stores the command
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
        AdminWordDao.deleteWord(tempId);

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
        AdminWordDao.updateWord(tempWord);

        // give response back to ajax call;
        PrintWriter out = response.getWriter();
        out.println("success");
        out.flush();
        out.close();
    }

    // if unknown command is give, it will return this error html
    private void errorPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("Error");
        out.println("</html></body>");
    }

    // This command adds new word in the list.
    private void addBanWord(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // get the new Word
        String tempStr = request.getParameter("newWord");

        // create the new BanWord Object
        BanWord tempWord = new BanWord("0",tempStr);

        // add new record to the DB;
        AdminWordDao.addWord(tempWord);

        // give response back to ajax call;
        PrintWriter out = response.getWriter();
        out.println("success");
        out.flush();
        out.close();
    }

    // get List of the banned words
    private void listBanWords(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int selectedPageN;
        String tempStr = request.getParameter("page");
        if (tempStr==null) {
            selectedPageN = 1;
        } else {
            selectedPageN = Integer.parseInt(tempStr);
        }

        // get count of all words
        int rowCnt = AdminWordDao.getCntBanWords();

        // each page contains 10 words
        int totalPageN = ((rowCnt-1)/10)+1;

        if (selectedPageN>totalPageN && selectedPageN<=0) {
            //selected page is out of range
            //change it to first page
            selectedPageN = 1;
        }

        List<BanWord> theBanWords = AdminWordDao.getBanWords(selectedPageN);
        // add students to the request
        request.setAttribute("WORD_LIST", theBanWords);
        request.setAttribute("PAGE", selectedPageN);
        request.setAttribute("TOTAL_LENGTH", totalPageN);

        // send to JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/controlWords.jsp");
        dispatcher.forward(request, response);

    }

}
