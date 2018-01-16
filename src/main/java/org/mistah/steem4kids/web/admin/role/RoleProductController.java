package org.mistah.steem4kids.web.admin.role;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.mistah.steem4kids.model.admin.Role;
import org.mistah.steem4kids.model.product.Product;
import org.mistah.steem4kids.repository.ProductRepository;
import org.mistah.steem4kids.repository.RoleRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RoleProductController {

    private final Logger logger = LoggerFactory.getLogger(RoleProductController.class);

    @Autowired
    private RoleRepository roleRepo;

    @Autowired
    private ProductRepository productRepo;

    @RequestMapping(value = "/admin/role_product", method = RequestMethod.GET)
    public String index(Map<String, Object> model) {

        List<Role> roles = roleRepo.findAll();
        for (Role role : roles) {
            if (role.getViewableProducts() == null) {
                role.setViewableProducts(new ArrayList<String>());
            }
        }
        model.put("roles", roles);

        List<Product> products = productRepo.findAllByOrderByIdAsc();
        Map<String, String> productsMap = new LinkedHashMap<String, String>();
        for (Product product : products) {
            productsMap.put(product.getId(), product.getName());
        }
        model.put("products", productsMap);

        return "admin/role_product/index";
    }

    @RequestMapping(value = "/admin/role_product/{roleId}/edit", method = RequestMethod.GET)
    public String newRole(@PathVariable String roleId, Model model) {

        List<Product> products = productRepo.findAllByOrderByIdAsc();
        Map<String, String> productsMap = new LinkedHashMap<String, String>();
        for (Product product : products) {
            productsMap.put(product.getId(), product.getName());
        }
        model.addAttribute("products", productsMap);

        Role role = roleRepo.findOne(roleId);
        if (role.getViewableProducts() == null) {
            role.setViewableProducts(new ArrayList<String>());
        }
        model.addAttribute("role", role);


        return "admin/role_product/edit";
    }

    @RequestMapping(value = "/admin/role_product/{roleId}/edit", method = RequestMethod.POST)
    public String create(@ModelAttribute Role role, ModelMap model) {
        roleRepo.save(role);
        return "redirect:/admin/role_product?prompt=true";
    }
}