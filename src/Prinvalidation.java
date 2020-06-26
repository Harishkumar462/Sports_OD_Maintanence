

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Prinvalidation.java")
public class Prinvalidation extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String s=request.getParameter("id");
		String s1=s.substring(0,7);
		String s2=s.substring(7,8);
		String s3=s.substring(8);
		try{
		Class.forName("org.sqlite.JDBC");
		Connection con=DriverManager.getConnection("JDBC:sqlite:C:\\Users\\Admin\\Desktop\\Sports.db");
		if(Integer.parseInt(s2)==1){
			PreparedStatement st=con.prepareStatement("update od set prin='1' where regno="+s1+" and da='"+s3+"'");
			int i=st.executeUpdate();
		}
		else{
			PreparedStatement st=con.prepareStatement("update od set prin='-1' where regno="+s1+" and da='"+s3+"'");
			int i=st.executeUpdate();
		}
		con.close();
		response.sendRedirect("principal.jsp");
		}
		catch(Exception e){
			System.out.print(e);
		}
	}
}
