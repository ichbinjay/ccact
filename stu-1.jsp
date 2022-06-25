<html>

<head>
    <title>Club Data</title>
    <!--<meta http-equiv="refresh" content="2">-->
    <link rel="stylesheet" href="topcss.css">

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
                <table id="datatable" border="1">
                                    
                    <%@page import="java.sql.*" %>
                    <% try{ Class.forName("com.mysql.cj.jdbc.Driver"); Connection
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cocurract1", "root" , "root" );
                        Statement stmt=con.createStatement(); String rno=request.getParameter("regno"); 
                        String rno1 = "1";/*change it to rno later*/
                        String query="select cno, cname, stat from participated where regno=" +(String)rno1; ResultSet
                        rs=stmt.executeQuery(query); %>
                        <div id="dataTable">
                            <table id="dataTable" border="1">
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
                    
                </table>
        </div>
    </div>
</body>

</html>