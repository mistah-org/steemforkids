package org.mistah.steem4kids.web.inventory;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.mistah.steem4kids.enumeration.FormStatus;
import org.mistah.steem4kids.model.admin.Division;
import org.mistah.steem4kids.model.admin.form.LocaleStoreForm;
import org.mistah.steem4kids.model.product.Product;
import org.mistah.steem4kids.repository.DivisionRepository;
import org.mistah.steem4kids.repository.LocaleStoreFormRepository;
import org.mistah.steem4kids.repository.ProductRepository;
import org.mistah.steem4kids.web.MultiDateFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LocaleStoreFormEditController {

    private final Logger logger = LoggerFactory.getLogger(LocaleStoreFormEditController.class);

    @Autowired
    private LocaleStoreFormRepository repo;

    @Autowired
    private DivisionRepository divisionRepo;

    @Autowired
    private ProductRepository productRepo;

    @RequestMapping(value = {"/locale_store_form/{id}/edit" }, method = RequestMethod.GET)
    public String edit(@PathVariable String id, Model model) {
        LocaleStoreForm lsForm = repo.findOne(id);
        model.addAttribute("lsForm", lsForm);

        List<Division> divisions = divisionRepo.findAll();
        model.addAttribute("divisions", divisions);

        List<Product> products = productRepo.findAllByOrderByIdAsc();
        Map<String, String> productsMap = new LinkedHashMap<String, String>();
        for (Product product : products) {
            productsMap.put(product.getId(), product.getName());
        }
        model.addAttribute("products", productsMap);

        return "locale_store_form/edit";
    }

    @RequestMapping(value = {"/locale_store_form/{id}/edit" }, method = RequestMethod.POST)
    public String update(
            @PathVariable String id,
            @ModelAttribute("lsForm") LocaleStoreForm lsForm,
            BindingResult errors) {
        repo.save(lsForm);
        return "redirect:/locale_store_form?success=true";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // true passed to CustomDateEditor constructor means convert empty String to null
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new MultiDateFormat(), true));
    }

}