package org.mistah.steem4kids.model.admin.form;

import java.math.BigDecimal;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "product_orders")
public class ProductOrder {

    @Id
    private ObjectId id;
    private String productId;
    private Integer quantity;
    private BigDecimal unitPrice;

    @Transient
    private BigDecimal totalPrice;

    public ProductOrder() {
        this.id = new ObjectId();
    }

    public ProductOrder(String productId, Integer quantity) {
        this.id = new ObjectId();
        this.setProductId(productId);
        if (quantity == null) {
            this.quantity = 0;
        } else {
            this.quantity = quantity;
        }
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public ObjectId getId() {
        return id;
    }

    public void setId(ObjectId id) {
        this.id = id;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

}