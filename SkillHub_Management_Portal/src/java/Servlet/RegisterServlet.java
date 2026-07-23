package Servlet;

import Model.Student;
import Util.DataStore;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");

        DataStore dataStore = (DataStore) getServletContext().getAttribute("dataStore");

        if (username == null || username.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Username and password are required.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (dataStore.getUser(username) != null) {
            request.setAttribute("errorMessage", "Username already exists.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        Student student = new Student(username, password, fullName);
        dataStore.addUser(student);

        request.setAttribute("successMessage", "Registration successful. Please log in.");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
