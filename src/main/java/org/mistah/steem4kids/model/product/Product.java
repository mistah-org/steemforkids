package org.mistah.steem4kids.model.product;

import java.math.BigDecimal;

import org.mistah.steem4kids.model.admin.Brand;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "products")
public class Product {

    @Id
    private String id;
    private String name;
    private Brand brand;
    private BigDecimal price;
    private String currency;

    public Product(String id, String name, Brand brand, BigDecimal price, String currency) {
        super();
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.currency = currency;
    }
    
    public Product() {
        this.id = null;
        this.name = null;
        this.brand = null;
        this.price = null;
        this.currency = null;
    }
    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public BigDecimal getPrice() {
        return price;
    }
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    public String getCurrency() {
        return currency;
    }
    public void setCurrency(String currency) {
        this.currency = currency;
    }
    public Brand getBrand() {
        return brand;
    }
    public void setBrand(Brand brand) {
        this.brand = brand;
    }

}