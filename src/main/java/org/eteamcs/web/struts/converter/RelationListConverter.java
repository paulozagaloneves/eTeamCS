/*
 * Created on 22/Jun/2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package org.eteamcs.web.struts.converter;

import java.util.ArrayList;
import java.util.Collection;

import org.eteamcs.model.Relation;

import formdef.plugin.conversion.ConversionContext;
import formdef.plugin.conversion.FormCollectionConverter;

/**
 * @author igod
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class RelationListConverter extends FormCollectionConverter {
	   public Collection getFormCollection(ConversionContext context,
	                                                String propertyName,
	                                                Collection source) {
	   	Relation rel = new Relation();
	   	rel.setRelationId(new Long(1));
	   	rel.setName("Name");
	   	ArrayList relations = new ArrayList();
	   	relations.add(rel);
	       return relations;  // replace with whatever List class you need in your forms
	   }
	   public Collection getBeanCollection(ConversionContext context,
	                                                String propertyName,
	                                                Collection source) {
	       return source;  // replace with whatever List class you need in your beans
	   }
	}
