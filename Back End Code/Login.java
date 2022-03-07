package servlets.inventorymanagementsystem;
//This is Login Servlet
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import BeanClass.*;
import DAO.*;
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Login() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		UserBean user = new UserBean();
		Dao d = new Dao();
		
		if(d.checkUserLoginInfo(username,password)) {
			user.setUsername(username);
			user.setPassword(password);
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("password",password);
			
			response.sendRedirect("dashboard.jsp");
			
		}
		else {
			out.println("<script type = \"text/javascript\">");
    		out.println("alert('Username or Password is Incorrect');");
    		out.println("</script>");	
    		out.println("<meta http-equiv=\"Refresh\" content=\"0;url=index.jsp\">");
		}
		
		
	}

}
