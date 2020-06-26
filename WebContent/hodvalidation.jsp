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
String s=request.getParameter("id");
		String s1=s.substring(0,7);
		String s2=s.substring(7,8);
		String s3=s.substring(8);
		try{
		Class.forName("org.sqlite.JDBC");
		Connection con=DriverManager.getConnection("JDBC:sqlite:C:\\Users\\Admin\\Desktop\\Sport.db");
		if(Integer.parseInt(s2)==1){
			PreparedStatement st=con.prepareStatement("update od set hod='1' where regno='"+s1+"' and da='"+s3+"' ");
			int i=st.executeUpdate();
		}
		else{
			PreparedStatement st=con.prepareStatement("update od set hod='-1' where regno='"+s1+"' and da='"+s3+"'");
			int i=st.executeUpdate();
		}
		con.close();
		response.sendRedirect("hod.jsp");
		}
		catch(Exception e){
			out.print(e);
		}
		%>
</body>
</html>