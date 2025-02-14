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
	String p,e,w,c;
    int g;
	p=request.getParameter("name");
	e=request.getParameter("email");
    w=request.getParameter("workshop");
	c=request.getParameter("comments");
	
	//g=Integer.parseInt(request.getParameter("phone"));
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con;
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecoproduct","root","");
	PreparedStatement ps=con.prepareStatement("insert into joinform values ('"+p+"','"+e+"','"+w+"','"+c+"')");
	int i=ps.executeUpdate();
	if(i!=0)
	{
		out.println("<script>");
		out.println("window.alert('Registration Successful! Thank you for joining us.')");
		out.println("window.location.href = 'main.html';"); 
		out.println("</script>");
				
	}
	
%>
</body>
</html>