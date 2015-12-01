//Created by MyEclipse Struts
// XSL source (default): platform:/plugin/com.genuitec.eclipse.cross.easystruts.eclipse_3.8.4/xslt/JavaClass.xsl

package org.eteamcs.web.struts.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.MappingDispatchAction;
import org.apache.struts.validator.DynaValidatorActionForm;
import org.apache.struts.validator.DynaValidatorForm;
import org.eteamcs.model.Category;
import org.eteamcs.model.Contact;
import org.eteamcs.model.ContactSearch;
import org.eteamcs.model.Relation;
import org.eteamcs.service.ICategoryManager;
import org.eteamcs.service.ICompanieManager;
import org.eteamcs.service.IContactManager;
import org.eteamcs.service.ICountryManager;
import org.eteamcs.service.IRelationManager;

import formdef.plugin.util.FormUtils;

/** 
 * MyEclipse Struts
 * Creation date: 06-10-2005
 * 
 * XDoclet definition:
 * @struts:action path="/createContact" name="createContactForm" input="/secure/contacts/createContact.jsp" parameter="create" scope="request" validate="true"
 * @struts:action-forward name="addContact" path="/secure/contacts/createContact.jsp"
 * @struts:action-forward name="createContactSuccess" path="/secure/contacts/listContact"
 */
public class ContactAction extends MappingDispatchAction {
	private final Log log = LogFactory.getLog(ContactAction.class);
    private IContactManager contactManager = null;
    private ICompanieManager companyManager = null;
    private IRelationManager relationManager = null;
    private ICategoryManager categoryManager = null;
    private ICountryManager countryManager = null;

    public void setContactManager(IContactManager contactManager) {
        if( this.contactManager == null ) {
        	log.debug("set this.contactManager = contactManager");
        	this.contactManager = contactManager;
        }
    }	
    
    public void setCompanyManager(ICompanieManager companyManager) {
        if( this.companyManager == null ) {
        	log.debug("set this.companyManager = companyManager");
        	this.companyManager = companyManager;
        }
    } 

    public void setRelationManager(IRelationManager relationManager) {
        if( this.relationManager == null ) {
        	log.debug("set this.relationManager = relationManager");
        	this.relationManager = relationManager;
        }
    } 

    public void setCategoryManager(ICategoryManager categoryManager) {
        if( this.categoryManager == null ) {
        	log.debug("set this.categoryManager = categoryManager");
        	this.categoryManager = categoryManager;
        }
    }   

    public void setCountryManager(ICountryManager countryManager) {
        if( this.countryManager == null ) {
        	log.debug("set this.countryManager = countryManager");
        	this.countryManager = countryManager;
        }
    }    

	// --------------------------------------------------------- Instance Variables

	// --------------------------------------------------------- Methods
    
