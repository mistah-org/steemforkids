package org.mistah.steem4kids.service;

import java.util.ArrayList;
import java.util.List;

import org.mistah.steem4kids.model.admin.Role;
import org.mistah.steem4kids.model.product.Product;
import org.mistah.steem4kids.repository.ProductRepository;
import org.mistah.steem4kids.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleProductGenerator {

    @Autowired
    private RoleRepository roleRepo;

    @Autowired
    private ProductRepository productRepo;

    public void populateDefault() {
        Role admin = roleRepo.findOne("ROLE_ADMIN");

        if (admin.getViewableProducts() == null || admin.getViewableProducts().isEmpty()) {
            List<String> viewableProducts = new ArrayList<String>();
            List<Product> products = productRepo.findAll();
            for (Product product : products) {
                viewableProducts.add(product.getId());
            }
            admin.setViewableProducts(viewableProducts);
            roleRepo.save(admin);
        }
    }

}
