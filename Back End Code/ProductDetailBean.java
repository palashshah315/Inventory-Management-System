package BeanClass;

public class ProductDetailBean {
	int id;
	String productname,productsize,unitprice,producttype,noofproduct;
	public String getNoofproduct() {
		return noofproduct;
	}
	public void setNoofproduct(String noofproduct) {
		this.noofproduct = noofproduct;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	
	public String getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(String unitprice) {
		this.unitprice = unitprice;
	}
	public String getProducttype() {
		return producttype;
	}
	public void setProducttype(String producttype) {
		this.producttype = producttype;
	}
	
}
