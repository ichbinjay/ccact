<%
    
%>
<html>
    <head>
        <!--<meta http-equiv="refresh" content="2">-->
        <link rel="stylesheet" href="topcss.css">
        <title>Faculty</title>
    </head>

    <body>
        <div>
            <div id="topribbon">
                <a href="LogoutServlet" id="logout">Logout</a>
            </div>
            <div id="sidepane">
                <table id="panetable" border="1">
                    <tr>
                        <td>
                            <a href="fac-0.html" target="_self">Student Performance</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="clubdata-0.html" target="_self">Club Data</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="compdata-0.html" target="_self">Competition Data</a>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="databox">
                <div id="data">
                    <div>
                    <%@page import="java.sql.*" %> <% try{
            Class.forName("com.mysql.cj.jdbc.Driver"); Connection
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cocurract1",
            "root" , "root" ); Statement stmt=con.createStatement(); String rno=request.getParameter("regno"); String query = "select fname,lname from stuname where regno='"+rno+"'"; ResultSet
            rs=stmt.executeQuery(query); %> Name:
            <%while(rs.next()){out.print(rs.getString(1)+" "+rs.getString(2));}%> <br />
            <br />
            <% query = "select syear from student where regno='"+rno+"'";
            rs=stmt.executeQuery(query); %> Year:
            <%while(rs.next()){out.print(rs.getString(1));}%> <br />
            <br />
            Registration Number:<% out.print(rno);%><br />
            <br />
            <% query = "select dname from student s, dept d where d.dno=s.dno and s.regno='"+rno+"'";
            rs=stmt.executeQuery(query); %> Department
            : <%while(rs.next()){out.print(" "+rs.getString(1));}%>
            </div>
            <% query="select cno, cname, stat from participated where regno=" +(String)rno;
                        rs=stmt.executeQuery(query); %>
                    <div id="dataTable">
                        <table border="1">
                            <tr>
                                <td>cno</td>
                                <td>cname</td>
                                <td>status</td>
                            </tr>
                            <% while(rs.next()) { %>
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
<%
%>