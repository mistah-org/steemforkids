package org.mistah.steem4kids.repository;

import org.mistah.steem4kids.model.admin.Role;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends MongoRepository<Role, String> {
}