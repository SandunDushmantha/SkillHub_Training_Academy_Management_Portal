package Servlet;

import Model.Course;
import Model.Student;
import Model.User;
import Util.DataStore;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/enroll")
public class EnrollServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DataStore dataStore = (DataStore) getServletContext().getAttribute("dataStore");
        request.setAttribute("courses", dataStore.getAllCourses());
        request.getRequestDispatcher("/course.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        DataStore dataStore = (DataStore) getServletContext().getAttribute("dataStore");

        String courseCode = request.getParameter("courseCode");
        Course course = dataStore.getCourse(courseCode);

        if (user instanceof Student && course != null) {
            ((Student) user).enrol(courseCode);
            request.setAttribute("successMessage", "Successfully enrolled in " + course.getTitle());
        } else {
            request.setAttribute("errorMessage", "Enrolment failed. Please try again.");
        }

        request.setAttribute("courses", dataStore.getAllCourses());
        request.getRequestDispatcher("/course.jsp").forward(request, response);
    }
}
