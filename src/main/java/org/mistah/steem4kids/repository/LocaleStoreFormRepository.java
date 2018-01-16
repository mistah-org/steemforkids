package org.mistah.steem4kids.repository;

import java.util.Date;
import java.util.List;

import org.mistah.steem4kids.enumeration.FormStatus;
import org.mistah.steem4kids.enumeration.FormType;
import org.mistah.steem4kids.model.admin.form.LocaleStoreForm;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LocaleStoreFormRepository extends MongoRepository<LocaleStoreForm, String> {
    List<LocaleStoreForm> findAllByOrderByTransactionDate();

    List<LocaleStoreForm> findByLocaleAndFormTypeAndStatusOrderByTransactionDateDesc(String locale, FormType order,
            FormStatus confirmed);

    List<LocaleStoreForm> findByFormTypeAndStatusAndTransactionDateLessThan(FormType order, FormStatus confirmed,
            Date stagnantDate);
}