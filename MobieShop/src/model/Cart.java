package model;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public class Cart {
	
	private HashMap<Long, Item> cartItems;

	public Cart() {
		cartItems = new HashMap<>();
	}

	public Cart(HashMap<Long, Item> cartItems) {
		super();
		this.cartItems = cartItems;
	}

	public HashMap<Long, Item> getCartItems() {
		return cartItems;
	}

	public void setCartItems(HashMap<Long, Item> cartItems) {
		this.cartItems = cartItems;
	}
	
	
	//Insert to Cart
	public void plusToCart(Long key, Item item) {
		boolean check = cartItems.containsKey(key);
		if(check) {
			int quantity_old = item.getQuantity();
			item.setQuantity(quantity_old + 1);
			cartItems.put(key, item);
		}
		else {
			cartItems.put(key, item);
		}
	}
	
	//sub to cart
	public void subToCart(Long key, Item item) {
		boolean check = cartItems.containsKey(key);
		if(check) {
			int quantity_old = item.getQuantity();
			if(quantity_old <= 1) {
				cartItems.remove(key);
			}else {
				item.setQuantity(quantity_old -1);
				cartItems.put(key, item);
			}
		}
	}
	
	//remove to Cart
	public void removeToCart(Long key) {
		boolean check = cartItems.containsKey(key);
		if(check) {
			cartItems.remove(key);
		}
	}
	
	//count item
	public int countProduct() {
		int count = 0;
		for(Entry<Long, Item> item : cartItems.entrySet()) {
			count += item.getValue().getQuantity();
		}
		return count;
	}
	
	//sum total
	public long totalCart() {
		long count = 0;
	
		for(Map.Entry<Long, Item> list : cartItems.entrySet()) {
			count += list.getValue().getProduct().getProductPrice() * list.getValue().getQuantity();
		}
		return count;
	}
	
	
	
	
	

}
