<html>

<head>
    <title>Club Data</title>
    <!--<meta http-equiv="refresh" content="2">-->
    <link rel="stylesheet" href="topcss.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto,wght@1,300&display=swap');

        #mainbox {
            border: 2px solid black;
            width: 100%;
            height: 100%;
        }

        #topribbon {
            height: 10%;
            width: 100%;
            border: 1px solid black;
        }

        #sidepane {
            height: 89%;
            width: 15%;
            float: left;
        }

        #panetable {
            height: 100%;
            width: 100%;
            border-collapse: collapse;
            text-align: center;
            font-family: 'Roboto', sans-serif;
        }

        #databox {
            height: 100%;
            width: 85%;
            border-collapse: collapse;
            text-align: center;
        }

        #data {
            height: 100%;
            width: 100%;
            border-collapse: collapse;
            text-align: center;
            margin-top: 15%;
        }

        #submit {
            border-radius: 2px;
            color: black;
            padding: 10px 20px;
            text-align: center;
            margin-right: 3%;
            border-color: aliceblue;
            background-color: white;
            font-family: 'Roboto', sans-serif;
        }

        select {
            color: black;
            padding: 10px 20px;
            text-align: left;
            margin-right: 3%;
            border-color: aliceblue;
            background-color: white;
            font-family: 'Roboto', sans-serif;
            width: 20%;
            height: 10%;
        }

        #logout {
            text-align: center;
            float: right;
            margin-top: 1.5%;
            margin-right: 3%;
        }
    </style>
</head>

<body>
    <div>
        <div id="topribbon">
            <a href="logout.php" id="logout">Logout</a>
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
            <div id="dataTable">
                <%@page import="java.sql.*" %>
                    <% try{ Class.forName("com.mysql.cj.jdbc.Driver"); 
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cocurract1", "root" , "root" );
                        Statement stmt=con.createStatement();
                        String query="select s.fname, s.lname, s.regno, d.dno, st.syear from stuname s, student st, club c, dept d, competitions co where d.dno = st.dno && st.regno = s.regno && st.cid = c.cid && c.cid = co.cid && c.cname = 'innovative' && co.cname='comp1'";
                        ResultSet rs=stmt.executeQuery(query);
                        %> <table>
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
                        <%
                    } catch(Exception e) { out.println(e.toString()); } 
                    %>
            </div>

        </div>
    </div>
</body>

</html>