<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
     * {
   box-sizing: border-box;
  }

* { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }

html { width: 100%; height:100%; overflow:hidden; }

body { 
    color:white;
    width: 100%;
    height:100%;
    font-family: 'Open Sans', sans-serif;
    background: #092756;
    background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
    background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
}
 input[type=text], select, textarea{
  width: 70%;
  padding: 12px;
  border: black;
  outline:black;
  background: rgba(0,0,0,0.3);
  margin-left:-100px;
  margin-top:10px;
  margin-bottom:10px;
  margin-right:-50px;
  border-radius: 4px;
  background-color: rgba(38, 96, 119, 0.25);
  color:white;
}

 input[type=submit] {
  align:center;
  background-color: dodgerblue;
  color: white;
  padding: 10px ;
  border: none;
  border-radius: 3px;
  margin-left:250px;
  width:100px;
 }
input{
 transition: box-shadow .5s ease;
}
.button:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
 label {
    height: 10px;
    width: 200px;
    margin-top: 10px;
    margin-left: 10px;
    text-align:50px;
    clear: both;
    padding: 12px;
    display: inline-block;
    clear: both;
}

 input[type=submit]:hover {
  background-color: skyblue;
 }

 .container {
    position: absolute;
    top: 35%;
    left: 40%;
    margin: -150px 0 0 -150px;
    width:550px;
    height:530px;
  border-radius: 5px;
  background-color: rgba(38, 96, 119, 0.25);
  padding: 20px;
 }
 .row after{
     content:"";
 display:table;
 clear:both;
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
    </style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
String user=(String)session.getAttribute("user");
if(user!=null){
if(user.equals("PT")){
	
}
else{
	response.sendRedirect("index.html");
}
}
else{
	response.sendRedirect("index.html");
}
%>

<ul>
  <li><a href="status.jsp">REQUEST STATUS</a></li>
  <li><a href="changepass.jsp">CHANGE PASSWORD</a></li>
  <li><a href="Logout.java">LOGOUT</a></li>
</ul>
	<div id="grad1"></div>
        <div class="container">
            <div class="row">
            <form action="od.jsp" method="post">
		<label for="name">Name:</label>
                <input type="text" id="name" name="name"><br>
                <label for="regno">Regno:</label>
                <input type="text" id="regno" name="regno"> <br>
                <label for="dept">Dept:</label>
                <select name="dept">           
                    <option value="option">Select the Option</option>
                    <option value="MECH">Mechanical Engineering</option>
                    <option value="EEE">Electrical And Electronics Engineering</option>
                    <option value="ECE">Electronics And Communication Engineering</option>
                    <option value="CSE">Computer Science and Enginnering</option>
                    <option value="CIVIL">Civil Engineering</option>
                    <option value="MCT">Mechatronics Engineering</option>
                    <option value="IT">Information Technology</option>
                    <option value="BIO">Biotechnology</option>
                    <option value="TEXTILE">Textile Technology</option>
                    <option value="NCT">Nano Science And Technology</option>
                    <option value="FT">Food Technology</option>
                  </select><br>
                <label for="year">Year:</label>    
                <input type="text" id="yr" name="year"><br>
                <label for="event">Event:</label>
                <input type="text" id="event" name="event"><br>
                <label for="date">Date:</label>
                <input type="text" id="date" name="date"><br>
                <label for="place">Place:</label>
                <input type="text" id="place" name="place"><br>
                <input type="submit" value="ADD">
	</form>
          <center>
        
      </div>
     </div>
</body>
</html>