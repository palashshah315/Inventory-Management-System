public class productMember 
{
	private String productname,productsize,productquantity,fitting;
//Default constructor to create objects
	public productMember() 
	{
		super();
		// TODO Auto-generated constructor stub
	}
//Parametrized constructor to intialise the private values from register
	public productMember(String productname, String productsize, String productquantity, String fitting)
	{
		super();
		this.productname = productname;
		this.productsize = productsize;
		this.productquantity = productquantity;
		this.fitting = fitting;
	}
//Getters and Setters method
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

	public String getFitting() {
		return fitting;
	}

	public void setFitting(String fitting) {
		this.fitting = fitting;
	}
	

}
