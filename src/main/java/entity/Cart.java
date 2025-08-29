/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author mac
 */
public class Cart {
    private int cartId; 
    private int cusId; 
    private int productId ; 
    private int quantity; 

    public Cart(int cusId, int productId, int quantity) {
        this.cusId = cusId;
        this.productId = productId;
        this.quantity = quantity;
    }

    

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getCusId() {
        return cusId;
    }

    public void setCusId(int cusId) {
        this.cusId = cusId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" + "cartId=" + cartId + ", cusId=" + cusId + ", productId=" + productId + ", quantity=" + quantity + '}';
    }
    
    
}
