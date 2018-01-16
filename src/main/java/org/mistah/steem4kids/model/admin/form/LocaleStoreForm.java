package org.mistah.steem4kids.model.admin.form;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.bson.types.ObjectId;
import org.mistah.steem4kids.enumeration.FormStatus;
import org.mistah.steem4kids.enumeration.FormType;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

@Document(collection = "forms")
public class LocaleStoreForm {

    @Id
    private ObjectId id;
    private FormType formType;

    /** Locale Store Coordinator inInfo */
    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private Date transactionDate;
    private String transactBy;
    private String contact;
    private String division;
    private String district;
    private String locale;

    /** Products */
    private List<ProductOrder> productOrders;

    /** Transact Information */
    private String pickupPurchaseRemitBy;
    private String contactNo;

    private FormStatus status;

    public LocaleStoreForm() {
        this.setId(new ObjectId());
    }

    public LocaleStoreForm(FormType formType, Date transactionDate,
            String transactBy, String contact, String division, String district, String locale,
            ProductOrder[] productOrders,
            String pickupPurchaseRemitBy, String contactNo, FormStatus status) {
        super();
        this.setId(new ObjectId());
        this.setFormType(formType);
        this.transactionDate = transactionDate;
        this.transactBy = transactBy;
        this.contact = contact;
        this.division = division;
        this.district = district;
        this.locale = locale;
        this.productOrders = Arrays.asList(productOrders);
        this.pickupPurchaseRemitBy = pickupPurchaseRemitBy;
        this.contactNo = contactNo;
        this.status = status;
    }
    public Date getTransactionDate() {
        return transactionDate;
    }
    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }
    public String getTransactBy() {
        return transactBy;
    }
    public void setTransactBy(String transactBy) {
        this.transactBy = transactBy;
    }
    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }
    public String getDivision() {
        return division;
    }
    public void setDivision(String division) {
        this.division = division;
    }
    public String getDistrict() {
        return district;
    }
    public void setDistrict(String district) {
        this.district = district;
    }
    public String getLocale() {
        return locale;
    }
    public void setLocale(String locale) {
        this.locale = locale;
    }
    public List<ProductOrder> getProductOrders() {
        return productOrders;
    }
    public void setProductOrders(List<ProductOrder> productOrders) {
        this.productOrders = productOrders;
    }
    public String getPickupPurchaseRemitBy() {
        return pickupPurchaseRemitBy;
    }
    public void setPickupPurchaseRemitBy(String pickupPurchaseRemitBy) {
        this.pickupPurchaseRemitBy = pickupPurchaseRemitBy;
    }
    public String getContactNo() {
        return contactNo;
    }
    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }
    public FormStatus getStatus() {
        return status;
    }
    public void setStatus(FormStatus status) {
        this.status = status;
    }

    public FormType getFormType() {
        return formType;
    }

    public void setFormType(FormType formType) {
        this.formType = formType;
    }

    public ObjectId getId() {
        return id;
    }

    public void setId(ObjectId id) {
        this.id = id;
    }

}