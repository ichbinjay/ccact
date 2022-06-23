<%@page import="java.sql.*"%>
<%
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cocurract1", "root", "root");
Statement stmt=con.createStatement();
String rno = request.getParameter("regno");
String query="select cno, cname, stat from participated where regno="+(String)rno;
ResultSet rs=stmt.executeQuery(query);
%>
<html>
    <body bgcolor="pink">
        <h1>Welcome to Student Performance Details</h1>
        <table border="5" bgcolor="white">
            <tr>
                <td>cno</td>
                <td>cname</td>
                <td>status</td>
            </tr>
            <%
            while(rs.next())
            {
            %>
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
            </tr>
            <%
            }
            %>
        </table>
        <br>
        <br>
    </body>
</html>
<%}
catch(Exception e)
{
out.println(e.toString());
}
%>