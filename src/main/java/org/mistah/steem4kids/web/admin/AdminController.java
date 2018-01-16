package org.mistah.steem4kids.web.admin;

import org.mistah.steem4kids.repository.ProductRepository;
import org.mistah.steem4kids.repository.RoleRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

    private final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private RoleRepository roleRepo;

    @Autowired
    private ProductRepository productRepo;

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String index(Model model) {
        boolean hasRoleAndProducts = !roleRepo.findAll().isEmpty()
                && !productRepo.findAll().isEmpty();
        model.addAttribute("hasRoleAndProducts",  hasRoleAndProducts);
        return "admin/index";
    }

}