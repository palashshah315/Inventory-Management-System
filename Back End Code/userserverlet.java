package xadmin.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import xadmin.bean.user;
import xadmin.dao.userdao;
/**
 * Servlet implementation class userserverlet
 */
@WebServlet("/userserverlet")
public class userserverlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private userdao userdao;


	/**
	 * @see Servlet#init(ServletConfig)
	 */
	 public void init() {
			userdao = new userdao();
		}

		protected void doPost1(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doGet(request, response);
		}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertUser(request, response);
				break;
			case "/delete":
				deleteUser(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateUser(request, response);
				break;
			default:
				listUser(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<user> listUser = userdao.selectAllUsers();
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
		dispatcher.forward(request, response);
	}
	
	
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
	
	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String Name = request.getParameter("Name");
		int SIZE = Integer.parseInt(request.getParameter("SIZE"));
		int NO_OF_PRODUCTS = Integer.parseInt(request.getParameter("NO_OF_PRODUCTS"));
		user newuser = new user(Name, SIZE, NO_OF_PRODUCTS);
		userdao.insertUser(newuser);
		response.sendRedirect("list");
	}
	
	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int ID = Integer.parseInt(request.getParameter("ID"));
		String Name = request.getParameter("Name");
		int SIZE = Integer.parseInt(request.getParameter("SIZE"));
		int NO_OF_PRODUCTS = Integer.parseInt(request.getParameter("NO_OF_PRODUCTS"));

		user book = new user(ID, Name, SIZE, NO_OF_PRODUCTS);
		userdao.updateUser(book);
		response.sendRedirect("list");
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		userdao.deleteUser(id);
		response.sendRedirect("list");

	}
}
