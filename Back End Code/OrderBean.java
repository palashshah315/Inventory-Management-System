package BeanClass;
import java.util.*;



public class OrderBean {
	private String userfirstname,userlastname,productname, productsize, totalProduct,clientName,clientAddress,orderstatus,orderplaceddate,orderplacedtime,invoiceid;
	private String approvaldate,approvaltime,clientemail,invoicestatus;
	private int productid,userid,productquantity,orderid;
	private List<ClientProduct> productreq; 
	
	public List<ClientProduct> getProductreq() {
		return productreq;
	}

	public void setProductreq(List<ClientProduct> productreq) {
		this.productreq = productreq;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	private long totalprice;
	
	
	public String getInvoiceid() {
		return invoiceid;
	}

	public void setInvoiceid(String invoiceid) {
		this.invoiceid = invoiceid;
	}

	public void setInvoiceStatus(String invoicestatus) {
		this.invoicestatus = invoicestatus;
	}
	
	public String getInvoiceStatus() {
		return invoicestatus;
	}
	
	public void setTotalProductPrice(long totalprice) {
		this.totalprice = totalprice;
	}
	
	public long getTotalProductPrice() {
		return totalprice;
	}
	
	public void setClientEmail(String clientemail) {
		this.clientemail = clientemail;
	}
	
	public String getClientEmail() {
		return clientemail;
	}
	

	public void setApprovalDate(String approvaldate) {
		this.approvaldate = approvaldate;
	}
	
	public String getApprovalDate() {
		return approvaldate;
	}
	
	public void setApprovalTime(String approvaltime) {
		this.approvaltime = approvaltime;
	}
	
	public String getApprovalTime() {
		return approvaltime;
	}
	
	public void setOrderPlacedDate(String orderplaceddate) {
		this.orderplaceddate = orderplaceddate;
	}
	
	public String getOrderPlacedDate() {
		return orderplaceddate;
	}
	
	public void setOrderPlacedTime(String orderplacedtime) {
		this.orderplacedtime = orderplacedtime;
	}
	
	public String getOrderPlacedTime() {
		return orderplacedtime;
	}
	
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

	public int getProductrequired() {
		return productquantity;
	}

	public void setProductrequired(int productquantity) {
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
