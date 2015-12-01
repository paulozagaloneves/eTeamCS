package org.eteamcs.service;

import java.util.List;

import org.eteamcs.dao.ICompanieDAO;
import org.eteamcs.model.Companie;
import org.eteamcs.model.CompanySearch;
import org.springframework.validation.Validator;

/**
 * Manager Interface to table companies
 * @author Javalee v. 1.1 Generator
 * $Id$
 */
public interface ICompanieManager {

	public void setCompanieDAO(ICompanieDAO dao);
    
	public List getCompanies();
	
	public List getCompanies(CompanySearch cs);
	
	public Companie getCompanyByName(String name);
	
	public List getCompaniesByInitial(String initial);	
	
	public Companie getCompanie(java.lang.Long companyId);
	
	public Companie saveCompanie(Companie companie);
	
	public void removeCompanie(java.lang.Long companyId);
	
	public void setValidator(Validator validator);
	
}
