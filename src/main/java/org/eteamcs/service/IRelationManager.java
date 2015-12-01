package org.eteamcs.service;

import java.util.List;

import org.eteamcs.dao.IRelationDAO;
import org.eteamcs.model.Relation;
import org.springframework.validation.Validator;

/**
 * @author Pneves
 *
 */
public interface IRelationManager {

		public void setRelationDAO(IRelationDAO dao);
	    
		public List getRelations();
		
		public Relation getRelation(Long relationId);
		
		public Relation saveRelation(Relation relation);
		
		public void removeRelation(Long relationId);
		
		public void setValidator(Validator validator);
}
