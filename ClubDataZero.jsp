<html>

    <head>
        <title>Club Data</title>
        <!--<meta http-equiv="refresh" content="2">-->
        <link rel="stylesheet" href="topcss.css">
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
                
                <br>
                <h2>Club member Details</h2>

                <%@page import="java.sql.*" %> 
                <% try{
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cocurract1", "root" , "root" ); 
            Statement stmt=con.createStatement(); 
            String clubname=request.getParameter("clubname"); 
            String query = ""; 
            ResultSet rs; %> 
            Club Name:
            <% out.print(clubname); %> 
            <br />
            <% query = "select cid from club where cname='"+clubname+"'";
            rs=stmt.executeQuery(query); %> club id:
            <%while(rs.next()){out.print(rs.getString(1));}%> <br />
            
            <% query = "select cphno from club where cname='"+clubname+"'";
            rs=stmt.executeQuery(query); %> club phone:
            <%while(rs.next()){out.print(" "+rs.getString(1));}%>
            <br>
                     <%query="select s.fname, s.lname, s.regno, d.dno, st.syear from stuname s,  student st, club c, dept d where d.dno = st.dno && st.regno = s.regno && st.cid = c.cid && c.cname = '"+clubname+"'"
                    ; rs=stmt.executeQuery(query);  
                     %>

                <table border="5" bgcolor="white">
                    <tr>
                        <td>First Name</td>
                        <td>Last Name</td>
                        <td>Register Number</td>
                        <td>Department Number</td>
                        <td>Year</td>
                    </tr>
                    <% while(rs.next()) { %>
                    <tr>
                        <td>
                            <%=rs.getString(1)%>
                        </td>
                        <td>
                            <%=rs.getString(2)%>
                        </td>
                        <td>
                            <%=rs.getInt(3)%>
                        </td>
                        <td>
                            <%=rs.getInt(4)%>
                        </td>
                        <td>
                            <%=rs.getInt(5)%>
                        </td>
                    </tr>
                    <% } %>
                </table>
                <br>
                <br>

            </div>
            <%} catch(Exception e) { out.println(e.toString()); } %>
        </div>
    </body>

</html>