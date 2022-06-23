<%@page import="java.sql.*"%>
<%
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cocurract1", "root", "root");
Statement stmt=con.createStatement();
String clubname = request.getParameter("clubname");
String query="select s.fname, s.lname, s.regno, d.dno, st.syear from stuname s,  student st, club c, dept d where d.dno = st.dno && st.regno = s.regno && st.cid = c.cid && c.cname = 'literary'";
ResultSet rs=stmt.executeQuery(query);
%>
<html>
    <body bgcolor="pink">
        <h1>Welcome to Club Performance Details</h1>
        <br>
        <h2>Club member Details</h2>
        <br>
        <table border="5" bgcolor="white">
            <tr>
                <td>First Name</td>
                <td>Last Name</td>
                <td>Register Number</td>
                <td>Department Number</td>
                <td>Year</td>
            </tr>
            <%
            while(rs.next())
            {
            %>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getInt(3)%></td>
                <td><%=rs.getInt(4)%></td>
                <td><%=rs.getInt(5)%></td>
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