package org.mistah.steem4kids.web.admin.endorser;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mistah.steem4kids.model.admin.Brand;
import org.mistah.steem4kids.repository.BrandRepository;
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
public class BrandController {

    private final Logger logger = LoggerFactory.getLogger(BrandController.class);

    @Autowired
    private BrandRepository repo;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // true passed to CustomDateEditor constructor means convert empty String to null
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new MultiDateFormat(), true));
    }

    @RequestMapping(value = {"/admin/brand"}, method = RequestMethod.GET)
    public String index(Map<String, Object> model) {
        List<Brand> brands = repo.findAll();
        model.put("brands", brands);

        return "admin/brand/index";
    }


    @RequestMapping(value = {"/admin/brand/new"}, method = RequestMethod.GET)
    public String newEndorser(ModelMap model) {
        Brand brand = new Brand();
        model.addAttribute("brandForm", brand);
        return "admin/brand/new";
    }

    @RequestMapping(value = {"/admin/brand/new"}, method = RequestMethod.POST)
    public String create(@RequestParam String companyName, ModelMap model) {
        Brand brand = new Brand();
        brand.setCompanyName(companyName);
        repo.insert(brand);
        return "redirect:/admin/brand";
    }


    @RequestMapping(value = {"/admin/brand/delete"}, method = RequestMethod.POST)
    public String delete(@RequestParam String itemId, ModelMap model) {
        repo.delete(itemId);
        return "redirect:/admin/brand";
    }

    @RequestMapping(value = "/admin/brand/{id}/edit", method = RequestMethod.GET)
    public String edit(@PathVariable String id, Model model) {
        Brand target = repo.findOne(id);
        model.addAttribute("brand", target);
        return "admin/brand/edit";
    }

    @RequestMapping(value = "/admin/brand/{id}/edit", method = RequestMethod.POST)
    public String update(@RequestParam String id, @RequestParam String companyName, ModelMap model) {
        Brand target = repo.findOne(id);
        target.setCompanyName(companyName);
        repo.save(target);

        return "redirect:/admin/brand";
    }
    
}