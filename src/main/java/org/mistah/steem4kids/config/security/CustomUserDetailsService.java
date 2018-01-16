package org.mistah.steem4kids.config.security;

import java.util.ArrayList;
import java.util.List;

import org.mistah.steem4kids.model.admin.Role;
import org.mistah.steem4kids.model.admin.SystemUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private MongoTemplate mongoTemplate;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SystemUser user = getUserDetail(username);
        CustomUserDetails userDetail = new CustomUserDetails(user, getAuthorities(user.getRoles()));
        return userDetail;
    }

    public List<GrantedAuthority> getAuthorities(List<Role> roles) {
        List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
        for (Role role : roles) {
            authList.add(new SimpleGrantedAuthority(role.getId()));
        }
        return authList;
    }

    public SystemUser getUserDetail(String username) {
        MongoOperations mongoOperation = (MongoOperations) mongoTemplate;
        SystemUser user = mongoOperation.findOne(new Query(Criteria.where("username").is(username)), SystemUser.class);
        return user;
    }

}