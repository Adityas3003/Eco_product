<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login Processing</title>
</head>
<body>
<%
String username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password1");

boolean recordFound = false;

try {
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    
   
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecoproduct", "root", "");
    
   
    String query = "SELECT * FROM reg WHERE user_name =? AND user_email=? AND password=?";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, username);
    ps.setString(2, email);
    ps.setString(3, password);
    
    
    ResultSet rs = ps.executeQuery();
    
    
    if (rs.next()) {
        recordFound = true;  // Record found
        out.println("<script>");
        out.println("window.alert('Login Successful');");
        out.println("window.location.href='main.html';");
        out.println("</script>");
    } else {
        recordFound = false;  // Record not found
        out.println("<script>");
        out.println("window.alert('Invalid credentials. Please try again.');");
        out.println("window.location.href='reg.html';");
        out.println("</script>");
    }
    
    
    rs.close();
    ps.close();
    con.close();
} catch (Exception ex) {
   
    ex.printStackTrace();
    out.println("<script>");
    out.println("window.alert('Error: " + ex.getMessage() + "');");
    out.println("window.location.href='log.html';");
    out.println("</script>");
}
%>
</body>
</html>
