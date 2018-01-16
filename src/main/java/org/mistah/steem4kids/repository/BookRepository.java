package org.mistah.steem4kids.repository;

import org.mistah.steem4kids.domain.Book;
import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * Spring Data MongoDB repository for the Book entity.
 */
public interface BookRepository extends MongoRepository<Book,String> {
	 Book findOneById(String id);
}
