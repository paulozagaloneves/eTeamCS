/*
 * Created on 14/06/2004
 *
 */
package org.eteamcs.web.displaytag.decorator;


import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.jsp.PageContext;

import org.acegisecurity.Authentication;
import org.acegisecurity.GrantedAuthorityImpl;
import org.acegisecurity.acl.AclManager;
import org.acegisecurity.context.SecurityContextHolder;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.displaytag.decorator.TableDecorator;
import org.eteamcs.model.Contact;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class ContactsListDecorator extends TableDecorator
{
	private final Log logger = LogFactory.getLog(ContactsListDecorator.class);
	static final String SUPERUSER_ROLE = "ROLE_SUPERVISOR";
   AclManager aclManager = null;
   
   public void setAclManager(AclManager aclManager) {
      if( this.aclManager == null ) {
      	logger.debug("set this.aclManager = aclManager");
      	this.aclManager = aclManager;
      }
  }	   
	
    /**
     * Creates a new Wrapper decorator who's job is to reformat some of the data located in our TestObject's.
     */
    public ContactsListDecorator()
    {
        super();

    }

 
    /**
     * Returns the TestObject's ID as a hyperlink that the person can click on and "drill down" for more details.
     * @return String
     */
    public String getSelectRow()
    {   
    	Contact object = (Contact) getCurrentRowObject();
    	int id = object.getContactId().intValue();
    	
    	String res = "<input type='checkbox' name='selRow' onChange='javascript: if(selRow_OnChange) { selRow_OnChange(this); }' value='"+id+"'/>";
    	
        return res;
    }

    private Collection getPrincipalAuthorities() {
      Authentication currentUser = SecurityContextHolder.getContext()
                                                        .getAuthentication();

      if (null == currentUser) {
          return Collections.EMPTY_LIST;
      }

      if ((null == currentUser.getAuthorities())
          || (currentUser.getAuthorities().length < 1)) {
          return Collections.EMPTY_LIST;
      }

      Collection granted = Arrays.asList(currentUser.getAuthorities());

      return granted;
    } 
    
    private boolean hasPermission(Contact resolvedDomainObject)  {
    	boolean superuser = false; 
    	
      List auths=(List)getPrincipalAuthorities();
      
      //logger.debug("Authorize:"+auths);
      //logger.debug("SUPERUSER_ROLE:"+SUPERUSER_ROLE);
      //logger.debug("auths.contains(SUPERUSER_ROLE):"+auths.contains(new GrantedAuthorityImpl("ROLE_SUPERVISOR")));
      if(auths.contains(new GrantedAuthorityImpl(SUPERUSER_ROLE)))
      	return true;
    	
    	/*
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      PageContext pageContext=getPageContext();
      
      ApplicationContext context = getContext(pageContext);
      Map beans = context.getBeansOfType(AclManager.class, false, false);

      if (beans.size() == 0) {
      	logger.error(
      			"No AclManager would found the application context: "
      			+ context.toString());
      }

		String beanName = (String) beans.keySet().iterator().next();
		AclManager aclManager = (AclManager) context.getBean(beanName);

 
      // Obtain aclEntrys applying to the current Authentication object
      AclEntry[] acls = aclManager.getAcls(resolvedDomainObject, auth);


      if ((acls == null) || (acls.length == 0)) {
          return false;
      } 

		for (int i = 0; i < acls.length; i++) {
			//logger.debug("Acl: "+acls[i]);
			// Locate processable AclEntrys
			if (acls[i] instanceof AbstractBasicAclEntry) {
				AbstractBasicAclEntry processableAcl = (AbstractBasicAclEntry) acls[i];
		
				if(processableAcl.isPermitted(6))
					return true;
				//logger.debug("Permissions: "+processableAcl.printPermissionsBlock());

			}
		}

      */
		return false;
    }
    
    /**
     * Returns an "action bar" of sorts that allow the user to perform various actions on the TestObject based on it's
     * id.
     * @return String
     */
    public String getLinkActions()
    {
        Contact object = (Contact) getCurrentRowObject();
        int id = object.getContactId().intValue();
        String extraActions=" | " 
         + "<a href=\"/eTeamCS/secure/contacts/editContact.do?readonly=false&id=" 
         + id + "\">Editar</a> | " 
         + "<a href=\"/eTeamCS/secure/contacts/confirmDeleteContact.do?id=" 
         + id + "\">Apagar</a>";
        
        if(!hasPermission(object)) 
           	extraActions ="" ;

        return "<a href=\"/eTeamCS/secure/contacts/editContact.do?readonly=true&id=" 
            + id + "\">Ver</a>" + extraActions; 
    }
    
    
    /**
     * Allows test cases to override where application context obtained from.
     *
     * @param pageContext so the <code>ServletContext</code> can be accessed as
     *        required by Spring's <code>WebApplicationContextUtils</code>
     *
     * @return the Spring application context (never <code>null</code>)
     */
    protected ApplicationContext getContext(PageContext pageContext) {
        ServletContext servletContext = pageContext.getServletContext();

        return WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
    }

    private Integer[] parseIntegersString(String integersString)
        throws NumberFormatException {
        final Set integers = new HashSet();
        final StringTokenizer tokenizer;
        tokenizer = new StringTokenizer(integersString, ",", false);

        while (tokenizer.hasMoreTokens()) {
            String integer = tokenizer.nextToken();
            integers.add(new Integer(integer));
        }

        return (Integer[]) integers.toArray(new Integer[] {});
    }
    
}
