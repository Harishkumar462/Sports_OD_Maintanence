

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.sql.*;
import javax.servlet.http.HttpSession;
@WebServlet("/Validation")
public class Validation extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("user");
		user=user.toUpperCase();
		String pass=request.getParameter("pass");
		pass=pass.toUpperCase();
		try{
		Class.forName("org.sqlite.JDBC");
		Connection con=DriverManager.getConnection("JDBC:sqlite:C:\\Users\\Admin\\Desktop\\Sport.db");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from login");
		int flag=0;
		while(rs.next()){
			if(user.equals(rs.getString(1)) && pass.equals(rs.getString(2))){
				flag=1;
				break;
			}
		}
		con.close();
		if(flag==1){
			HttpSession s=request.getSession();
			s.setAttribute("user",user);
			if(user.equals("PRINCIPAL")){
				response.sendRedirect("principal.jsp");
			}else if(user.equals("PT")){
				response.sendRedirect("odrequest.jsp");
			}
			else{
				response.sendRedirect("hod.jsp");
			}
		}
		else{
			response.sendRedirect("index.html");
		}
		
		}
		catch(Exception e){
			System.out.print(e);
		}
		
	}
}
