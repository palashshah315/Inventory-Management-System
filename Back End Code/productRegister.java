import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class productRegister extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		String productName = req.getParameter("productname");
		String productSize = req.getParameter("productsize");
		String productQuantity = req.getParameter("productquantity");
		String Fitting = req.getParameter("fitting");
		
		productMember pmember = new productMember(productName,productSize,productQuantity,Fitting);
		productRegisterDao prDao = new productRegisterDao();
		
		int status;
		
		if(Fitting == "Threded Fittings")
		status = prDao.insert(pmember);
		
		else
		status = prDao.insertp(pmember);
			
		
		PrintWriter out = res.getWriter();
		out.println(status);
	}

}
