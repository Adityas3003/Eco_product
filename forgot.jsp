<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String e,p,re;
	e=request.getParameter("email");
	p=request.getParameter("password");
	re=request.getParameter("confirm-password");
	
	if(!p.equals(re))
	{
		out.println("<script>");
		out.println("window.alert('Password and Re-password do not match')");
		out.println("window.history.back()");
		out.println("</script>");
	}
	else
	{
		try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con;
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecoproduct","root","");
	PreparedStatement ps=con.prepareStatement("update reg set password='"+p+"', confirm_password='"+re+"' where user_email='"+e+"'");
	int i=ps.executeUpdate();
	if(i!=0)
	{
		out.println("<script>");
		out.println("window.alert('Password Changed Successfully')");
		out.println("window.location.href='log.html'");
		out.println("</script>");
	}
		}
		catch(Exception ex)
		{
			out.println("Error: " + ex.getMessage());
		}
	}
%>
</body>
</html>