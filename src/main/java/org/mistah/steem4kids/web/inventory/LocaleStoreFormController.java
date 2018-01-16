package org.mistah.steem4kids.web.inventory;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mistah.steem4kids.enumeration.FormStatus;
import org.mistah.steem4kids.enumeration.FormType;
import org.mistah.steem4kids.model.admin.Division;
import org.mistah.steem4kids.model.admin.form.LocaleStoreForm;
import org.mistah.steem4kids.model.admin.form.ProductOrder;
import org.mistah.steem4kids.model.inventory.LocaleInventory;
import org.mistah.steem4kids.model.product.Product;
import org.mistah.steem4kids.repository.DivisionRepository;
import org.mistah.steem4kids.repository.LocaleInventoryRepository;
import org.mistah.steem4kids.repository.LocaleStoreFormRepository;
import org.mistah.steem4kids.repository.ProductRepository;
import org.mistah.steem4kids.web.MultiDateFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LocaleStoreFormController {

    private final Logger logger = LoggerFactory.getLogger(LocaleStoreFormController.class);

    @Autowired
    private LocaleStoreFormRepository repo;

    @Autowired
    private ProductRepository productRepo;

    @Autowired
    private DivisionRepository divisionRepo;

    @Autowired
    private LocaleInventoryRepository localeInvRepo;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // true passed to CustomDateEditor constructor means convert empty String to null
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new MultiDateFormat(), true));
    }

    @RequestMapping(value = {"/locale_store_form" },
            method = RequestMethod.GET)
    public String index(Map<String, Object> model) {
        List<LocaleStoreForm> lsForms = repo.findAllByOrderByTransactionDate();
        model.put("lsForms", lsForms);

        return "locale_store_form/index";
    }

    @RequestMapping(value = {"/locale_store_form/new" },
            method = RequestMethod.GET)
    public String newInstance(Model model) {
        LocaleStoreForm lsForm = new LocaleStoreForm();
        model.addAttribute("lsForm", lsForm);

        List<Division> divisions = divisionRepo.findAll();
        model.addAttribute("divisions", divisions);

        List<Product> products = productRepo.findAllByOrderByIdAsc();
        model.addAttribute("products", products);

        ArrayList<ProductOrder> productOrders = new ArrayList<ProductOrder>();
        for (int i = 0; i < products.size(); i++) {
            productOrders.add(new ProductOrder());
        }
        lsForm.setProductOrders(productOrders);

        return "locale_store_form/new";

    }

    @RequestMapping(value = {"/locale_store_form/new" },
            method = RequestMethod.POST)
    public String register(
            @ModelAttribute("lsForm") LocaleStoreForm lsForm,
            SecurityContextHolderAwareRequestWrapper securityRequest) {
        lsForm.setStatus(FormStatus.OPEN);
        repo.insert(lsForm);

        String view = "redirect:/locale_store_form/new?success=true";
        if (securityRequest.isUserInRole("ROLE_ADMIN")) {
            view = "redirect:/locale_store_form?success=true";
        }
        return view;
    }

    @RequestMapping(value = {"/locale_store_form/delete" },
            method = RequestMethod.POST)
    public String delete(
            @RequestParam(name="itemId") final String id,
            Model model) {
        repo.delete(id);
        return "redirect:/locale_store_form";
    }

    @RequestMapping(value = { "/locale_store_form/{id}/view" },
            method = RequestMethod.GET)
    public String view(@PathVariable String id, Model model) {
        LocaleStoreForm lsForm = repo.findOne(id);
        model.addAttribute("lsForm", lsForm);

        List<Division> divisions = divisionRepo.findAll();
        model.addAttribute("divisions", divisions);

        List<Product> products = productRepo.findAll();
        Map<String, String> productsMap = new HashMap<String, String>();
        for (Product product : products) {
            productsMap.put(product.getId(), product.getName());
        }
        model.addAttribute("products", productsMap);

        return "locale_store_form/view";
    }

    @RequestMapping(value = {"/locale_store_form/confirm" },
            method = RequestMethod.POST)
    public String confirm(
            @RequestParam(name="itemId") final String id,
            Model model) {
        LocaleStoreForm lsForm = repo.findOne(id);
        lsForm.setStatus(FormStatus.CONFIRMED);
        repo.save(lsForm);

        LocaleInventory localeInv = localeInvRepo.findOne(lsForm.getLocale());
        if (localeInv == null) {
            localeInv = new LocaleInventory(lsForm.getLocale(), lsForm.getDivision(), lsForm.getDistrict());

            Map<String, Integer> productInventoryMap = localeInv.getProductInventoryMap();

            List<Product> products = productRepo.findAllByOrderByIdAsc();
            for (Product product : products) {
                productInventoryMap.put(product.getId(), 0);
            }

            localeInvRepo.save(localeInv);
        }

        if (lsForm.getFormType().equals(FormType.ORDER)) {
            addStock(localeInv, lsForm.getProductOrders());
        } else if (lsForm.getFormType().equals(FormType.REMITTANCE)) {
            subtractStock(localeInv, lsForm.getProductOrders());
        }
        localeInvRepo.save(localeInv);

        return "redirect:/locale_store_form";
    }

    private void subtractStock(LocaleInventory localeInv, List<ProductOrder> orders) {
        Map<String, Integer> productInventoryMap = localeInv.getProductInventoryMap();
        for (ProductOrder order : orders) {
            String productId = order.getProductId();

            Integer currentStock = productInventoryMap.get(productId);
            if (currentStock == null) {
                currentStock = 0;
            }
            Integer quantity = 0;
            if (order != null && order.getQuantity() != null) {
                quantity = order.getQuantity();
            }
            productInventoryMap.put(productId, currentStock - quantity);
        }
    }

    private void addStock(LocaleInventory localeInv, List<ProductOrder> orders) {
        Map<String, Integer> productInventoryMap = localeInv.getProductInventoryMap();
        for (ProductOrder order : orders) {
            String productId = order.getProductId();

            Integer currentStock = productInventoryMap.get(productId);
            if (currentStock == null) {
                currentStock = 0;
            }
            Integer quantity = 0;
            if (order != null && order.getQuantity() != null) {
                quantity = order.getQuantity();
            }
            productInventoryMap.put(productId, currentStock + quantity);
        }
    }

    @RequestMapping(value = {"/locale_store_form/cancel" },
            method = RequestMethod.POST)
    public String cancel(
            @RequestParam(name="itemId") final String id,
            Model model) {
        LocaleStoreForm lsForm = repo.findOne(id);
        lsForm.setStatus(FormStatus.CANCELLED);
        repo.save(lsForm);
        return "redirect:/locale_store_form";
    }


}