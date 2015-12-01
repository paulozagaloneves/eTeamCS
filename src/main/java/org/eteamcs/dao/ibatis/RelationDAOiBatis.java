package org.eteamcs.dao.ibatis;

import java.util.List;

import org.eteamcs.dao.IRelationDAO;
import org.eteamcs.model.Relation;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

/**
 * @author Pneves
 *
 */
public class RelationDAOiBatis extends SqlMapClientDaoSupport implements IRelationDAO {

	/* (non-Javadoc)
	 * @see org.eteamcs.dao.ICategory#getCategories()
	 */
	public List getRelations() {
		return getSqlMapClientTemplate().queryForList("getRelations",null);
	}

	/* (non-Javadoc)
	 * @see org.eteamcs.dao.ICategory#getCategory(java.lang.Long)
	 */
	public Relation getRelation(Long relationId) {
		Relation relation =
			(Relation) getSqlMapClientTemplate().queryForObject("getRelation",relationId);
	
	if (relation == null) {
		throw new ObjectRetrievalFailureException(Relation.class, new Object[] {relationId});
	}
	
	return relation;
	}

	/* (non-Javadoc)
	 * @see org.eteamcs.dao.IRelation#saveRelation(org.eteamcs.model.Relation)
	 */
	public void saveRelation(Relation relation) {
		if(relation.getRelationId() == null) {			
			getSqlMapClientTemplate().insert("addRelation",relation);
		} else {
			getSqlMapClientTemplate().update("updateRelation",relation);
		}

	}

	/* (non-Javadoc)
	 * @see org.eteamcs.dao.IRelation#removeRelation(java.lang.Long)
	 */
	public void removeRelation(Long relationId) {
		getSqlMapClientTemplate().delete("deleteRelation",new Object[] {relationId});
	}

}
