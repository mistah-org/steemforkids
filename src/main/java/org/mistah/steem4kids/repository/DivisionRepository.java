package org.mistah.steem4kids.repository;

import org.mistah.steem4kids.model.admin.Division;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DivisionRepository extends MongoRepository<Division, String> {
}