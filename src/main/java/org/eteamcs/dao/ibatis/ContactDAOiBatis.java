
package org.eteamcs.dao.ibatis;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.eteamcs.dao.IContactDAO;
import org.eteamcs.model.Contact;
import org.eteamcs.model.ContactSearch;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;




/**
 * This class interacts with Spring's ibatis framework to save and retrieve  Contact objects.
 * @author Paulo Neves
 * Generated by Javalee
 * $Id$
 */
public class ContactDAOiBatis extends SqlMapClientDaoSupport implements IContactDAO {

    /**
     * Get Contacts Values List
     *
     * @return List
     */
    public List getContacts(ContactSearch cs) {
    	ContactSearch newcs=new ContactSearch(cs);
    	if(!cs.getSearchTerm().trim().equals(""))
    		newcs.setSearchTerm("%"+cs.getSearchTerm().toLowerCase()+"%");
    	
       return getSqlMapClientTemplate().queryForList("searchContacts",newcs);
    }
    
    public List getContactsByInitial(String letter) {
    	Object parameterObject = new ContactKeywords(letter,"");
    	return getSqlMapClientTemplate().queryForList("getContacts",parameterObject);
    }
    
    public List getContactsByCompanyId(Long companyId) {
    	return getSqlMapClientTemplate().queryForList("getContactsByCompanyId",companyId);
    }    
	
    /**
     * Retrieves Contact
     *   
     * @return Contact
    */
    public Contact getContact(java.lang.Long contactId) {
		Contact contact =
				(Contact) getSqlMapClientTemplate().queryForObject("getContact",contactId);
		
		if (contact == null) {
			throw new ObjectRetrievalFailureException(Contact.class, new Object[] {contactId});
		}
		
		return contact;
	}

    /**
	 * Save Contact
     *   
     */
	public void saveContact(Contact contact) {
		Long contactId=contact.getContactId();
		
		if(contact.getContactId() == null) {			
			getSqlMapClientTemplate().insert("addContact",contact);
			contactId =(Long)getSqlMapClientTemplate().queryForObject("getContactId",null);
			contact.setContactId(contactId);
		} else {
			getSqlMapClientTemplate().update("updateContact",contact);
		}
	}
	
	/**
	   * Remove Contact
	   *   
	   */
	public void removeContact(java.lang.Long contactId) {
		getSqlMapClientTemplate().delete("deleteContact",contactId);
	}

	 /* Inner Classes */
	
	  public static class ContactKeywords {
	    private List keywordList = new ArrayList();
	    private String letter = "";

	    public ContactKeywords(String letter, String keywords) {
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
