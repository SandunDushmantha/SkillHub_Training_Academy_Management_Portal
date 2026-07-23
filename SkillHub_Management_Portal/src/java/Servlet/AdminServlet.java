package Servlet;

import Util.DataStore;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DataStore dataStore = (DataStore) getServletContext().getAttribute("dataStore");
        request.setAttribute("courses", dataStore.getAllCourses());
        request.setAttribute("trainers", dataStore.getAllTrainers());
        request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
    }
}
