package BeanClass;

public class GroovedFittingBean {
	int id;
	String productname,productsize,noofproduct,unitprice;
	
	public void setUnitPrice(String unitprice) {
		this.unitprice = unitprice;
	}
	public String getUnitPrice() {
		return unitprice;
	}
	
//	String orderstatus,clientname,clientaddress,productrequire;
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
//	public String getClientName() {
//		return clientname;
//	}
//	public void setClientName(String clientname) {
//		this.clientname = clientname;
//	}
//	public String getClientAddress() {
//		return clientaddress;
//	}
//	public void setClientAddress(String clientaddress) {
//		this.clientaddress = clientaddress;
//	}
//	public String getProductRequire() {
//		return productrequire;
//	}
//	public void setProductRequire(String productrequire) {
//		this.productrequire = productrequire;
//	}
//	public String getOrderStatus() {
//		return orderstatus;
//	}
//	public void setOrderStatus(String orderstatus) {
//		this.orderstatus = orderstatus;
//	}
	public void setProductName(String productname) {
		this.productname = productname;
	}
	public String getProductName() {
		return productname;
	}
	public void setProductSize(String productsize) {
		this.productsize = productsize;
	}
	public String getProductSize() {
		return productsize;
	}
	public void setNoOfProduct(String noofproduct) {
		this.noofproduct = noofproduct;
	}
	public String getNoOfProduct() {
		return noofproduct;
	}
}
