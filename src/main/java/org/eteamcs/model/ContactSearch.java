/*
 * Created on 13/06/2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package org.eteamcs.model;


/**
 * @author Pneves
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ContactSearch extends BaseObject {


	private String searchTerm = null;
	private String searchCategory = null;
	private String searchRelation = null;
	private String searchCompany = null;	
	private String searchLetter = null;

	
	public ContactSearch() {
		this.searchTerm = "";
		this.searchCategory = "-999";
		this.searchRelation = "-999";
		this.searchCompany = "-999";
	}
	
	public ContactSearch(ContactSearch cs) {
		this.searchTerm = cs.getSearchTerm();
		this.searchCategory = cs.getSearchCategory();
		this.searchRelation = cs.getSearchRelation();
		this.searchCompany = cs.getSearchCompany();
	}
	
	/**
	 * @return Returns the searchCategory.
	 */
	public String getSearchCategory() {
		return searchCategory;
	}
	/**
	 * @param searchCategory The searchCategory to set.
	 */
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	/**
	 * @return Returns the searchCompany.
	 */
	public String getSearchCompany() {
		return searchCompany;
	}
	/**
	 * @param searchCompany The searchCompany to set.
	 */
	public void setSearchCompany(String searchCompany) {
		this.searchCompany = searchCompany;
	}
	/**
	 * @return Returns the searchLetter.
	 */
	public String getSearchLetter() {
		return searchLetter;
	}
	/**
	 * @param searchLetter The searchLetter to set.
	 */
	public void setSearchLetter(String searchLetter) {
		this.searchLetter = searchLetter;
	}
	/**
	 * @return Returns the searchRelation.
	 */
	public String getSearchRelation() {
		return searchRelation;
	}
	/**
	 * @param searchRelation The searchRelation to set.
	 */
	public void setSearchRelation(String searchRelation) {
		this.searchRelation = searchRelation;
	}
	/**
	 * @return Returns the searchTerm.
	 */
	public String getSearchTerm() {
		return searchTerm;
	}
	/**
	 * @param searchTerm The searchTerm to set.
	 */
	public void setSearchTerm(String searchTerm) {
		this.searchTerm = searchTerm;
	}
}
