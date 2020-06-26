<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
String name=request.getParameter("name");
		String regno=request.getParameter("regno");
		String dept=request.getParameter("dept");
		String year=request.getParameter("year");
		String event=request.getParameter("event");
		String date=request.getParameter("date");
		String place=request.getParameter("place");
		try{
		Class.forName("org.sqlite.JDBC");
		Connection con=DriverManager.getConnection("JDBC:sqlite:C:\\Users\\Admin\\Desktop\\Sport.db");
		PreparedStatement st=con.prepareStatement("insert into od(name,regno,dept,year,da,event,place) values(?,?,?,?,?,?,?)");
		st.setString(1,name);
		st.setString(2,regno);
		st.setString(3,dept);
		st.setString(4,year);
		st.setString(5,date);
		st.setString(6,event);
		st.setString(7,place);
		int i=st.executeUpdate();
		con.close();
		response.sendRedirect("odrequest.jsp");
		}
		catch(Exception e){
		out.print(e);
		}
%>
</body>
</html>