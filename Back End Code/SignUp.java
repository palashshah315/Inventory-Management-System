package servlets.inventorymanagementsystem;

import BeanClass.UserBean;
import DAO.Dao;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	public SignUp() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
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
		if(!firstname.isEmpty() && !lastname.isEmpty() && !email.isEmpty() && !phone.isEmpty() && !address.isEmpty() && !position.isEmpty()) 
		{
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
			
			
			int random = ((int)(Math.random() * 100000)) % 1000;
			String login_username = email.substring(0,email.indexOf("@"));
			String login_password = firstname+random;
			
			user.setUsername(login_username);
			user.setPassword(login_password);
			session.setAttribute("username", login_username);
			session.setAttribute("password", login_password);
			
			int status = d.insertUser(user);
			if(status > 0) {
				sendEmail("palashshah345@gmail.com","yxnpdckqvuhgqior",email,login_username,login_password,out);
				out.println("<script type = \"text/javascript\">");
        		out.println("alert('You Registered Successfully and you login username and password has been sent to your registered mail id');");
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
	private void sendEmail(String from, String pass,String to, String login_username, String login_password,PrintWriter out) 
  {
  	Properties props = System.getProperties();
  	props.put("mail.smtp.starttls.enable","true");
  	props.put("mail.smtp.user",from); 
  	props.put("mail.smtp.host", "smtp.gmail.com");
  	props.put("mail.smtp.auth", "true");
	props.setProperty("mail.smtp.ssl.enable", "true");
	props.setProperty("mail.smtp.ssl.required", "true");
	props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
  	props.setProperty("mail.smtp.socketFactory.fallback", "false"); 
  	props.setProperty("mail.smtp.port", "465");
  	props.setProperty("mail.smtp.socketFactory.port", "465");
  	

  	
  	Session ss = Session.getInstance(props,new Authenticator() {
  		@Override
  		protected PasswordAuthentication getPasswordAuthentication() {
  			return new PasswordAuthentication(from,pass);
  			
  			
  		}
  	});
  	
  	ss.setDebug(true);
  	MimeMessage m = new MimeMessage(ss);
  	try {
  		m.setFrom(new InternetAddress(from));
  		m.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
  		m.setSubject("Registration Completed Successfully");
  		String msg = "Your registration completed successfully and username is "+login_username+" and password is "+login_password;
  		m.setText(msg);
  		
  		Transport.send(m);
  		
  		System.out.println("Mail sent Successfully....");

  		
  	}catch(Exception ex) {ex.printStackTrace();}
  	
  }
}
