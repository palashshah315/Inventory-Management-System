package Servlets;
//This is Sign Up servlet
import BeanClass.*;
import DAO.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	public SignUp() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String firstname = request.getParameter("first-name");
		String lastname = request.getParameter("last-name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String position = "Employee";
		UserBean user = new UserBean();
		Dao d = new Dao();
		PrintWriter out = response.getWriter();
		if(!firstname.isEmpty() && !lastname.isEmpty() && !email.isEmpty() && !phone.isEmpty() && !address.isEmpty() && !position.isEmpty()) {
			user.setFirstname(firstname);
			user.setLastname(lastname);
			user.setEmail(email);
			user.setPhone(phone);
			user.setAddress(address);
			user.setPosition(position);
			
			session.setAttribute("firstname",firstname);
			session.setAttribute("lastname", lastname);
			session.setAttribute("email",email);
			session.setAttribute("phone",phone);
			session.setAttribute("address",address);
			session.setAttribute("position", position);
			
			int status = d.insertUser(user);
			if(status > 0) {
				out.println("<script type = \"text/javascript\">");
        		out.println("alert('You Registered Successfully');");
        		out.println("</script>");	
        		out.println("<meta http-equiv=\"Refresh\" content=\"0;url=index.jsp\">");
			}
			
		}
		
		else {
			out.println("<script type = \"text/javascript\">");
    		out.println("alert('Fields Cannot Be Empty');");
    		out.println("</script>");
    		out.println("<meta http-equiv=\"Refresh\" content=\"0;url=index.jsp\">");
    	}
		
	}

}
