<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
* { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }

html { width: 100%; height:100%; overflow:hidden; }

body { 
    width: 100%;
    height:100%;
    font-family: 'Open Sans', sans-serif;
    background: #092756;
    background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(38, 96, 119, 0.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
table{
  border-collapse: collapse;
  width: 80%;
  text-align: center;
}

td,th {
  border: 1px solid #ddd;
  padding: 3px;
}
 tr:nth-child(even){background-color: #f2f2f2;}
 tr:nth-child(odd){background-color: #ffffff;}
tr:hover {background-color: #ddd;}
 th{
  padding-top: 12px;
  padding-bottom: 12px;
  background-color:dodgerblue;
  color: white;
}
    </style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("user")==null){
	response.sendRedirect("index.html");
}
%>
<ul>
  <li><a href="odrequest.jsp">OD REQUEST</a></li>
  <li><a href="changepass.jsp">CHANGE PASSWORD</a></li>
  <li><a href="Logout.java">LOGOUT</a></li>
</ul>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%
Class.forName("org.sqlite.JDBC");
Connection con=DriverManager.getConnection("JDBC:sqlite:C:\\Users\\Admin\\Desktop\\Sport.db");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from od order by sno desc");
%><center>
<table>
<tr>
                <th>NAME</th>
                <th>REG NO</th>
                <th>DEPT</th>
                <th>YEAR</th>
                <th>EVENT</th>
                <th>HOD PERMISSION</th>
                <th>PRINCIPAL PERMISSION</th>
             </tr>
<%
while(rs.next()){
%>
<tr>
<td>
<b><%out.print(rs.getString(1)); %></b>
</td>
<td>
<b><%out.print(rs.getString(2)); %></b>
</td>
<td>
<b><%out.print(rs.getString(3)); %></b>
</td>
<td>
<b><%out.print(rs.getString(4)); %></b>
</td>
<td>
<b><%out.print(rs.getString(6)); %></b>
</td>
<%String s=rs.getString(8); 
int i=Integer.parseInt(s);
if(i==0){%>
	<td>
<h4 style="color:blue;">Requested</h4>
</td>
<%}
else if(i==1){%>
<td>
<h4 style="color:green;">Granted</h4>
</td>
<%}
else{%>
<td>
<h4 style="color:red;">Rejected</h4>
</td>
<%}
%>
<%String s1=rs.getString(9); 
int i1=Integer.parseInt(s1);
if(i1==0){%>
<td>
<h4 style="color:blue;">Requested</h4>
</td>
<%}
else if(i1==1){%>
<td>
<h4 style="color:green;">Granted</h4>
</td>
<%}
else{%>
<td>
<h4 style="color:red;">Rejected</h4>
</td>
<%}
%>
<%}
%>
</tr>
</table>
</center>
<%con.close(); %>
</body>
</html>