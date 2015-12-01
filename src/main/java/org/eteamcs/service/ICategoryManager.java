package org.eteamcs.service;

import java.util.List;

import org.eteamcs.dao.ICategoryDAO;
import org.eteamcs.model.Category;
import org.springframework.validation.Validator;

/**
 * @author Pneves
 *
 */
public interface ICategoryManager {

		public void setCategoryDAO(ICategoryDAO dao);
	    
		public List<Category> getCategories();
		
		public List<Category> getCategoriesByParentId(Long parentId);
		
		public Category getCategory(Long categoryId);
		
		public Category getCategoryByName(String name, Integer parentId);
		
		public Category saveCategory(Category category);
		
		public void removeCategory(Long categoryId);
		
		public void setValidator(Validator validator);
}
