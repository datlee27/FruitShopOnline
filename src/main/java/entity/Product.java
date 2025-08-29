/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author mac
 */
public class Product {
    private int id ; 
    private String nameProduct; 
    private String img ; 
    private double price ; 
    private String title ; 
    private String description; 

    

    public Product(int id, String nameProduct, String img, double price, String title, String description) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.img = img;
        this.price = price;
        this.title = title;
        this.description = description;
    }

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", nameProduct=" + nameProduct + ", img=" + img + ", price=" + price + ", title=" + title + ", description=" + description + '}';
    }

   

  

    
            
            
    
    
}
