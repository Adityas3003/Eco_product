<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>User Registration</title>
<style>
    /* General body and layout styling */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .admin-panel {
        max-width: 1000px;
        margin: 50px auto;
        background-color: #fff;
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
    }

    /* Header styling */
    header {
        background-color: black;
        color: white;
        padding: 20px;
        text-align: center;
        border-radius: 10px 10px 0 0;
    }

    header h1 {
        margin: 0;
        font-size: 2em;
        letter-spacing: 2px;
        margin-bottom: 20px;
    }

    nav ul {
        list-style: none;
        padding: 0;
        margin: 0;
        text-align: center;
    }

    nav ul li {
        display: inline;
        margin: 0 15px;
    }

    nav ul li a {
        color: white;
        text-decoration: none;
        font-weight: bold;
    }

    nav ul li a:hover {
        text-decoration: underline;
    }

    /* Page title styling */
    h2 {
        font-size: 1.8em;
        color: #333;
        text-align: center;
        margin-top: 20px;
    }

    /* Table styling */
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    }

    table, th, td {
        border: 1px solid #ddd;
        color: white;
    }

    td {
        background-color: grey;
    }

    th, td {
        padding: 12px;
        text-align: center;
        font-size: 1.1em;
    }

    th {
        background-color: black;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: black;
    }

    /* Button styling */
    button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 1.1em;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button a {
        color: white;
    }

    /* Responsive design */
    @media (max-width: 768px) {
        .admin-panel {
            width: 90%;
            margin: 20px auto;
        }

        table {
            width: 100%;
        }
    }

    /* Print styles */
    @media print {
        body * {
            visibility: hidden; /* Hide everything */
        }
        table, table * {
            visibility: visible; /* Show only the table */
        }
        table {
            position: absolute; /* Position it on the page */
            left: 0;
            top: 0;
        }
    }
</style>
<script>
    function printPage() {
        window.print();
    }
</script>
</head>
<body>
<div class="admin-panel">
    <header>
        <h1>ADMIN PANEL</h1>
        <nav>
            <ul>
                <li><a href="admin.html">HOME</a></li>
                <li><a href="view-workshop-registration.jsp">VIEW WORKSHOP REGISTRATION</a></li>
                <li><a href="add-user.html">ADD USER</a></li>
                <li><a href="viewuser.jsp">VIEW USER</a></li>
            </ul>
        </nav>
    </header>
    <h2>Feedback</h2>
    <center>
        <table border="1">
            <tr>
                <th>NAME</th>
                <th>EMAIL</th>
                <th>RATING</th>
                <th>COMMENT</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecoproduct", "root", "");
                    Statement st = con.createStatement();
                    String str = "SELECT * FROM feedback";
                    ResultSet rs = st.executeQuery(str);
                    while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("rating") %></td>
                            <td><%= rs.getString("comment") %></td>
                        </tr>
                        <%
                    }
                    rs.close();
                    st.close();
                    con.close(); // Close the connection
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </table>
        <button class="btn" onclick="printPage()">
            <i class="fa fa-download"></i> Download PDF
        </button>
    </center>
</div>
</body>
</html>
