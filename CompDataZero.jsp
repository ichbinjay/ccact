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
        #data{
            height: 100%;
            width: 100%;
            border-collapse: collapse;
            text-align: center;
            margin-top: 15%;
        }
        #submit{
            border-radius: 2px;
            color: black;
            padding: 10px 20px;
            text-align: center;
            margin-right: 3%;
            border-color: aliceblue;
            background-color: white;
            font-family: 'Roboto', sans-serif;
        }
        select{
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
        #logout{
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
                <form action="CompDataZeroZero.jsp">
                <%@page import="java.sql.*" %>
                <%
                String clubname=request.getParameter("clubname"); 
                String box=request.getParameter("box"); 
                out.println(box);
                //create a dynamic dropdown list of club Competitions from database
                try{
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cocurract1", "root" , "root" );
                        Statement stmt=con.createStatement();
                        
                        String query="select co.cname from competitions co, club c where c.cid=co.cid && c.cname='"+clubname+"'";
                        ResultSet rs=stmt.executeQuery(query);
                %>  
                    Selected Club: <input type="text" name="clubname" value="<%= clubname %>" readonly><br><br>
                    <select id="compname" required>
                    <option value="">Select Competition</option>
                       <% while(rs.next()){ %>
                        
                        <option value="<%= rs.getString(1) %>"><%= rs.getString(1) %> </option>
                    
                    <% } %> 
                    </select>
                    <br> 
                <%
                    } catch(Exception e) { out.println(e.toString()); } 
                    %>
                    <br>
                     <input type="submit" id="submit" value="Submit" />
            </form>
            </div>

        </div>
    </div>
</body>

</html>