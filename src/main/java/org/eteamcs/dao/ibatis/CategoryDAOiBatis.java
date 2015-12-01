package org.eteamcs.dao.ibatis;

import java.util.List;

import org.eteamcs.dao.ICategoryDAO;
import org.eteamcs.model.Category;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

/**
 * @author Pneves
 *
 */
public class CategoryDAOiBatis extends SqlMapClientDaoSupport implements ICategoryDAO {

	/* (non-Javadoc)
	 * @see org.eteamcs.dao.ICategory#getCategories()
	 */
	public List<Category> getCategories() {
		return getSqlMapClientTemplate().queryForList("getCategories",null);
	}

	public List<Category> getCategoriesByParentId(Long parentId) {

		return getSqlMapClientTemplate().queryForList("getCategoriesByParentId",parentId);
	}
	
	/* (non-Javadoc)
	 * @see org.eteamcs.dao.ICategory#getCategory(java.lang.Long)
	 */
	public Category getCategory(Long categoryId) {
		Category category =
			(Category) getSqlMapClientTemplate().queryForObject("getCategory",categoryId);
	
	if (category == null) {
		throw new ObjectRetrievalFailureException(Category.class, new Object[] {categoryId});
	}
	
	return category;
	}

	public Category getCategoryByName(String categoryName, Integer parentId) {
		CategorySearch cs = new CategorySearch(categoryName,parentId);
		Category category =
			(Category) getSqlMapClientTemplate().queryForObject("getCategoryByName",cs);
		
	return category;
	}
	
	/* (non-Javadoc)
	 * @see org.eteamcs.dao.ICategory#saveCategory(org.eteamcs.model.Category)
	 */
	public void saveCategory(Category category) {
		Long categoryId=category.getCategoryId();
		if(category.getCategoryId() == null) {			
			getSqlMapClientTemplate().insert("addCategory",category);
			categoryId =(Long)getSqlMapClientTemplate().queryForObject("getCategoryId",null);
			category.setCategoryId(categoryId);
		} else {
			getSqlMapClientTemplate().update("updateCategory",category);
		}

	}

	/* (non-Javadoc)
	 * @see org.eteamcs.dao.ICategory#removeCategory(java.lang.Long)
	 */
	public void removeCategory(Long categoryId) {
		getSqlMapClientTemplate().delete("deleteCategory",new Object[] {categoryId});
	}

	
	 public static class CategorySearch {
		 private String name;
		 private Integer parentId;
		 		 
		 
		public CategorySearch(String name, Integer parentId) {
			this.name = name;
			this.parentId = parentId;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Integer getParentId() {
			return parentId;
		}
		public void setParentId(Integer parentId) {
			this.parentId = parentId;
		}
		 
		 
	 }
}
