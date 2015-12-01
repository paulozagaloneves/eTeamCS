
package org.eteamcs.dao.ibatis;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.eteamcs.dao.ICompanieDAO;
import org.eteamcs.dao.ibatis.ContactDAOiBatis.ContactKeywords;
import org.eteamcs.model.Companie;
import org.eteamcs.model.CompanySearch;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;




/**
 * This class interacts with Spring's ibatis framework to save and retrieve  Companie objects.
 * @author Paulo Neves
 * Generated by Javalee
 * $Id$
 */
public class CompanieDAOiBatis extends SqlMapClientDaoSupport implements ICompanieDAO {

    /**
     * Get Companies Values List
     *
     * @return List
     */
    public List getCompanies(CompanySearch cs) {
    	CompanySearch newcs=new CompanySearch(cs);
    	if(!cs.getSearchTerm().trim().equals(""))
    		newcs.setSearchTerm("%"+cs.getSearchTerm().toLowerCase()+"%");
    	
       return getSqlMapClientTemplate().queryForList("searchCompanies",newcs);
    }

    public List getCompaniesByInitial(String letter) {
    	Object parameterObject = new ContactKeywords(letter,"");
    	return getSqlMapClientTemplate().queryForList("getCompanies",parameterObject);
    }    
    
    /**
     * Retrieves Companie
     *   
     * @return Companie
    */
    public Companie getCompanie(java.lang.Long companyId) {
		Companie companie =
				(Companie) getSqlMapClientTemplate().queryForObject("getCompanie",companyId);
		
		if (companie == null) {
			throw new ObjectRetrievalFailureException(Companie.class, new Object[] {companyId});
		}
		
		return companie;
	}

    /**
     * Retrieves Companie
     *   
     * @return Companie
    */
    public Companie getCompanieByName(String name) {
		Companie companie =
				(Companie) getSqlMapClientTemplate().queryForObject("getCompanieByName",name);
		
		return companie;
	}
    
    /**
	 * Save Companie
     *   
     */
	public void saveCompanie(Companie companie) {
		Long companyId=companie.getCompanyId();

		if(companie.getCompanyId()==null) {			
			getSqlMapClientTemplate().insert("addCompanie",companie);
			companyId =(Long)getSqlMapClientTemplate().queryForObject("getCompanyId",null);
			companie.setCompanyId(companyId);			
		} else {
			getSqlMapClientTemplate().update("updateCompanie",companie);
		}
	}
	
	/**
	   * Remove Companie
	   *   
	   */
	public void removeCompanie(java.lang.Long companyId) {
		getSqlMapClientTemplate().delete("deleteCompanie",companyId);
	}

	 /* Inner Classes */
	
	  public static class CompanieKeywords {
	    private List keywordList = new ArrayList();
	    private String letter = "";

	    public CompanieKeywords(String letter, String keywords) {
	      StringTokenizer splitter = new StringTokenizer(keywords, " ", false);
	      while (splitter.hasMoreTokens()) {
	        keywordList.add("%" + splitter.nextToken() + "%");
	      }
	      if(!letter.trim().equals(""))
	      	this.letter = letter +"%";
	    }

	    public List getKeywordList() {
	      return keywordList;
	    }
	    
	    public String getLetter() {
	    	return this.letter;
	    }
	  }
}
