package Servlet;

import Model.User;
import Util.DataStore;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        DataStore dataStore = (DataStore) getServletContext().getAttribute("dataStore");
        User user = dataStore.getUser(username);

        if (user != null && user.getPassword().equals(password)) {
            // Regenerate session on login to reduce session-fixation risk
            HttpSession oldSession = request.getSession(false);
            if (oldSession != null) oldSession.invalidate();
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            switch (user.getRole()) {
                case "STUDENT":
                    response.sendRedirect(request.getContextPath() + "/studentDashboard.jsp");
                    break;
                case "TRAINER":
                    response.sendRedirect(request.getContextPath() + "/trainerDashboard.jsp");
                    break;
                case "ADMIN":
                    response.sendRedirect(request.getContextPath() + "/admin");
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
