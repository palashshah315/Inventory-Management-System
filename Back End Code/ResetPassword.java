package servlets.inventorymanagementsystem;
import DAO.*;
import BeanClass.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newpassword = request.getParameter("newpassword");
		String confirmpassword = request.getParameter("confirmpassword");
		String user_id = request.getParameter("userid");
		int userid = Integer.parseInt(user_id);
		PrintWriter out = response.getWriter();
		if(newpassword.equals(confirmpassword)) {
			Dao d = new Dao();
			UserBean ub = new UserBean();
			ub.setId(userid);
			ub.setPassword(newpassword);
			int status = d.updatePasswordByUserId(ub);
			if(status > 0) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("Your Password has been updated successfully!!");
			}
		}
		
		else if(newpassword.isEmpty() && confirmpassword.isEmpty()) {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("Please Enter Password!!");
		}
		
		else {
			out.println("<script type = \"text/javascript\">");
    		out.println("alert('New Password and Confirm Password doesn't match!!');");
    		out.println("location.reload();");
    		out.println("</script>");	
    		
		}
	}

}
