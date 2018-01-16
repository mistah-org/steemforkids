package org.mistah.steem4kids.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mistah.steem4kids.enumeration.FormStatus;
import org.mistah.steem4kids.enumeration.FormType;
import org.mistah.steem4kids.model.admin.form.LocaleStoreForm;
import org.mistah.steem4kids.model.admin.form.ProductOrder;
import org.mistah.steem4kids.model.product.Product;
import org.mistah.steem4kids.repository.LocaleStoreFormRepository;
import org.mistah.steem4kids.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocaleStoreFormGenerator {

    @Autowired
    private LocaleStoreFormRepository lsFormRepo;

    @Autowired
    private ProductRepository productRepo;

    private static final List<Object[]> LOCALE_STORE_ORDER_FORMS = new ArrayList<Object[]>();
    static {
        List<Object[]> localeStoreForms = new ArrayList<Object[]>();
        DateFormat df = new SimpleDateFormat("M/d/yyyy");
        //*
        try {
            localeStoreForms.add(new Object[] {
                    FormType.ORDER, df.parse("5/7/2017"),
                    "Dominica G. Emata", "09309583681",
                    "NCR", "South", "C5",
                    //PNJ,  PNC,    Spirulina,  TLC,    DermCee,    Barley,     Gluta,      CTB,    Daniel's Coffee,    Essentials
                    null,       5,      2,          null,   5,          null,       null,       null,   null,               null,
                    "Reanick G. Emata", "9367501542", null});

            localeStoreForms.add(new Object[] {
                    FormType.ORDER, df.parse("5/7/2017"),
                    "Sis. Lolit Manallo", "09309583681",
                    "Cavite", "Central", "Malagasang",
                    //PNJ,  PNC,    Spirulina,  TLC,    DermCee,    Barley,     Gluta,      CTB,    Daniel's Coffee,    Essentials
                    null,       null,      2,     5,      null,       null,       null,       null,   null,               null,
                    "Jing Jordan", "09993206290", null});

            localeStoreForms.add(new Object[] {
                    FormType.ORDER, df.parse("5/7/2017"),
                    "Aberex Amon", "09434042757",
                    "NCR", "Central", "Mindanao Avenue",
                    //PNJ,  PNC,    Spirulina,  TLC,    DermCee,    Barley,     Gluta,      CTB,    Daniel's Coffee,    Essentials
                    2,          5,      2,      null,   null,       null,       null,       null,   null,               null,
                    "Annie Basio", "09957141992", "mcentralbap@gmail.com"});

            localeStoreForms.add(new Object[] {
                    FormType.ORDER, df.parse("5/7/2017"),
                    "Bro. Fernan Flores", "09957141992",
                    "NCR", "Central", "Maligaya",
                    //PNJ,  PNC,    Spirulina,  TLC,    DermCee,    Barley,     Gluta,      CTB,    Daniel's Coffee,    Essentials
                    null,   5,      2,          null,   null,       null,       null,       null,   null,               null,
                    "Annie Basio", "09957141992", "mcentralbap@gmail.com"});

            localeStoreForms.add(new Object[] {
                    FormType.ORDER, df.parse("5/7/2017"),
                    "Bro. Alfie Panganiban", "09434070866",
                    "NCR", "Central", "Sitio veterans",
                    //PNJ,  PNC,    Spirulina,  TLC,    DermCee,    Barley,     Gluta,      CTB,    Daniel's Coffee,    Essentials
                    2,      null,   1,          null,   null,       null,       null,       null,   null,               null,
                    "Annie Basio", "09957141992", "mcentralbap@gmail.com"});

            localeStoreForms.add(new Object[] {
                    FormType.ORDER, df.parse("5/7/2017"),
                    "Olympus Sison", "09285603556",
                    "NCR", "Central", "Banawe",
                    //PNJ,  PNC,    Spirulina,  TLC,    DermCee,    Barley,     Gluta,      CTB,    Daniel's Coffee,    Essentials
                    1,      1,      1,          null,   null,       null,       null,       null,   null,               null,
                    "Annie Basio", "09957141992", "mcentralbap@gmail.com"});

            localeStoreForms.add(new Object[] {
                    FormType.ORDER, df.parse("5/7/2017"),
                    "Olympus Sison", "09285603556",
                    "NCR", "Central", "Banawe",
                    //PNJ,  PNC,    Spirulina,  TLC,    DermCee,    Barley,     Gluta,      CTB,    Daniel's Coffee,    Essentials
                    1,      1,      1,          null,   null,       null,       null,       null,   null,               null,
                    "Annie Basio", "09957141992", "mcentralbap@gmail.com"});

            localeStoreForms.add(new Object[] {
                    FormType.REMITTANCE, df.parse("5/7/2017"),
                    "Dhang Purificacion", "9226763788",
                    "Cavite", "Central", "Area-E",
                    //PNJ,  PNC,    Spirulina,  TLC,    DermCee,    Barley,     Gluta,      CTB,    Daniel's Coffee,    Essentials
                        1,  null,   null,       null,   null,       null,       null,       null,   null,               null,
                        "Reanick G. Emata", "9367501542", null});


        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        /* */
        LOCALE_STORE_ORDER_FORMS.addAll(localeStoreForms);
    }

    public void createData() {
        Product pnj = productRepo.findOne("BRO001");
        Product pnc = productRepo.findOne("BRO002");
        Product spi = productRepo.findOne("BRO003");
        Product bar = productRepo.findOne("BRO004");
        Product drm = productRepo.findOne("BRO005");
        Product tlc = productRepo.findOne("BRO006");
        Product glu = productRepo.findOne("BRO007");
        Product ctb = productRepo.findOne("BRO008");
        Product dcp = productRepo.findOne("BRO009");
        Product ess = productRepo.findOne("USA101");

        List<LocaleStoreForm> lsForms = lsFormRepo.findAll();
        if (lsForms.isEmpty())  {
            for (Object[] lsFormInfo : LOCALE_STORE_ORDER_FORMS) {
                int i = 0;
                lsFormRepo.save(
                    new LocaleStoreForm(
                        (FormType) lsFormInfo[i++], (Date) lsFormInfo[i++],
                        (String) lsFormInfo[i++], (String) lsFormInfo[i++],
                        (String) lsFormInfo[i++], (String) lsFormInfo[i++], (String) lsFormInfo[i++],
                        //PNJ,  PNC,    Spirulina,  TLC,    DermCee,    Barley,     Gluta,      CTB,    Daniel's Coffee,    Essentials
                        new ProductOrder[] {
                            new ProductOrder(pnj.getId(), (Integer) lsFormInfo[i++]),
                            new ProductOrder(pnc.getId(), (Integer) lsFormInfo[i++]),
                            new ProductOrder(spi.getId(), (Integer) lsFormInfo[i++]),
                            new ProductOrder(bar.getId(), (Integer) lsFormInfo[i++]),
                            new ProductOrder(drm.getId(), (Integer) lsFormInfo[i++]),
                            new ProductOrder(tlc.getId(), (Integer) lsFormInfo[i++]),
                            new ProductOrder(glu.getId(), (Integer) lsFormInfo[i++]),
                            new ProductOrder(ctb.getId(), (Integer) lsFormInfo[i++]),
                            new ProductOrder(dcp.getId(), (Integer) lsFormInfo[i++]),
                            new ProductOrder(ess.getId(), (Integer) lsFormInfo[i++])
                        },
                        (String) lsFormInfo[i++], (String) lsFormInfo[i++], FormStatus.OPEN
                    )
                );
            }
        }
    }

}
