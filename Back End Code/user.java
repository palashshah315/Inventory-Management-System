package BeanClass;

public class GroovedFittingBean {
	private int id;
	private String productname,productsize,noofproduct;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return productname;
	}
	
	public void setName(String productname) {
		this.productname = productname;
	}
	public String getSize() {
		return productsize;
	}
	public void setSize(String productsize) {
		this.productsize = productsize;
	}
	public String getNoOFProducts() {
		return noofproduct;
	}
	public void setNoOfProducts(String noofproduct) {
		this.noofproduct = noofproduct;
	}
}
