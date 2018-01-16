package org.mistah.steem4kids.web.dashboard;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DashboardController {

    private final Logger logger = LoggerFactory.getLogger(DashboardController.class);

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String dashboard(Map<String, Object> model,
            SecurityContextHolderAwareRequestWrapper securityRequest) {

        String dashboardUrl = "";
        if (isAdmin(securityRequest)) {
            dashboardUrl = "redirect:/admin";
        } else if (securityRequest.isUserInRole("ROLE_LSC")) {
            dashboardUrl = "redirect:/locale_store_form/new";
        } else {
            dashboardUrl  = "/index";
        }


        return dashboardUrl;
    }

    private boolean isAdmin(SecurityContextHolderAwareRequestWrapper securityRequest) {
        return securityRequest.isUserInRole("ROLE_ADMIN");
    }

}