import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
public class LogoutServlet extends HttpServlet
{
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
ServletException, IOException
{
response.setContentType("text/html");
PrintWriter out=response.getWriter();
HttpSession session=request.getSession();
session.invalidate();
RequestDispatcher rd=request.getRequestDispatcher("home page.html");
rd.include(request, response);
out.close();
}
}
