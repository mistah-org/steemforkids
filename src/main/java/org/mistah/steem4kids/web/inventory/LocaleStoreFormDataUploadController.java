package org.mistah.steem4kids.web.inventory;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.bson.types.ObjectId;
import org.mistah.steem4kids.enumeration.FormStatus;
import org.mistah.steem4kids.enumeration.FormType;
import org.mistah.steem4kids.model.admin.form.LocaleStoreForm;
import org.mistah.steem4kids.model.admin.form.ProductOrder;
import org.mistah.steem4kids.repository.LocaleStoreFormRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class LocaleStoreFormDataUploadController {

    private static final int START_OF_PRODUCT_HEADER_INDEX = 8;
    private static final int END_OF_PRODUCT_HEADER_INDEX = 18;

    private final Logger logger = LoggerFactory.getLogger(LocaleStoreFormDataUploadController.class);

    @Autowired
    private LocaleStoreFormRepository lsFormRepo;

    @RequestMapping(value = {"/locale_store_form/data_upload" }, method = RequestMethod.GET)
    public String get(Model model) {
        model.addAttribute("fileuploadForm", new LocaleStoreFormFileUploadForm());

        return "locale_store_form/data_upload";
    }

    @RequestMapping(value = "/locale_store_form/data_upload", method = RequestMethod.POST)
    public String upload(@RequestParam MultipartFile file) throws Exception {

        XSSFWorkbook myWorkBook = null;
        try{
            myWorkBook = new XSSFWorkbook (file.getInputStream());
            // Return first sheet from the XLSX workbook
            XSSFSheet mySheet = myWorkBook.getSheetAt(0);
            // Get iterator to all the rows in current sheet
            Iterator<Row> rowIterator = mySheet.iterator();

            // Traversing over each row of XLSX file
            boolean isFirstRow = true;
            DateFormat df = new SimpleDateFormat("yyyy/MM/dd h:m");


            List<String> headerProdIds = new ArrayList<String>();
            while (rowIterator.hasNext()) {
                // Skip first row (table header)
                if (isFirstRow) {
                    Row row = rowIterator.next();
                    isFirstRow = false;

                    for (int i = START_OF_PRODUCT_HEADER_INDEX; i < END_OF_PRODUCT_HEADER_INDEX; i++) {
                        String prodId = row.getCell(i).getStringCellValue();
                        headerProdIds.add(prodId);
                    }
                    continue;
                }

                Row row = rowIterator.next();
                // For each row, iterate through each columns
                LocaleStoreForm lsForm = new LocaleStoreForm();

                int cellIdx = 0;

                Date timestamp = row.getCell(cellIdx++).getDateCellValue();
                ObjectId id = new ObjectId(timestamp);
                lsForm.setId(id);

                FormType formType = getFormType(row.getCell(cellIdx++).getStringCellValue());
                lsForm.setFormType(formType);

                Date transactionDate = row.getCell(cellIdx++).getDateCellValue();
                lsForm.setTransactionDate(transactionDate);

                String transactBy = row.getCell(cellIdx++).getStringCellValue();
                lsForm.setTransactBy(transactBy);

                String contact = String.valueOf(row.getCell(cellIdx++).getNumericCellValue());
                lsForm.setContact(contact);

                String division = row.getCell(cellIdx++).getStringCellValue();
                lsForm.setDivision(division);

                Cell districtCell = row.getCell(cellIdx++);
                String district = "";
                if (districtCell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
                    district = String.valueOf((int) districtCell.getNumericCellValue());
                } else {
                    district = districtCell.getStringCellValue();
                }
                lsForm.setDistrict(district);

                String locale = row.getCell(cellIdx++).getStringCellValue();
                lsForm.setLocale(locale);

                List<ProductOrder> productOrders = new ArrayList<ProductOrder>();
                for (String prodId : headerProdIds) {
                    Cell cell = row.getCell(cellIdx++);
                    Integer quantity = 0;
                    if (cell != null) {
                        double quantityDbl = cell.getNumericCellValue();
                        quantity = (int) quantityDbl;
                    }
                    productOrders.add(new ProductOrder(prodId, quantity));
                }
                lsForm.setProductOrders(productOrders);

                String pickupPurchaseRemitBy = row.getCell(cellIdx++).getStringCellValue();
                lsForm.setPickupPurchaseRemitBy(pickupPurchaseRemitBy);

                String contactNo = String.valueOf(row.getCell(cellIdx++).getNumericCellValue());
                lsForm.setContactNo(contactNo);

                lsForm.setStatus(FormStatus.OPEN);

                lsFormRepo.save(lsForm);
            }

        }catch(Exception e){
            logger.info(e.getMessage()+" "+e.getCause());
            throw e;
        } finally {
            try {
                if (myWorkBook != null) {
                    myWorkBook.close();
                }
            } catch (IOException e) {
            }
        }

        return "redirect:/locale_store_form?success=true";
    }

    private FormType getFormType(String stringCellValue) {
        if (stringCellValue == null) {
            return null;
        }

        String formDesc = stringCellValue.split(" ")[0];
        return FormType.valueOf(formDesc.toUpperCase());
    }

}