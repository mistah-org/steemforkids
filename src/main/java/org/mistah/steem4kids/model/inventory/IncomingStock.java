package org.mistah.steem4kids.model.inventory;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.data.annotation.Id;

public class IncomingStock {

    @Id
    private String id;

    private String orderFormNo;
    private Date dateDelivered;
    private Date deliveredBy;
    private String product;
    private Integer quantity;
    private BigDecimal unitPrice;
    private String receivedBy;

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getOrderFormNo() {
        return orderFormNo;
    }
    public void setOrderFormNo(String orderFormNo) {
        this.orderFormNo = orderFormNo;
    }
    public Date getDateDelivered() {
        return dateDelivered;
    }
    public void setDateDelivered(Date dateDelivered) {
        this.dateDelivered = dateDelivered;
    }
    public Date getDeliveredBy() {
        return deliveredBy;
    }
    public void setDeliveredBy(Date deliveredBy) {
        this.deliveredBy = deliveredBy;
    }
    public String getProduct() {
        return product;
    }
    public void setProduct(String product) {
        this.product = product;
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
    public String getReceivedBy() {
        return receivedBy;
    }
    public void setReceivedBy(String receivedBy) {
        this.receivedBy = receivedBy;
    }

}