	/** 
	 * Method create
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward create(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response) {
		
		List companies = null;
		List categories = null;
		List relations = null;
		List countries = null;
		
		DynaActionForm createContactForm = (DynaActionForm) form;
        if (log.isDebugEnabled()) {
            log.debug("entering create method...");
        }
        
        categories = categoryManager.getCategories();
        relations = relationManager.getRelations();
        countries = countryManager.getCountries();
        
        
        //      create our empty form bean
       
        ActionForm saveContactForm = FormUtils.getInstance()
        .createActionForm("saveContactForm", this, mapping, request);
        

        request.getSession().setAttribute("saveContactForm",saveContactForm);
        
        request.setAttribute("companyName","");
        request.getSession().setAttribute("categories",categories);
        request.getSession().setAttribute("relations",relations);
        request.getSession().setAttribute("countries",countries);
		
		return mapping.findForward("addContact");        
	}
	
	private long debugTimeInfo(String step,long initialTime) {
		long debugTime = System.currentTimeMillis();
		log.debug("Time to execute "+step+":"+(debugTime-initialTime));
		
		return debugTime;
	}
	
	/** 
	 * Method edit
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward edit(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response) 
	 throws Exception {
		
		//DynaActionForm saveContactForm = (DynaActionForm) form;
        if (log.isDebugEnabled()) {
            log.debug("entering edit method...");
        }
        Contact contact = null;
        List companies = null;
        List categories = null;
			List relations = null;
			List countries = null;
		
        Long id = new Long(request.getParameter("id"));
        String readonly = request.getParameter("readonly");
        String companyName = "";
        
        long initialTime = System.currentTimeMillis();
        contact = contactManager.getContact(id);
        if(contact.getCompany()!=null) {
        	  companyName = contact.getCompany().getName();
        }
        initialTime=debugTimeInfo("contactManager.getContact",initialTime);
        //companies = companyManager.getCompanies();
        initialTime=debugTimeInfo("companyManager.getCompanies",initialTime);
        categories = categoryManager.getCategories();
        initialTime=debugTimeInfo("categoryManager.getCategories",initialTime);
        //relations = relationManager.getRelations();
        //initialTime=debugTimeInfo("relationManager.getRelations",initialTime);
        countries = countryManager.getCountries();
        initialTime=debugTimeInfo("countryManager.getCountries",initialTime);
        
        ActionForm saveContactForm = 
            FormUtils.setFormValues("saveContactForm", contact,
                    this, mapping, request);
        initialTime=debugTimeInfo("FormUtils.setFormValues",initialTime);
        
        request.getSession().setAttribute("saveContactForm",saveContactForm);

        
        //log.debug("Readonly:"+readonly);
        //log.debug("Contact:"+contact.toString());
        
        // Efetuar copia da lista de relacoes
        List categoriesCopy=new ArrayList();
        for(Iterator iter=categories.iterator(); iter.hasNext();) {
        	Category cat = (Category)iter.next();
        	categoriesCopy.add(new Category(cat));
        }
        initialTime=debugTimeInfo("Copia das categorias",initialTime);
        
        // Extract attributes we will need
        int i=0;
        int column=0;
        for(Iterator iter=categoriesCopy.iterator(); iter.hasNext();) {
        	Category cat = (Category)iter.next();
        	
        	if(contact.getCategories().contains(cat))
        		cat.setChecked("checked");
        	
        	if (cat.getParentId() == null)
        		column = i++ % 3;
        	
        	cat.setColumn(column);

        }
        
        initialTime=debugTimeInfo("interseccao relacoes",initialTime);
        //log.debug("Relations: "+relationsCopy);
        
        
        request.setAttribute("readonly",readonly);
        request.setAttribute("companyName",companyName);
        //request.setAttribute("companies",companies);
        request.setAttribute("categories",categoriesCopy);
        //request.setAttribute("relations",relationsCopy);
        request.setAttribute("countries",countries);
		
		return mapping.findForward("editContact");        
	}
	
	
	
	/** 
	 * Method save
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward save(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		
		DynaActionForm saveContactForm = (DynaActionForm) form;
        if (log.isDebugEnabled()) {
            log.debug("entering saveContact method...");
        }
        
        Contact contact = null;
        if (form != null) {
            if (log.isDebugEnabled()) {
                log.debug("received form=" + form);
                if (form instanceof ActionForm) log.debug("ActionForm");
                if (form instanceof DynaActionForm) log.debug("DynaActionForm");
                if (form instanceof DynaValidatorForm) log.debug("DynaValidatorForm");
                if (form instanceof DynaValidatorActionForm) log.debug("DynaValidatorActionForm");
            }
            contact = (Contact) FormUtils.getFormValues(saveContactForm,this,mapping,request);
                                   
            contact.setUsername("igod");
            log.info("received sampler=" + contact);
        }
        
        String[] categories = request.getParameterValues("categories");
        
        
        // Set Relations to Contact Bean
        ArrayList lCategories=new ArrayList();
        for(int i=0; categories!=null && i<categories.length; i++) {
        	Category rel=new Category();
        	rel.setCategoryId(new Long(categories[i]));        	
        	lCategories.add(rel);
        }
        contact.setCategories(lCategories);
        
        log.debug("Relations List:"+contact.getCategories());   
        log.info("sampler=" + contact);
        
        contactManager.saveContact(contact);
        /*ResourceBundle rb =
            ResourceBundle.getBundle("messages");
        log.debug("contact.saved.msgInfo:"+rb.getString("contact.saved.msgInfo"));*/
        request.getSession().removeAttribute("saveContactForm");              
        request.getSession().setAttribute("msgInfo","Contato salvo com sucesso!");
        	
