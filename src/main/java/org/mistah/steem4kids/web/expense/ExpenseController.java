package org.mistah.steem4kids.web.expense;

import java.util.List;

import org.mistah.steem4kids.model.expense.Expense;
import org.mistah.steem4kids.repository.ExpenseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ExpenseController {

    @Autowired
    ExpenseRepository expenseRepo;

    @RequestMapping(value = {"/expenses"}, method = RequestMethod.GET)
    public List<Expense> getExpenses() {
        return expenseRepo.findAll();
    }

    @RequestMapping(value = {"/expenses/{id}"}, method = RequestMethod.GET)
    public ResponseEntity<Expense> getCustomer(@PathVariable("id") String id) {

        Expense expense = expenseRepo.findOne(id);
        if (expense == null) {
            return new ResponseEntity("No Expense found for ID " + id, HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<Expense>(expense, HttpStatus.OK);
    }
}
