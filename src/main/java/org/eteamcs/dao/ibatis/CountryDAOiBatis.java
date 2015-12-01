package org.eteamcs.dao.ibatis;

import java.util.List;

import org.eteamcs.dao.ICountryDAO;
import org.eteamcs.model.Country;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

/**
 * @author Pneves
 *
 */
public class CountryDAOiBatis extends SqlMapClientDaoSupport implements ICountryDAO {

	/* (non-Javadoc)
	 * @see org.eteamcs.dao.ICategory#getCategories()
	 */
	public List getCountries() {
		return getSqlMapClientTemplate().queryForList("getCountries",null);
	}

	/* (non-Javadoc)
	 * @see org.eteamcs.dao.ICategory#getCategory(java.lang.Long)
	 */
	public Country getCountry(String acronym) {
		Country country =
			(Country) getSqlMapClientTemplate().queryForObject("getCountry",acronym);
	
	if (country == null) {
		throw new ObjectRetrievalFailureException(Country.class, new Object[] {acronym});
	}
	
	return country;
	}

	/* (non-Javadoc)
	 * @see org.eteamcs.dao.ICategory#saveCategory(org.eteamcs.model.Category)
	 */
	public void saveCountry(Country country) {
		if(country.getAcronym() == null) {			
			getSqlMapClientTemplate().insert("addCountry",country);
		} else {
			getSqlMapClientTemplate().update("updateCountry",country);
		}

	}

	/* (non-Javadoc)
	 * @see org.eteamcs.dao.ICategory#removeCategory(java.lang.Long)
	 */
	public void removeCountry(String acronym) {
		getSqlMapClientTemplate().delete("deleteCountry",new Object[] {acronym});
	}

}
