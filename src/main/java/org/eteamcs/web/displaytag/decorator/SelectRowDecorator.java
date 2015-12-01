/*
 * Created on 14/06/2004
 *
 */
package org.eteamcs.web.displaytag.decorator;

import org.apache.commons.lang.time.FastDateFormat;
import org.displaytag.decorator.ColumnDecorator;

/**
 * @author Pneves
 *
 */
public class SelectRowDecorator implements ColumnDecorator {
	/**
     * FastDateFormat used to format the date object.
     */
    private FastDateFormat dateFormat = FastDateFormat.getInstance("MM/dd/yyyy HH:mm:ss"); //$NON-NLS-1$

    /**
     * transform the given object into a String representation. The object is supposed to be a date.
     * @param columnValue Object
     * @return String
     */
    public final String decorate(Object columnValue)
    {   
    	Integer id=(Integer)columnValue;
    	String res = "<input type='checkbox' name='selRow' onChange='javascript: if(selRow_OnChange) { selRow_OnChange(this); }' value='"+id.intValue()+"'/>";
        return res;
    }
}
