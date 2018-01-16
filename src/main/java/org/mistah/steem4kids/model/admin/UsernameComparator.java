package org.mistah.steem4kids.model.admin;

import java.util.Comparator;

public class UsernameComparator implements Comparator<SystemUser> {
    @Override
    public int compare(SystemUser x, SystemUser y) {
        if (x == null || y == null) {
            return 0;
        }
        return x.getUsername().compareTo(y.getUsername());
    }
}