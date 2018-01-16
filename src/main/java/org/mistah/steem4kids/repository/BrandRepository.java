package org.mistah.steem4kids.repository;

import org.mistah.steem4kids.model.admin.Brand;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BrandRepository extends MongoRepository<Brand, String> {

    Brand findByCompanyName(String companyName);
}