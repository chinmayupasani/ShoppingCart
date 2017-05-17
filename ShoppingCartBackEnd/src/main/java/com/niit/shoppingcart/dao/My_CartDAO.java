package com.niit.shoppingcart.dao;

import java.util.List;

import com.niit.shoppingcart.domain.My_Cart;

public interface My_CartDAO {
	
	public boolean save(My_Cart my_Cart);

	public boolean update(My_Cart my_Cart);

	public List<My_Cart> list(String user_id);

	

	public double getTotalAmount(String user_id);

}
