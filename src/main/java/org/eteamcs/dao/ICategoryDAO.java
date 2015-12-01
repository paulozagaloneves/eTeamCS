package org.eteamcs.dao;

import java.util.List;

import org.eteamcs.model.Category;

/**
 * DAO Interface to table companies
 * @author Pneves
 *
 */
public interface ICategoryDAO extends IDAO {

	public List<Category> getCategories();
	
	public List<Category> getCategoriesByParentId(Long categoryId);
		
	public Category getCategory(Long categoryId);
	
	public Category getCategoryByName(String categoryName, Integer parentId);
		
	public void saveCategory(Category category);
		
	public void removeCategory(Long categoryId);
}
