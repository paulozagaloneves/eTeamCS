package org.eteamcs.ws;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.eteamcs.service.ICategoryManager;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.eteamcs.model.Category;

public class CategoryWS {
	WebApplicationContext wac = null;
	ICategoryManager catManager = null;
	
	private void init() {
    	WebContext ctx = WebContextFactory.get();
    	ServletContext servletContext =ctx.getServletContext();
    	wac = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
    	catManager=(ICategoryManager)wac.getBean("categoryManager");
	}
	
    public CategoryWS() {
		super();
		init();
	}

	public List<Category> getAllCategories() {     	
    	return catManager.getCategories();
    }
    
    public List<Category> getAllParentCategories() { 
    	List<Category> result = new ArrayList<Category>();
    	List<Category> allCategories=catManager.getCategories();
    	
    	// add all parent categories
    	for (Category category : allCategories) {
			if (category.getParentId() == null) {
				result.add(category);
			}
		}
    	
    	return result;
    }
    
    public List<Category> getAllCategoriesByParentId(Long parentId) { 
    	List<Category> allCategories=catManager.getCategoriesByParentId(parentId);
    	
    	
    	return allCategories;
    }
    
    public void saveCategory(Category category) { 
    	category.setUsername("igod");
    	catManager.saveCategory(category);
    }
}
