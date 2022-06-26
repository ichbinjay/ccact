<html>

<head>
    <title>Club Data</title>
    <!--<meta http-equiv="refresh" content="2">-->
    <link rel="stylesheet" href="topcss.css">
    <style>

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
            <table id="EntryTable">
                <form action="stu-2.php" method="post">
                    <tr>
                        <td>
                            <label for="CompetitionID">Competion Date:</label>
                        </td>
                        <td>
                            <input type="date" name="CompetitionID" id="CompetitionID">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="CompetitionName">Competition Name:</label>
                        </td>
                        <td>
                            <input type="text" name="CompetitionName" id="CompetitionName">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="ParticipationStatus">Title Won?</label>
                        </td>
                        <td>
                            <input type="radio" name="ParticipationStatus" id="ParticipationStatus" value="Winner">
                            <label for="Winner">Winner</label>
                            <input type="radio" name="ParticipationStatus" id="ParticipationStatus" value="Runner-Up">
                            <label for="Loser">Runner-Up</label>
                            <input type="radio" name="ParticipationStatus" id="ParticipationStatus" value="Participant">
                            <label for="Participant">Participant</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="DocumentProof">Document Proof:</label>
                        </td>
                        <td>
                            <input type="file" name="DocumentProof" id="DocumentProof">
                        </td>
                    </tr>
                </form>
            </table>
        </div>
    </div>
</body>

</html>