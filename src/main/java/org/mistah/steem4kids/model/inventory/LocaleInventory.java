package org.mistah.steem4kids.model.inventory;

import java.util.HashMap;
import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "locale_inventories")
public class LocaleInventory {

    @Id
    private String locale;
    private String division;
    private String district;
    private Map<String, Integer> productInventoryMap;

    public LocaleInventory(String locale, String division, String district) {
        this.setLocale(locale);
        this.setDivision(division);
        this.setDistrict(district);
        this.setProductInventoryMap(new HashMap<String, Integer>());
    }

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    public Map<String, Integer> getProductInventoryMap() {
        return productInventoryMap;
    }

    public void setProductInventoryMap(Map<String, Integer> productInventoryMap) {
        this.productInventoryMap = productInventoryMap;
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

}