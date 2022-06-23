<%@page import="java.sql.*"%>
<%
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cocurract1", "root", "root");
Statement stmt=con.createStatement();
String regno= "1";//need to get this from the webpage
String query="select  cno, cname, stat from participated where regno = "+regno;
ResultSet rs=stmt.executeQuery(query);
%>
<html>
    <body bgcolor="pink">
        <h1>Welcome to Stdent Performance Details</h1>
        <br>
        <br>
        <table border="5" bgcolor="white">
            <tr>
                <td>Competition Number</td>
                <td>Competition Name</td>
                <td>Status</td>
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