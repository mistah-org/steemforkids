package org.mistah.steem4kids.web;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mistah.steem4kids.model.admin.Brand;
import org.mistah.steem4kids.model.admin.Division;
import org.mistah.steem4kids.model.admin.Role;
import org.mistah.steem4kids.model.admin.SystemUser;
import org.mistah.steem4kids.model.product.Product;
import org.mistah.steem4kids.repository.BrandRepository;
import org.mistah.steem4kids.repository.DivisionRepository;
import org.mistah.steem4kids.repository.ProductRepository;
import org.mistah.steem4kids.repository.RoleRepository;
import org.mistah.steem4kids.repository.UserRepository;
import org.mistah.steem4kids.service.LocaleStoreFormGenerator;
import org.mistah.steem4kids.service.RoleProductGenerator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    private final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private RoleRepository roleRepo;

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private BrandRepository brandRepo;

    @Autowired
    private ProductRepository productRepo;

    @Autowired
    private DivisionRepository divisionRepo;

    @Autowired
    LocaleStoreFormGenerator lsFormGen;

    @Autowired
    RoleProductGenerator roleProductGen;

    private static final List<String[]> USERS_LIST = new ArrayList<String[]>();
    static {
        List<String[]> systemUsers = new ArrayList<String[]>();
        //*
        systemUsers.add(new String[] {"eastmael", "East", "Mael", "1234", "ROLE_LSC"});
        /* */
        USERS_LIST.addAll(systemUsers);
    }

    private static final Map<String, List<String[]>> PRODUCTS_MAP = new HashMap<String, List<String[]>>();
    static {
        List<String[]> usanaProducts = new ArrayList<String[]>();
        usanaProducts.add(new String[] {"USA101", "Essentials", "PHP"});
        PRODUCTS_MAP.put("USANA", usanaProducts);

        List<String[]> broProducts = new ArrayList<String[]>();
        broProducts.add(new String[] {"BRO001", "PhilNONI Juice", "PHP"});
        broProducts.add(new String[] {"BRO002", "PhilNONI Capsule", "PHP"});
        broProducts.add(new String[] {"BRO003", "Spirulina", "PHP"});
        broProducts.add(new String[] {"BRO004", "Barley", "PHP"});
        broProducts.add(new String[] {"BRO005", "DermCee", "PHP"});
        broProducts.add(new String[] {"BRO006", "TLC", "PHP"});
        broProducts.add(new String[] {"BRO007", "Glutathione", "PHP"});
        broProducts.add(new String[] {"BRO008", "Coffee Table Book", "PHP"});
        broProducts.add(new String[] {"BRO009", "Daniel's Coffee Premium Set", "PHP"});
        PRODUCTS_MAP.put("BRO", broProducts);

    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Map<String, Object> model) {
//
//        createRoles();
//        createAdmin();
//        createUsers();
//        createBrands();
//        createProducts(brandRepo.findByCompanyName("USANA"));
//        createProducts(brandRepo.findByCompanyName("BRO"));
//        createDivisions();
//
//        createLocaleStoreFormData();
//
//        createRoleProductMatrix();

        return "home";
    }

    private void createRoleProductMatrix() {
        roleProductGen.populateDefault();
    }

    private void createLocaleStoreFormData() {
        lsFormGen.createData();
    }

    private void createProducts(Brand brand) {
        List<Product> findProducts = productRepo.findByBrandCompanyName(brand.getCompanyName());
        if (findProducts.isEmpty())  {
            List<String[]> products = PRODUCTS_MAP.get(brand.getCompanyName());
            for (String[] productInfo : products) {
                productRepo.save(new Product(productInfo[0], productInfo[1], brand, BigDecimal.ZERO, "PHP"));
            }
        }

    }

    private void createDivisions() {
        List<Division> divisions = divisionRepo.findAll();
        if (divisions.isEmpty())  {
            divisionRepo.save(new Division("NO1", "North 1"));
            divisionRepo.save(new Division("NO2", "North 2"));
            divisionRepo.save(new Division("BAZ", "Bataan Zambales"));
            divisionRepo.save(new Division("PAM", "Pampanga"));
            divisionRepo.save(new Division("CEN", "Centra1 Apali"));
            divisionRepo.save(new Division("BUL", "Bulacan"));
            divisionRepo.save(new Division("NCR", "National Capital Region"));
            divisionRepo.save(new Division("RIZ", "Rizal"));
            divisionRepo.save(new Division("CAV", "Cavite"));
            divisionRepo.save(new Division("LBM", "LBMR"));
            divisionRepo.save(new Division("QMA", "Quezon Marinduque"));
            divisionRepo.save(new Division("BIC", "Bicol"));
            divisionRepo.save(new Division("PAL", "Palawan"));
            divisionRepo.save(new Division("CVI", "Central Visayas"));
            divisionRepo.save(new Division("WVI", "Western Visayas"));
            divisionRepo.save(new Division("EVI", "Eastern Visayas"));
            divisionRepo.save(new Division("MIN", "Mindanao"));
        }
    }

    private void createUsers() {
        for (String[] userInfo : USERS_LIST) {
            SystemUser user = userRepo.findOne(userInfo[0]);
            if (user == null) {
                List<Role> roles = new ArrayList<Role>();
                roles.add(roleRepo.findOne(userInfo[4]));
                user = new SystemUser(userInfo[0], userInfo[1], userInfo[2], userInfo[3], roles);
                userRepo.save(user);
            }
        }
    }

    private void createBrands() {
        List<Brand> brands = brandRepo.findAll();
        if (brands.isEmpty())  {
            Brand usana = new Brand();
            usana.setCompanyName("USANA");
            brandRepo.save(usana);

            Brand bro = new Brand();
            bro.setCompanyName("BRO");
            brandRepo.save(bro);

        }
    }

    private void createAdmin() {
        SystemUser admin = userRepo.findOne("admin");
        if (admin == null) {
            List<Role> adminRole = new ArrayList<Role>();
            adminRole.add(roleRepo.findOne("ROLE_ADMIN"));
            SystemUser user = new SystemUser("admin", "Admin", "Admin", "admin", adminRole);
            userRepo.save(user);
        }
    }

    private void createRoles() {
        List<Role> roles = roleRepo.findAll();
        if (roles == null || roles.isEmpty()) {
            roles.add(roleRepo.save(new Role("ROLE_ADMIN", "Admin")));
            roles.add(roleRepo.save(new Role("ROLE_FOC", "Founder's Club")));
            roles.add(roleRepo.save(new Role("ROLE_MCO", "MiSTAH Core")));
            roles.add(roleRepo.save(new Role("ROLE_1MC", "1 Million Core")));
            roles.add(roleRepo.save(new Role("ROLE_KNP", "KNP")));
            roles.add(roleRepo.save(new Role("ROLE_DCO", "District Coordinator")));
            roles.add(roleRepo.save(new Role("ROLE_RET", "Retailer")));
            roles.add(roleRepo.save(new Role("ROLE_APR", "Apprentice")));
            roles.add(roleRepo.save(new Role("ROLE_LSC", "Locale Store Coordinator")));
            roles.add(roleRepo.save(new Role("ROLE_PRC", "Preferred Customer")));
        }
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home() {
        return "home";
    }

}