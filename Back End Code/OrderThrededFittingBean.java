package BeanClass;

public class OrderThrededFittingBean {
	private String userfirstname,userlastname,productname, productsize, productquantity;
	private int id,userid;
	
	
	public int getUserId() {
		return userid;
	}
	public void setUserId(int userid) {
		this.userid = userid;
	}
	public  String getUserFirstName() {
		return userfirstname;
	}
	public void setUserFirstName(String userfirstname) {
		this.userfirstname = userfirstname;
	}
	
	public String getUserLastName() {
		return userlastname;
	}
	public void setUserLastName(String userlastname) {
		this.userlastname = userlastname;
	}
	
	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductsize() {
		return productsize;
	}

	public void setProductsize(String productsize) {
		this.productsize = productsize;
	}

	public String getProductquantity() {
		return productquantity;
	}

	public void setProductquantity(String productquantity) {
		this.productquantity = productquantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