		return mapping.findForward("saveContactSuccess");        
	}	
	
	/** 
	 * Method confirmDelete
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward confirmDelete(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response) 
	 throws Exception {
		
		//DynaActionForm saveContactForm = (DynaActionForm) form;
        if (log.isDebugEnabled()) {
            log.debug("entering confirmDelete method...");
        }
        Contact contact = null;
        List companies = null;
        List categories = null;
			List relations = null;
			List countries = null;
		
        Long id = new Long(request.getParameter("id"));
        String readonly = "true";
        String companyName = "";
        
        long initialTime = System.currentTimeMillis();
        contact = contactManager.getContact(id);
        if(contact.getCompany()!=null) {
        	  companyName = contact.getCompany().getName();
        }
        initialTime=debugTimeInfo("contactManager.getContact",initialTime);
        //companies = companyManager.getCompanies();
        initialTime=debugTimeInfo("companyManager.getCompanies",initialTime);
        categories = categoryManager.getCategories();
        initialTime=debugTimeInfo("categoryManager.getCategories",initialTime);
        relations = relationManager.getRelations();
        initialTime=debugTimeInfo("relationManager.getRelations",initialTime);
        countries = countryManager.getCountries();
        initialTime=debugTimeInfo("countryManager.getCountries",initialTime);
        
        ActionForm saveContactForm = 
            FormUtils.setFormValues("saveContactForm", contact,
                    this, mapping, request);
        initialTime=debugTimeInfo("FormUtils.setFormValues",initialTime);
        
        request.getSession().setAttribute("saveContactForm",saveContactForm);

        
        //log.debug("Readonly:"+readonly);
        //log.debug("Contact:"+contact.toString());
        
        // Efetuar copia da lista de relacoes
        List relationsCopy=new ArrayList();
        for(Iterator iter=relations.iterator(); iter.hasNext();) {
        	Relation rel = (Relation)iter.next();
        	relationsCopy.add(new Relation(rel));
        }
        initialTime=debugTimeInfo("Copia das relacoes",initialTime);
        
        // Extract attributes we will need
        for(Iterator iter=relationsCopy.iterator(); iter.hasNext();) {
        	Relation rel = (Relation)iter.next();
        	
        	if(contact.getRelations().contains(rel))
        		rel.setChecked("checked");

        }
        
        initialTime=debugTimeInfo("interseccao relacoes",initialTime);
        //log.debug("Relations: "+relationsCopy);
        
        
        request.setAttribute("readonly",readonly);
        request.setAttribute("companyName",companyName);
        //request.setAttribute("companies",companies);
        request.setAttribute("categories",categories);
        request.setAttribute("relations",relationsCopy);
        request.setAttribute("countries",countries);
		
		return mapping.findForward("confirmDeleteContact");        
	}	
	
	/** 
	 * Method delete
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward delete(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response) {
		
		DynaActionForm createContactForm = (DynaActionForm) form;
        if (log.isDebugEnabled()) {
            log.debug("entering deleteContact method...");
        }
        
        /*Login login = (Login) loginForm.get("login");*/
        Long id = new Long(request.getParameter("id"));
        contactManager.removeContact(id);
        // Extract attributes we will need
        //HttpSession session = request.getSession();
        request.getSession().setAttribute("msgInfo","Contato removido com sucesso!");
		
		return mapping.findForward("deleteContactSuccess");        
	}	

	/** 
	 * Method list
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward list(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response) {
	
      List companies = null;
      List categories = null;
		List relations = null;		
		String letter = request.getParameter("letter");
		String cleanParams = request.getParameter("cleanParams");

		log.debug("letter:"+letter);
		
		DynaActionForm contactSearchForm = (DynaActionForm) form;
        if (log.isDebugEnabled()) {
            log.debug("entering listContact method...");
        }
        
        ContactSearch cs = new ContactSearch();
        if (letter==null && cleanParams==null) {
        		cs = (ContactSearch) contactSearchForm.get("contactSearch");
        }
        log.debug("Search terms:"+cs);
		
        companies = companyManager.getCompanies();
        categories = categoryManager.getCategories();
        relations = relationManager.getRelations();
        		
		  contactSearchForm.set("contactSearch",cs);
		
		  long time = System.currentTimeMillis();
        List contacts = null;
        if(letter == null )
        		contacts =contactManager.getContacts(cs);
        else
        		contacts =contactManager.getContactsByInitial(letter);
        log.debug("tempo para obter contatos:"+(System.currentTimeMillis()-time)+" ms");

        request.setAttribute("contacts", contacts);        
        request.setAttribute("companies",companies);
        request.setAttribute("categories",categories);
        request.setAttribute("relations",relations);
		
		return mapping.findForward("listContacts");        
	}		

}