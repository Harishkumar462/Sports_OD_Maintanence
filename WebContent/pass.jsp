<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("user")==null){
	response.sendRedirect("index.html");
}
%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>	

<%
String user=(String)session.getAttribute("user");
Class.forName("org.sqlite.JDBC");
Connection con=DriverManager.getConnection("JDBC:sqlite:C:\\Users\\Admin\\Desktop\\Sport.db");

try{
	String use=request.getParameter("use");
	String pass=request.getParameter("pass");
	String chapass=request.getParameter("chan");
	if(pass.equals(chapass)){
		PreparedStatement st=con.prepareStatement("update login set pass='"+chapass+"' where user='"+use+"'");
		int i=st.executeUpdate();
		response.sendRedirect("Logout.java");
	}
	else{
		response.sendRedirect("changepass.jsp");
	}
}
catch(Exception e){
out.print(e);
}
con.close();
%>
</body>
</html>