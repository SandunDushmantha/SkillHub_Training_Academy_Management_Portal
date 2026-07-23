package Servlet;

import Model.User;
import Model.Attendance;
import Util.DataStore;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/attendance")
public class AttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        DataStore dataStore = (DataStore) getServletContext().getAttribute("dataStore");

        if ("TRAINER".equals(user.getRole())) {
            request.setAttribute("courses", dataStore.getCoursesForTrainer(user.getUsername()));
            request.setAttribute("students", dataStore.getAllStudents());
        } else if ("STUDENT".equals(user.getRole())) {
            request.setAttribute("records", dataStore.getAttendanceForStudent(user.getUsername()));
        }

        request.getRequestDispatcher("/attendance.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DataStore dataStore = (DataStore) getServletContext().getAttribute("dataStore");

        String studentUsername = request.getParameter("studentUsername");
        String courseCode = request.getParameter("courseCode");
        boolean present = "on".equals(request.getParameter("present"));

        dataStore.addAttendance(new Attendance(studentUsername, courseCode, LocalDate.now(), present));

        request.setAttribute("successMessage", "Attendance recorded for " + studentUsername);
        doGet(request, response);
    }
}