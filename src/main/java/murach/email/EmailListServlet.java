package murach.email;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import murach.business.User;
import murach.data.UserDB;

public class EmailListServlet extends HttpServlet {
    private static final String ACTION_JOIN = "join";
    private static final String ACTION_ADD = "add";
    private static final Pattern EMAIL_PATTERN = Pattern.compile("[^\\s@]+@[^\\s@]+\\.[^\\s@]+");
    private static final int MAX_NAME_LENGTH = 100;
    private static final int MAX_EMAIL_LENGTH = 254;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null || action.trim().isEmpty()) {
            action = ACTION_JOIN;
        } else {
            action = action.trim();
        }

        switch (action) {
            case ACTION_JOIN:
                forward(request, response, "/index.html");
                break;
            case ACTION_ADD:
                addUser(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unsupported action.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        forward(request, response, "/index.html");
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = trim(request.getParameter("firstName"));
        String lastName = trim(request.getParameter("lastName"));
        String email = trim(request.getParameter("email"));

        if (!isValid(firstName, lastName, email)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Please enter a name and valid email.");
            return;
        }

        User user = new User(firstName, lastName, email);
        UserDB.insert(user);
        request.setAttribute("user", user);
        forward(request, response, "/thanks.jsp");
    }

    private static boolean isValid(String firstName, String lastName, String email) {
        return hasValidLength(firstName, MAX_NAME_LENGTH)
                && hasValidLength(lastName, MAX_NAME_LENGTH)
                && email != null
                && email.length() <= MAX_EMAIL_LENGTH
                && EMAIL_PATTERN.matcher(email).matches();
    }

    private static boolean hasValidLength(String value, int maxLength) {
        return value != null && !value.isEmpty() && value.length() <= maxLength;
    }

    private static String trim(String value) {
        return value == null ? null : value.trim();
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String path)
            throws ServletException, IOException {
        getServletContext().getRequestDispatcher(path).forward(request, response);
    }
}
