package org.mistah.steem4kids.web.admin.role;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mistah.steem4kids.model.admin.Role;
import org.mistah.steem4kids.model.admin.SystemUser;
import org.mistah.steem4kids.repository.RoleRepository;
import org.mistah.steem4kids.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RoleController {

    private final Logger logger = LoggerFactory.getLogger(RoleController.class);

    @Autowired
    private RoleRepository roleRepo;

    @RequestMapping(value = "/admin/role", method = RequestMethod.GET)
    public String index(Map<String, Object> model) {

        List<Role> roles = roleRepo.findAll();
        model.put("roles", roles);

        return "admin/role/index";
    }

    @RequestMapping(value = "/admin/role/new", method = RequestMethod.GET)
    public String newRole(Model model) {
        model.addAttribute("roleForm", new Role());
        return "admin/role/new";
    }

    @RequestMapping(value = "/admin/role/new", method = RequestMethod.POST)
    public String create(@ModelAttribute("SpringWeb") Role role, ModelMap model) {
        roleRepo.save(role);
        return "redirect:/admin/role";
    }
}