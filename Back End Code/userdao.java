package xadmin.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xadmin.bean.user;

public class userdao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/userdb";
	private String jdbcUsername = "root";
	private String jdbcPassword = "rootpasswordgiven";
	private String jdbcDriver = "com.mysql.jdbc.Driver";
	
	private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (Name, SIZE, NO_OF_PRODUCTS) VALUES "
			+ " (?, ?, ?);";

	private static final String SELECT_USER_BY_ID = "select id,Name,SIZE,NO_OF_PRODUCTS from users where ID =?";
	private static final String SELECT_ALL_USERS = "select * from users";
	private static final String DELETE_USERS_SQL = "delete from users where ID = ?;";
	private static final String UPDATE_USERS_SQL = "update users set Name = ?,SIZE= ?, NO_OF_PRODUCTS =? where ID = ?;";
	
	public userdao() {
	}
    
	protected Connection getConnection(){
		Connection connection = null;
		try {
			Class.forName("jdbcDriver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;   
    }
	
	//insert user
	public void insertUser(user user) throws SQLException {
		System.out.println(INSERT_USERS_SQL);
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getName());
			preparedStatement.setLong(2, user.getSIZE());
			preparedStatement.setLong(3, user.getNO_OF_PRODUCTS());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
    }

	private void printSQLException(SQLException e) {
		for (Throwable e1 : ex) {
			if (e1 instanceof SQLException) {
				e1.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e1).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e1).getErrorCode());
				System.err.println("Message: " + e1.getMessage());
				Throwable t = e1.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
	
	//select user by id

public user selectUser(int ID)
{
	user user = null;
	// Step 1: Establishing a Connection
	try (Connection connection = getConnection();
			// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
		preparedStatement.setInt(1, ID);
		System.out.println(preparedStatement);
		// Step 3: Execute the query or update query
		ResultSet rs = preparedStatement.executeQuery();

		// Step 4: Process the ResultSet object.
		while (rs.next()) {
			String Name = rs.getString("Name");
			int SIZE = rs.getInt("SIZE");
			int NO_OF_PRODUCTS = rs.getInt("N0 0F PRODUCTS");
			user = new user(ID, Name,SIZE, NO_OF_PRODUCTS);
		}
	} catch (SQLException e) {
		printSQLException(e);
	}
	return user;
}
	
	//select all users

public List<user> selectAllUsers() {
	List<user> users = new ArrayList<>();
	// Step 1: Establishing a Connection
	try (Connection connection = getConnection();

			// Step 2:Create a statement using connection object
		PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
		System.out.println(preparedStatement);
		// Step 3: Execute the query or update query
		ResultSet rs = preparedStatement.executeQuery();

		// Step 4: Process the ResultSet object.
		while (rs.next()) {
			int ID = rs.getInt("ID");
			String Name = rs.getString("Name");
			int SIZE = rs.getInt("SIZE");
			int NO_OF_PRODUCTS = rs.getInt("country");
			users.add(new user(ID, Name, SIZE, NO_OF_PRODUCTS));
		}
	} catch (SQLException e) {
		printSQLException(e);
	}
	return users;
}
	
	//update users

public boolean updateUser(user user) throws SQLException {
	boolean rowUpdated;
	try (Connection connection = getConnection();
			PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
		System.out.println("updated USer:"+statement);
		statement.setString(1, user.getName());
		statement.setInt(2, user.getSIZE());
		statement.setInt(3, user.getNO_OF_PRODUCTS());
		statement.setInt(4, user.getID());

		rowUpdated = statement.executeUpdate() > 0;
	}
	return rowUpdated;
}
	
	//delete users
public boolean deleteUser(int ID) throws SQLException {
	boolean rowDeleted;
	try (Connection connection = getConnection();
			PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
		statement.setInt(1, ID);
		rowDeleted = statement.executeUpdate() > 0;
	}
	return rowDeleted;
}
    
}
