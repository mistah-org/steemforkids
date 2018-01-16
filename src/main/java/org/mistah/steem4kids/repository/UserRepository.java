package org.mistah.steem4kids.repository;

import org.mistah.steem4kids.model.admin.SystemUser;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends MongoRepository<SystemUser, String> {
}