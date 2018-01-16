package org.mistah.steem4kids.web.admin.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.mistah.steem4kids.model.admin.Role;
import org.mistah.steem4kids.model.admin.SystemUser;
import org.mistah.steem4kids.repository.RoleRepository;
import org.mistah.steem4kids.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    private final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private RoleRepository roleRepo;

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String index(ModelMap model) {

        List<SystemUser> users = userRepo.findAll();
        model.put("users", users);

        return "admin/user/index";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/user/new", method = RequestMethod.GET)
    public String newUser(Model model) {
        model.addAttribute("userForm", new SystemUser());

        List<Role> roles = roleRepo.findAll();
        Map<String, String> rolesMap = new HashMap<String, String>();
        for (Role role : roles) {
            rolesMap.put(role.getId(), role.getId());
        }
        Map<String, String> treeMap = new TreeMap<String, String>(rolesMap);
        model.addAttribute("roles", treeMap);

        return "admin/user/new";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/user/new", method = RequestMethod.POST)
    public String create(@RequestParam String username, @RequestParam String firstName, @RequestParam String lastName,
            @RequestParam String password, @RequestParam(name="roles") String[] roleIds, ModelMap model) {

        List<Role> roles = new ArrayList<Role>();
        for (int i = 0 ; i < roleIds.length; i++) {
            roles.add(roleRepo.findOne(roleIds[i]));
        }

        SystemUser user = new SystemUser(username, firstName, lastName, password, roles);
        userRepo.save(user);

        return "redirect:/admin/user";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/user/{userId}/edit", method = RequestMethod.GET)
    public String edit(@PathVariable String userId, Model model) {
        List<Role> roles = roleRepo.findAll();
        model.addAttribute("roles", roles);

        SystemUser target = userRepo.findOne(userId);
        model.addAttribute("user", target);

        return "admin/user/edit";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/user/{userId}/edit", method = RequestMethod.POST)
    public String update(@RequestParam String username, @RequestParam String firstName, @RequestParam String lastName,
            @RequestParam String password, @RequestParam(name="roles") String[] roleIds, ModelMap model) {

        List<Role> roles = new ArrayList<Role>();
        for (int i = 0 ; i < roleIds.length; i++) {
            roles.add(roleRepo.findOne(roleIds[i]));
        }

        SystemUser user = new SystemUser(username, firstName, lastName, password, roles);
        userRepo.save(user);

        return "redirect:/admin/user";
    }
}