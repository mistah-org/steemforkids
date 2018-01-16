package org.mistah.steem4kids.config;

import javax.inject.Inject;

import org.mistah.steem4kids.service.BookService;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class SpringContextListener implements ApplicationListener<ContextRefreshedEvent> {
	
	@Inject 
	private BookService bookService;

	/**
	 * This method will run on application startup and load up the default book
	 * collection into the MongoDB database.
	 */
	public void onApplicationEvent(ContextRefreshedEvent event) {
		bookService.deleteAll();
		bookService.restoreDefaultBooks();
	};
}
