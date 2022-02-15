package BeanClass;
public class CartBean extends ProductDetailBean{
int userid,cartid,productquantity;

public int getProductquantity() {
	return productquantity;
}

public void setProductquantity(int productquantity) {
	this.productquantity = productquantity;
}

public int getCartid() {
	return cartid;
}

public void setCartid(int cartid) {
	this.cartid = cartid;
}

public int getUserid() {
	return userid;
}

public void setUserid(int userid) {
	this.userid = userid;
}




}
