package servlets.inventorymanagementsystem;
import DAO.*; 
import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.Properties;
//import javax.mail.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/InvoiceStatus")
public class InvoiceStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private void sendEmail(String from, String pass,String to, String login_username, String login_password,PrintWriter out) 
//	  {
//	  	Properties props = System.getProperties();
//	  	props.put("mail.smtp.starttls.enable","true"); 
//	  	props.put("mail.smtp.user",from); 
//	  	props.put("mail.smtp.host", "smtp.gmail.com");  
//	  	props.put("mail.smtp.auth", "true"); 
//	  	
//	  	props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
//	  	props.setProperty("mail.smtp.socketFactory.fallback", "false"); 
//	  	props.setProperty("mail.smtp.port", "465"); 
//	  	props.setProperty("mail.smtp.socketFactory.port", "465"); 
//	  	
//
//	  	
//	  	Session ss = Session.getInstance(props,new Authenticator() {
//	  		@Override
//	  		protected PasswordAuthentication getPasswordAuthentication() {
//	  			return new PasswordAuthentication(from,pass);
//	  			
//	  			
//	  		}
//	  	});
//	  	
//	  	ss.setDebug(true);
//	  	MimeMessage m = new MimeMessage(ss);
//	  	try {
//	  		m.setFrom(new InternetAddress(from));
//	  		m.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
//	  		m.setSubject("Registration Completed Successfully");
//	  		String msg = "Your registration completed successfully and username is "+login_username+" and password is "+login_password;
//	  		m.setText(msg);
//	  		
//	  		Transport.send(m);
//	  		
//	  		System.out.println("Mail sent Successfully....");
//
//	  		
//	  	}catch(Exception ex) {ex.printStackTrace();}
//	  	
//	  }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String invoicestatus = request.getParameter("invoiceStatus");
		String clientname = request.getParameter("clientname");
		
		if(invoicestatus.isEmpty() || invoicestatus==null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");
			response.getWriter().write("Invoice Status should not be empty");
		}
		else if(clientname.isEmpty() || clientname==null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");
			response.getWriter().write("Client Name should not be empty");
		}
		
				Dao d = new Dao();
				int status =0;
				status =  d.updateInvoiceStatusByClientName(invoicestatus, clientname);
				
				
				
				if(status >0) {
					
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/plain");
					response.getWriter().write("Invoice Status is updated ");
					
				}
			
		}
	}
