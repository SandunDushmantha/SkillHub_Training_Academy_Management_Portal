package Filter;

import Model.User;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter(urlPatterns = {
    "/studentDashboard.jsp", "/trainerDashboard.jsp", "/adminDashboard.jsp",
    "/admin", "/course", "/enroll", "/attendance"
})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        // Unauthenticated -> redirect to index.jsp
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=login_required");
            return;
        }

        User user = (User) session.getAttribute("user");
        String uri = request.getRequestURI();
        String role = user.getRole();

        boolean authorised =
            (uri.contains("studentDashboard") && "STUDENT".equals(role)) ||
            (uri.contains("trainerDashboard") && "TRAINER".equals(role)) ||
            (uri.contains("adminDashboard") && "ADMIN".equals(role)) ||
            (uri.endsWith("/admin") && "ADMIN".equals(role)) ||
            (uri.endsWith("/course") && "ADMIN".equals(role)) ||
            (uri.endsWith("/enroll") && "STUDENT".equals(role)) ||
            (uri.endsWith("/attendance") && ("TRAINER".equals(role) || "STUDENT".equals(role)));

        // Unauthorised (wrong role) -> forward to index.jsp with error message
        if (!authorised) {
            request.setAttribute("errorMessage", "You are not authorised to access this resource.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        chain.doFilter(req, res);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void destroy() {
        
    }
}