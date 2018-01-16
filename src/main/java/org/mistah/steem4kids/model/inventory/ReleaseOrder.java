package org.mistah.steem4kids.model.inventory;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.data.annotation.Id;

public class ReleaseOrder {

    @Id
    private String id;

    private String releaseFormNo;
    private Date dateReleased;
    private String product;
    private Integer quantity;
    private BigDecimal unitAmount;
    private BigDecimal totalAmount;

    private String paymentMode;
    private Date paymentDate;
    private String releasedBy;
    private String receivedBy;

    private String personAccountable;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getReleaseFormNo() {
        return releaseFormNo;
    }

    public void setReleaseFormNo(String releaseFormNo) {
        this.releaseFormNo = releaseFormNo;
    }

    public Date getDateReleased() {
        return dateReleased;
    }

    public void setDateReleased(Date dateReleased) {
        this.dateReleased = dateReleased;
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

    public BigDecimal getUnitAmount() {
        return unitAmount;
    }

    public void setUnitAmount(BigDecimal unitAmount) {
        this.unitAmount = unitAmount;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getReleasedBy() {
        return releasedBy;
    }

    public void setReleasedBy(String releasedBy) {
        this.releasedBy = releasedBy;
    }

    public String getReceivedBy() {
        return receivedBy;
    }

    public void setReceivedBy(String receivedBy) {
        this.receivedBy = receivedBy;
    }

    public String getPersonAccountable() {
        return personAccountable;
    }

    public void setPersonAccountable(String personAccountable) {
        this.personAccountable = personAccountable;
    }

}
