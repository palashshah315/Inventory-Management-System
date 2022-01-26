package BeanClass;

public class ThrededFittingBean {
	int id;
	String productname,productsize,noofproduct,unitprice;
	
	public void setUnitPrice(String unitprice) {
		this.unitprice = unitprice;
	}
	
	public String getUnitPrice() {
		return unitprice;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
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
