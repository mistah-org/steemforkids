package org.mistah.steem4kids.repository;

import org.mistah.steem4kids.model.inventory.LocaleInventory;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LocaleInventoryRepository extends MongoRepository<LocaleInventory, String> {
}