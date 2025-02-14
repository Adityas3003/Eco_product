<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<%
    //String n = request.getParameter("name");
    String u = request.getParameter("username");
    String e = request.getParameter("email");
    String p = request.getParameter("password");
    String re = request.getParameter("confirm-password");

    
    
    if (!p.equals(re)) {
        out.println("<script>");
        out.println("window.alert('Passwords do not match!');");
        out.println("window.history.back();");  
        out.println("</script>");
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecoproduct", "root", "");

            PreparedStatement checkUser = con.prepareStatement("SELECT * FROM reg WHERE user_name = ? OR user_email = ?");
            checkUser.setString(1, u);
            checkUser.setString(2, e);
            ResultSet rs = checkUser.executeQuery();


            if (u == null || u.trim().isEmpty() || e == null || e.trim().isEmpty() || p == null || p.trim().isEmpty() || re == null || re.trim().isEmpty())
            {
            	out.println("<script>");
            	out.println("window.alert('Enter details!');");
                out.println("window.history.back();");  
                out.println("</script>");	
            }
            else if (rs.next())
            {
                // If username or email already exists, show an error message
                out.println("<script>");
                out.println("window.alert('Username or Email already exists!');");
                out.println("window.history.back();");  // Redirect back to the registration page
                out.println("</script>");
            }
            else 
            {
                // If username and email are unique, proceed with insertion
                PreparedStatement ps = con.prepareStatement("insert into reg (user_name,user_email, password, confirm_password) values (?, ?, ?, ?)");
                //ps.setString(1, n);
                ps.setString(1, u);
                ps.setString(2, e);
                ps.setString(3, p);
                ps.setString(4, re);

                int i = ps.executeUpdate();
                if (i != 0)
                {
                    out.println("<script>");
                    out.println("window.alert('User add Successfully!!')");
                    out.println("window.history.back();");
                    out.println("</script>");
                }
            }
        } catch (Exception ex) {
            out.println("Error: " + ex.getMessage());
        }
    }
%>
</body>
</html>