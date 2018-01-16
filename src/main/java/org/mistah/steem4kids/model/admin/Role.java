package org.mistah.steem4kids.model.admin;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "roles")
public class Role {

    @Id
    private String id;
    private String description;
    private List<String> viewableProducts;

    public Role() {
        super();
    }
    public Role(String id, String description) {
        super();
        this.id = id;
        this.description = description;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public List<String> getViewableProducts() {
        return viewableProducts;
    }
    public void setViewableProducts(List<String> viewableProducts) {
        this.viewableProducts = viewableProducts;
    }

}