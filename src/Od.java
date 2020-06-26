

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Od.java")
public class Od extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String regno=request.getParameter("regno");
		String dept=request.getParameter("dept");
		String year=request.getParameter("year");
		String event=request.getParameter("event");
		String date=request.getParameter("date");
		String place=request.getParameter("place");
		try{
		Class.forName("org.sqlite.JDBC");
		Connection con=DriverManager.getConnection("JDBC:sqlite:C:\\Users\\Admin\\Desktop\\Sports.db");
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
			
		}
	}

}
