package BeanClass;

public class OrderThrededFittingBean {
	private String userfirstname,userlastname,productname, productsize, productquantity,totalProduct,clientName,clientAddress,orderstatus;
	private int productid,userid;
	
	
	public int getUserId() {
		return userid;
	}
	
	public void setUserId(int userid) {
		this.userid = userid;
	}
	
	public String getclientName() {
		return clientName;
	}
	
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	
	public String getClientAddress() {
		return clientAddress;
	}
	
	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}
	
	public String getOrderStatus() {
		return orderstatus;
	}
	
	public void setOrderStatus(String orderstatus) {
		this.orderstatus = orderstatus;
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

	public String getProductrequired() {
		return productquantity;
	}

	public void setProductrequired(String productquantity) {
		this.productquantity = productquantity;
	}

	public int getProductId() {
		return productid;
	}

	public void setProductId(int productid) {
		this.productid = productid;
	}
	public String getTotalProduct() {
		return totalProduct;
	}
	public void setTotalProduct(String totalProduct) {
		this.totalProduct = totalProduct;
	}
}
