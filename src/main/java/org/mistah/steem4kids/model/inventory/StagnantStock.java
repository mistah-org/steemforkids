package org.mistah.steem4kids.model.inventory;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

@Document(collection = "stagnant_stocks")
public class StagnantStock {

    @Id
    private String locale;

    /** Locale Store Coordinator inInfo */
    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private Date stagnantBy;
    private String contact;
    private String division;
    private String district;

    /** Products */
    private Map<String, Integer> stocks;

    public StagnantStock(String locale) {
        this.locale = locale;
    }

    public StagnantStock(Date stagnantBy,
            String contact, String division, String district, String locale) {
        super();
        this.stagnantBy = stagnantBy;
        this.contact = contact;
        this.division = division;
        this.district = district;
        this.locale = locale;
        this.stocks = new HashMap<String, Integer>();
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

}