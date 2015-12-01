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
import org.eteamcs.model.Companie;
import org.eteamcs.model.CompanySearch;
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
public class CompanyAction extends MappingDispatchAction {
	private final Log log = LogFactory.getLog(CompanyAction.class);
    private ICompanieManager companyManager = null;
    private ICountryManager countryManager = null;
    private IRelationManager relationManager = null;
    private ICategoryManager categoryManager = null;
    private IContactManager contactManager = null;
    

    public void setCompanyManager(ICompanieManager companyManager) {
        if( this.companyManager == null ) {
        	log.debug("set this.companyManager = companyManager");
        	this.companyManager = companyManager;
        }
    } 
   
    public void setCountryManager(ICountryManager countryManager) {
        if( this.countryManager == null ) {
        	log.debug("set this.countryManager = countryManager");
        	this.countryManager = countryManager;
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

    public void setContactManager(IContactManager contactManager) {
      if( this.contactManager == null ) {
      	log.debug("set this.contactManager = contactManager");
      	this.contactManager = contactManager;
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
            log.debug("entering create company method...");
        }
        
        countries = countryManager.getCountries();
        categories = categoryManager.getCategories();
        relations = relationManager.getRelations();      
        
        
        //      create our empty form bean
       
        ActionForm saveCompanyForm = FormUtils.getInstance()
        			.createActionForm("saveCompanyForm", this, mapping, request);
        
        //log.debug("Countries:"+countries);        
        
        // pass our form to the JSP
        //request.getSession().setAttribute("relations",aRel);
        request.getSession().setAttribute("saveCompanyForm",saveCompanyForm);
        request.setAttribute("categories",categories);
        request.setAttribute("relations",relations);        
        request.setAttribute("countries",countries);
		
		return mapping.findForward("addCompany");        
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
            log.debug("entering edit company method...");
        }
        Companie companie = null;
        List countries = null;
        List categories = null;
  		  List relations = null;  
  		  List contactsByCompany = null;
		
        Long id = new Long(request.getParameter("id"));
        String readonly = request.getParameter("readonly");
        
        companie = companyManager.getCompanie(id);
        countries = countryManager.getCountries();
        categories = categoryManager.getCategories();
        relations = relationManager.getRelations();  
        contactsByCompany = contactManager.getContactsByCompanyId(id);
        
        ActionForm saveCompanyForm = 
            FormUtils.setFormValues("saveCompanyForm", companie,
                    this, mapping, request);
        
        request.getSession().setAttribute("saveCompanyForm",saveCompanyForm);

        // Efetuar copia da lista de relacoes
        List relationsCopy=new ArrayList();
        for(Iterator iter=relations.iterator(); iter.hasNext();) {
        	Relation rel = (Relation)iter.next();
        	relationsCopy.add(new Relation(rel));
        }       
        
        // Extract attributes we will need
        for(Iterator iter=relationsCopy.iterator(); iter.hasNext();) {
        	Relation rel = (Relation)iter.next();
        	
        	if(companie.getRelations().contains(rel))
        		rel.setChecked("checked");

        }        
        
        request.setAttribute("readonly",readonly);
        request.setAttribute("countries",countries);
        request.setAttribute("categories",categories);
        request.setAttribute("relations",relationsCopy);
        request.setAttribute("contactsByCompany",contactsByCompany);
		
		return mapping.findForward("editCompany");        
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
		
		DynaActionForm saveCompanyForm = (DynaActionForm) form;
        if (log.isDebugEnabled()) {
            log.debug("entering saveCompany method...");
        }
        
        Companie companie = null;
        if (form != null) {
            if (log.isDebugEnabled()) {
                log.debug("received form=" + form);
                if (form instanceof ActionForm) log.debug("ActionForm");
                if (form instanceof DynaActionForm) log.debug("DynaActionForm");
                if (form instanceof DynaValidatorForm) log.debug("DynaValidatorForm");
                if (form instanceof DynaValidatorActionForm) log.debug("DynaValidatorActionForm");
            }
            companie = (Companie) FormUtils.getFormValues(saveCompanyForm,this,mapping,request);
                                   
            companie.setUsername("igod");
            log.info("received sampler=" + companie);
        }

        String[] relations = request.getParameterValues("relations");
        
        
        // Set Relations to Contact Bean
        ArrayList lRelations=new ArrayList();
        for(int i=0; relations!=null && i<relations.length; i++) {
        	Relation rel=new Relation();
        	rel.setRelationId(new Long(relations[i]));
        	lRelations.add(rel);
        }
        companie.setRelations(lRelations);
        
        log.debug("Relations List:"+companie.getRelations());   
        log.info("sampler=" + companie);        
        
        companyManager.saveCompanie(companie);

        request.getSession().removeAttribute("saveCompanyForm");              
        request.getSession().setAttribute("msgInfo","Dados de Empresa salvos com sucesso!");
        	
		return mapping.findForward("saveCompanySuccess");        
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
		
        if (log.isDebugEnabled()) {
            log.debug("entering confirmDelete company method...");
        }
        
        Companie companie = null;
        List countries = null;
        List categories = null;
  		  List relations = null;
  		  List contactsByCompany = null;
		
        Long id = new Long(request.getParameter("id"));
        String readonly = request.getParameter("readonly");
        
        companie = companyManager.getCompanie(id);        
        countries = countryManager.getCountries();        
        categories = categoryManager.getCategories();        
        relations = relationManager.getRelations();
        contactsByCompany = contactManager.getContactsByCompanyId(id);       
        
        ActionForm saveCompanyForm = 
            FormUtils.setFormValues("saveCompanyForm", companie,
                    this, mapping, request);
        
        request.getSession().setAttribute("saveCompanyForm",saveCompanyForm);

        // Efetuar copia da lista de relacoes
        List relationsCopy=new ArrayList();
        for(Iterator iter=relations.iterator(); iter.hasNext();) {
        	Relation rel = (Relation)iter.next();
        	relationsCopy.add(new Relation(rel));
        }        
        
        // Extract attributes we will need
        for(Iterator iter=relationsCopy.iterator(); iter.hasNext();) {
        	Relation rel = (Relation)iter.next();
        	
        	if(companie.getRelations().contains(rel))
        		rel.setChecked("checked");

        }        
        
        request.setAttribute("readonly",readonly);
        request.setAttribute("countries",countries);
        request.setAttribute("categories",categories);
        request.setAttribute("relations",relationsCopy);
        request.setAttribute("contactsByCompany",contactsByCompany);
		
		return mapping.findForward("confirmDeleteCompany");        
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
		
		DynaActionForm createCompanyForm = (DynaActionForm) form;
        if (log.isDebugEnabled()) {
            log.debug("entering deleteCompany method...");
        }
        
        /*Login login = (Login) loginForm.get("login");*/
        Long id = new Long(request.getParameter("id"));
        companyManager.removeCompanie(id);
        // Extract attributes we will need
        //HttpSession session = request.getSession();
        request.getSession().setAttribute("msgInfo","Dados de Empresa removidos com sucesso!");
		
		return mapping.findForward("deleteCompanySuccess");        
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
		
      List categories = null;
		List relations = null;
		String letter = request.getParameter("letter");
		String cleanParams = request.getParameter("cleanParams");
		
		log.debug("letter:"+letter);
		
		DynaActionForm companySearchForm = (DynaActionForm) form;
      if (log.isDebugEnabled()) {
         log.debug("entering listCompanie method...");
     }		
      CompanySearch cs = new CompanySearch();
      if (letter==null && cleanParams==null) {
      		cs = (CompanySearch) companySearchForm.get("companySearch");
      }
      log.debug("Search terms:"+cs);
      
      categories = categoryManager.getCategories();
      relations = relationManager.getRelations();      
        
		companySearchForm.set("companySearch",cs);
		
      List companies = null;
      if(letter == null )
      	companies =companyManager.getCompanies(cs);
      else
      	companies =companyManager.getCompaniesByInitial(letter);
      

        request.setAttribute("companies", companies);
        request.setAttribute("categories",categories);
        request.setAttribute("relations",relations);        
        
		
		return mapping.findForward("listCompanies");        
	}		

}