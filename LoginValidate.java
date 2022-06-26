import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class LoginValidate extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.setContentType("text/html");
        try{
        PrintWriter out = response.getWriter();
        RequestDispatcher rd = request.getRequestDispatcher("login.html");
        rd.include(request, response);
        int name = Integer.parseInt(request.getParameter("uname"));
        String password = request.getParameter("pword");
        Class.forName("com.mysql.cj.jdbc.Driver"); Connection
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cocurract1", "root" , "root" );
                        Statement stmt=con.createStatement(); 
                        int uname=Integer.parseInt(request.getParameter("uname"));
                        String pword=request.getParameter("pword"); 
                        String query="select * from login where userid='"+uname+"' and pword = '"+pword+"'";
                        out.print(query);
                        ResultSet rs=stmt.executeQuery(query);
                        boolean status = rs.next();
        if(status){
            HttpSession session = request.getSession();
            session.setAttribute("uname", uname);
            if(uname<100){
                 RequestDispatcher rd1 = request.getRequestDispatcher("stu-0.jsp");
                 rd1.forward(request, response);
            }
            else{
                RequestDispatcher rd1 = request.getRequestDispatcher("fac-0.html");
                rd1.forward(request, response);
            }
        } else {
            out.print("Sorry, username or password error!");
            RequestDispatcher rd1 = request.getRequestDispatcher("login.html");
            rd1.forward(request, response);
        }
        out.close();
        }catch(Exception e){
            
        }

        
        
    }
}
