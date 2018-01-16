package org.mistah.steem4kids.model.admin;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "users")
public class SystemUser {

    @Id
    private String username;
    private String firstName;
    private String lastName;
    private String password;
    private UserPreference preference;

    @DBRef
    private List<Role> roles;

    public SystemUser() {
        this.preference = new UserPreference();
    }
    public SystemUser(String username, String firstName, String lastName, String password, List<Role> roles) {
        super();
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.roles = roles;
        this.preference = new UserPreference();
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public List<Role> getRoles() {
        return roles;
    }
    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
    public UserPreference getPreference() {
        return preference;
    }
    public void setPreference(UserPreference preference) {
        this.preference = preference;
    }

}