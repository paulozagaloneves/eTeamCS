package org.eteamcs.dao;

import java.util.List;

import org.eteamcs.model.Relation;

/**
 * DAO Interface to table companies
 * @author Pneves
 *
 */
public interface IRelationDAO extends IDAO {

	public List getRelations();
		
	public Relation getRelation(Long relationId);
		
	public void saveRelation(Relation relation);
		
	public void removeRelation(Long relationId);
}
