<html>

    <head>
        <title>Club Data</title>
        <link rel="stylesheet" href="topcss.css">
        <style>

        </style>
    </head>

    <body>
        <div>
            <div id="topribbon">
                <a href="home page.html" id="logout">Logout</a>
            </div>
            <div id="sidepane">
                <table id="panetable" border="1">
                    <tr>
                        <td>
                            <a href="stu-0.jsp" target="_self">Personal Info</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="stu-1.jsp" target="_self">Perfomance Stats</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="stu-2.jsp" target="_self">Update Information</a>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="databox">
                <div id="topdiv">
                    <div id="studentData">
                        <%@page import="java.sql.*" %>
                        <% 
                            try{ Class.forName("com.mysql.cj.jdbc.Driver"); Connection
                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cocurract1", "root" , "root" );
                            Statement stmt=con.createStatement(); 
                            String rno = session.getAttribute("uname").toString();
                            String query = "select fname,lname from stuname where regno='"+rno+"'";
                            ResultSet rs=stmt.executeQuery(query);
                       %>
                        Name: <%while(rs.next()){out.print(rs.getString(1)+" "+rs.getString(2));}%> <br> <br>
                        <%
                        query = "select syear from student where regno='"+rno+"'";
                        rs=stmt.executeQuery(query);
                       %>
                        Year: <%while(rs.next()){out.print(rs.getString(1));}%> <br> <br>
                        Registration Number:<% out.print(rno);%><br> <br>
                        <%
                        query = "select dno from student where regno='"+rno+"'";
                        rs=stmt.executeQuery(query);
                       %>
                        Department Number:<%while(rs.next()){out.print(rs.getString(1));}%>
                    </div>
                </div>
                <div id="bottomdiv">
                    <div id="dataTable">
                        <table id="dataTable" border="1">
                            <tr>
                                <td>cno</td>
                                <td>cname</td>
                                <td>status</td>
                            </tr>
                            <% 
 query="select cno, cname, stat from participated where regno=" +(String)rno; 
                            rs=stmt.executeQuery(query);
while(rs.next()) { %>
                            <tr>
                                <td>
                                    <%=rs.getInt(1)%>
                                </td>
                                <td>
                                    <%=rs.getString(2)%>
                                </td>
                                <td>
                                    <%=rs.getString(3)%>
                                </td>
                            </tr>
                            <% } %>
                        </table>
                    </div>
                    <%} catch(Exception e) { out.println(e.toString()); } %>
                </div>
            </div>
        </div>
    </body>

</html>