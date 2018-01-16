package org.mistah.steem4kids.config.security;

import java.util.Collection;

import org.mistah.steem4kids.model.admin.SystemUser;
import org.springframework.security.core.GrantedAuthority;

public class CustomUserDetails extends org.springframework.security.core.userdetails.User {

    /** auto-generated serialVersionUID */
    private static final long serialVersionUID = -4533278283358246109L;

    private SystemUser user;

    public CustomUserDetails(SystemUser user, Collection<? extends GrantedAuthority> authorities) {
        super(user.getUsername(), user.getPassword(), authorities);
        this.user = user;
    }

    public CustomUserDetails(SystemUser user, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        super(user.getUsername(), user.getPassword(), enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.user = user;
    }

    public SystemUser getUser() {
        return user;
    }

}
