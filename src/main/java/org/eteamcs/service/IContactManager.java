
package org.eteamcs.service;

import java.util.List;

import org.eteamcs.dao.IContactDAO;
import org.eteamcs.model.Contact;
import org.eteamcs.model.ContactSearch;
import org.springframework.validation.Validator;

/**
 * Manager Interface to table contacts
 * @author Javalee v. 1.1 Generator
 * $Id$
 */
public interface IContactManager {

	public void setContactDAO(IContactDAO dao);
    
	public List getContacts(ContactSearch cs);
	
	public List getContactsByInitial(String initial);
	
	public List getContactsByCompanyId(Long companyId);
	
	public Contact getContact(java.lang.Long contactId);
	
	public Contact saveContact(Contact contact);
	
	public void removeContact(java.lang.Long contactId);
	
	public void setValidator(Validator validator);
	
}
