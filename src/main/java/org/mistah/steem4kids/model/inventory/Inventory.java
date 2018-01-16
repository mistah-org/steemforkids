package org.mistah.steem4kids.model.inventory;

import java.util.Map;

public abstract class Inventory {

    private Map<String, Integer> productInventoryMap;

    public Map<String, Integer> getProductInventoryMap() {
        return productInventoryMap;
    }
    public void setProductInventoryMap(Map<String, Integer> productInventoryMap) {
        this.productInventoryMap = productInventoryMap;
    }

}