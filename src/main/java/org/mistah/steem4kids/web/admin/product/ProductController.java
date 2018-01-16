package org.mistah.steem4kids.web.admin.product;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mistah.steem4kids.model.admin.Brand;
import org.mistah.steem4kids.model.product.Product;
import org.mistah.steem4kids.repository.BrandRepository;
import org.mistah.steem4kids.repository.ProductRepository;
import org.mistah.steem4kids.web.MultiDateFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

    private final Logger logger = LoggerFactory.getLogger(ProductController.class);

    @Autowired
    private ProductRepository repo;

    @Autowired
    private BrandRepository brandRepo;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // true passed to CustomDateEditor constructor means convert empty String to null
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new MultiDateFormat(), true));
    }

    @RequestMapping(
            value = {"/product", "/admin/product" },
            method = RequestMethod.GET
    )
    public String index(Map<String, Object> model) {
        List<Product> Products = repo.findAllByOrderByIdAsc();
        model.put("products", Products);

        return "admin/product/index";
    }

    @RequestMapping(
            value = {"/product/new", "/admin/product/new"},
            method = RequestMethod.GET
    )
    public String newInstance(Model model) {
        Product product = new Product();
        model.addAttribute("product", product);

        List<Brand> brands = brandRepo.findAll();
        model.addAttribute("brands", brands);
        
        return "admin/product/new";

    }

    @RequestMapping(
            value = {"/product/new", "/admin/product/new"},
            method = RequestMethod.POST
    )
    public String register(
            @RequestParam String id,
            @RequestParam String name,
            @RequestParam(name="brand") String brandId,
            @RequestParam BigDecimal price,
            ModelMap model) {

        Product product = new Product();
        product.setId(id);
        product.setName(name);
        
        Brand brand = brandRepo.findOne(brandId);
        product.setBrand(brand);
        
        product.setPrice(price);
        product.setCurrency("PHP");

        repo.insert(product);
        return "redirect:/product";
    }

    @RequestMapping(
            value = {"/product/{productId}/edit", "/admin/product/{productId}/edit"},
            method = RequestMethod.GET
    )
    public String edit(@PathVariable String productId, Model model) {
        Product product = repo.findOne(productId);
        model.addAttribute("product", product);
        
        List<Brand> brands = brandRepo.findAll();
        model.addAttribute("brands", brands);

        return "admin/product/edit";
    }

    @RequestMapping(
            value = {"/product/{productId}/edit", "/admin/product/{productId}/edit"},
            method = RequestMethod.POST
    )
    public String update(
            @PathVariable String productId,
            @RequestParam String name,
            @RequestParam(name="brand") String brandId,
            @RequestParam BigDecimal price,
            @RequestParam(defaultValue="PHP") String currency,
            ModelMap model) {

        Product product = repo.findOne(productId);
        product.setName(name);
        product.setPrice(price);
        product.setCurrency(currency);

        Brand brand = brandRepo.findOne(brandId);
        product.setBrand(brand);
        
        repo.save(product);
        return "redirect:/product";
    }

    @RequestMapping(
            value = {"/product/delete", "/admin/product/delete"},
            method = RequestMethod.POST
    )
    public String delete(
            @RequestParam final String productId,
            Model model) {
        repo.delete(productId);
        return "redirect:/admin/product";
    }

}