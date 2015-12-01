package org.eteamcs.dao;

import java.util.List;

import org.eteamcs.model.Country;

/**
 * DAO Interface to table companies
 * @author Pneves
 *
 */
public interface ICountryDAO extends IDAO {

	public List getCountries();
		
	public Country getCountry(String acronym);
		
	public void saveCountry(Country country);
		
	public void removeCountry(String acronym);
}
