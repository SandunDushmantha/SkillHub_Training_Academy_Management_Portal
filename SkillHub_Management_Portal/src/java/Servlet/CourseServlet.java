package Servlet;

import Model.Course;
import Util.DataStore;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/course")
public class CourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DataStore dataStore = (DataStore) getServletContext().getAttribute("dataStore");

        String code = request.getParameter("courseCode");
        String title = request.getParameter("courseTitle");
        String trainerUsername = request.getParameter("trainerUsername");

        dataStore.addCourse(new Course(code, title, trainerUsername));

        request.setAttribute("successMessage", "Course added successfully.");
        request.setAttribute("courses", dataStore.getAllCourses());
        request.setAttribute("trainers", dataStore.getAllTrainers());
        request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
    }
}
