package servlets.inventorymanagementsystem;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.*;
import java.util.*;
import DAO.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ForgetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }
    private void SendEmail(String admin_email, String user_email, String pass, String password) 
  {
  	Properties props = new Properties();
  	props.put("mail.smtp.starttls.enable","true"); 
  	props.put("mail.smtp.user",admin_email); 
  	props.put("mail.smtp.host", "smtp.gmail.com");  
  	props.put("mail.smtp.auth", "true"); 
  	props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
  	props.setProperty("mail.smtp.socketFactory.fallback", "false"); 
  	props.setProperty("mail.smtp.port", "465"); 
  	props.setProperty("mail.smtp.socketFactory.port", "465"); 

  	
  	Session ss = Session.getInstance(props,new Authenticator() {
  		@Override
  		protected PasswordAuthentication getPasswordAuthentication() {
  			return new PasswordAuthentication(admin_email,pass);
  			
  		}
  	});
  	ss.setDebug(true);
  	MimeMessage m = new MimeMessage(ss);
  	try {
  		m.setFrom(new InternetAddress(admin_email));
  		m.addRecipient(Message.RecipientType.TO,new InternetAddress(user_email));
  		m.setSubject("Regarding Forget Password");
  		
  		m.setText("your password is "+password);
  		
  		Transport.send(m);
  		
  		System.out.println("Mail sent Successfully....");

  		
  	}catch(Exception ex) {ex.printStackTrace();}
  	
  }
	
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String password = "";
		String email = request.getParameter("email");
		PrintWriter out = response.getWriter();
		if(email == "" || email.isEmpty())
		{
			out.println("<script type = \"text/javascript\">");
			out.println("alert('Please Enter email id');");
			out.println("</script>");
			
		}
		else
		{
			Dao d = new Dao();
			password=d.getForgotPassword(email);
			
			if(!password.isEmpty() || password!=null) {
				SendEmail("palashshah345@gmail.com", email, "ynsxninaqylthtbf", password);
				
				out.println("<script type = \"text/javascript\">");
				out.println("alert('Password has been sent to your mail id');");
				out.println("</script>");
				out.println("<meta http-equiv=\"Refresh\" content=\"0;url=index.jsp\">");
			}
			
			else {
				out.println("<script type = \"text/javascript\">");
				out.println("alert('Password not found');");
				out.println("</script>");
				out.println("<meta http-equiv=\"Refresh\" content=\"0;url=index.jsp\">");
			}
			
		}
	}

}
