package org.mistah.steem4kids.web.user.profile;

import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.Map;

import org.mistah.steem4kids.model.admin.SystemUser;
import org.mistah.steem4kids.model.admin.UserPreference;
import org.mistah.steem4kids.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserProfileController {

    private final Logger logger = LoggerFactory.getLogger(UserProfileController.class);

    @Autowired
    private UserRepository userRepo;

    @RequestMapping(value = "/user/{userId}/profile", method = RequestMethod.GET)
    public String profile(@PathVariable String userId, Map<String, Object> model, Principal principal) {
        SystemUser user = userRepo.findOne(userId);
        model.put("user", user);

        Map<String, String> dashboardTypes = new LinkedHashMap<String,String>();
        dashboardTypes.put("basic_column", "Basic Column");
        dashboardTypes.put("column_with_table", "Column With Table");
        model.put("dashboardTypes", dashboardTypes);

        return "user/profile";
    }

    @RequestMapping(value = "/user/{userId}/profile", method = RequestMethod.POST)
    public String udpate(@PathVariable String userId,
            @RequestParam(name="preference.dashboard") String dashboardPreference,
            Map<String, Object> model, Principal principal) {
        SystemUser user = userRepo.findOne(userId);
        UserPreference preference = user.getPreference();
        preference.setDashboard(dashboardPreference);
        userRepo.save(user);
        model.put("user", user);

        return "redirect:/logout";
    }

}