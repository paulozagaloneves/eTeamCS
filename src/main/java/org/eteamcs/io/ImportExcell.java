package org.eteamcs.io;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.eteamcs.model.Category;
import org.eteamcs.model.Companie;
import org.eteamcs.model.CompanySearch;
import org.eteamcs.model.Contact;
import org.eteamcs.service.ICategoryManager;
import org.eteamcs.service.ICompanieManager;
import org.eteamcs.service.IContactManager;
import org.eteamcs.service.ICountryManager;
import org.eteamcs.service.IRelationManager;

public class ImportExcell {
   
    private IContactManager contactManager = null;
    private ICompanieManager companyManager = null;
    private IRelationManager relationManager = null;
    private ICategoryManager categoryManager = null;
    private ICountryManager countryManager = null;
    
    private final Log log = LogFactory.getLog(ImportExcell.class);
    
	private static final String ETEAM_USER="migracao";
	
	private int newCompanies = 0;
	private int newContacts  = 0;
	
	
	private List categories = new ArrayList();
	
	List companies = new ArrayList();
	int  lastCompanyId = 0;
	
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

	
	
	private Map headerTable(HSSFRow row) {
		HashMap result = new HashMap();
		
		// once get a row its time to iterate through cells.
		Iterator<HSSFCell> cells = row.cellIterator();

		while (cells.hasNext()) {
			HSSFCell cell = cells.next();
			
			HSSFRichTextString field_name = cell.getRichStringCellValue();
			
			result.put(field_name.getString().toUpperCase().trim(), Integer.valueOf(cell.getCellNum()));
			
		}
		
		System.err.println(result);
		return result;
	}
	
	private short retrieveColumnNumber(Map headerTable, String columnName) {
		Integer iPos = (Integer) headerTable.get(columnName);
		
		if (iPos == null) 
				System.err.println("Coluna ["+columnName+"] inválida!");
		return iPos.shortValue();
	}
	
	private String retriveCellData(HSSFRow row, Map headerTable, String columnName) {
		HSSFCell cell = row.getCell(retrieveColumnNumber(headerTable,columnName));
		
		if (cell == null) {
			return "";
		}
		
		String result="";
		switch (cell.getCellType()) {
			case HSSFCell.CELL_TYPE_NUMERIC: {
				result = Integer.toString((int)cell.getNumericCellValue());
				break;
			} 
			case HSSFCell.CELL_TYPE_STRING: {

				result = cell.getStringCellValue();
				break;
			}
			
			case HSSFCell.CELL_TYPE_BLANK: {
				result = "";
				break;
			}

			default: {
				System.out.println("Type not supported.");
				

				break;
			}
		}
		
		
		return result.trim().replaceAll("\n", "");	
	}
	
	
	private Companie retrieveCompany(HSSFRow row, Map headerTable, List categories) {
		String companyName = retriveCellData(row, headerTable, "EMPRESA");
		
		if (companyName.startsWith("Editora")) {
			System.out.println("###################################");
		}
		
		CompanySearch cs = new CompanySearch();
		cs.setSearchTerm(companyName);
		
		Companie companie = companyManager.getCompanyByName(companyName);
		
		if (companie == null) {
			newCompanies++;
			companie = new Companie();
			
			companie.setName(retriveCellData(row, headerTable, "EMPRESA"));
			companie.setStreetAddress(retriveCellData(row, headerTable, "ENDEREÇO"));
			companie.setPostalCode(retriveCellData(row, headerTable, "CEP"));
			companie.setCity(retriveCellData(row, headerTable, "CIDADE"));
			companie.setState(retriveCellData(row, headerTable, "ESTADO"));
			companie.setCountry("BR");
			companie.setPhone(processFoneNumber(row, headerTable, "TEL COMERCIAL"));
			//companie.setCategory(category);
			
			companie.setUsername(ETEAM_USER);
			companie = companyManager.saveCompanie(companie);
		}
		
		 

		return companie;
	}
	
		
	private Integer retrieveCategory(String categoryName) {
		
		if (categoryName.equals("")) {
			return null;
		}
		
		Category category = categoryManager.getCategoryByName(categoryName,null);
		
		if (category == null) {
			category = new Category();
			category.setName(categoryName);
			category.setUsername(ETEAM_USER);
			category = categoryManager.saveCategory(category);
		}
		
		return Integer.valueOf(category.getCategoryId().intValue());
	}
	
	private Integer retrieveSubCategory(String categoryName, Integer parentId) {
		
		if (categoryName.equals("") || parentId==null ) {
			return null;
		}
		
		Category category = categoryManager.getCategoryByName(categoryName,parentId);
		
		if (category == null) {
			category = new Category();
			category.setName(categoryName);
			category.setParentId(Long.valueOf(parentId.longValue()));
			category.setUsername(ETEAM_USER);
			category = categoryManager.saveCategory(category);
		}
		
		return Integer.valueOf(category.getCategoryId().intValue());
	}
	
	private String processFoneNumber(HSSFRow row, Map headerTable, String foneColumnNumber) {
		String fnumber = retriveCellData(row, headerTable, foneColumnNumber);
		
		return fnumber.trim().equals("") ? "" : (retriveCellData(row, headerTable, "DDI")+" "+fnumber);
	}
	
	
	private Category createCategory(Integer categoryId) {
		Category category = new Category();
	    category.setCategoryId(new Long(categoryId));
	    
	    return category;
	}
	
	private List retrieveCategories(HSSFRow row, Map headerTable) {
		ArrayList categories = new ArrayList();
		Integer categoryId = retrieveCategory(retriveCellData(row, headerTable, "GRUPO 1"));
		Integer subCategoryId = retrieveSubCategory(retriveCellData(row, headerTable, "SUBGRUPO 1"),categoryId);
		
		if (categoryId!=null) {
			categories.add(createCategory(categoryId));
		}
		if (subCategoryId!=null) {
			categories.add(createCategory(subCategoryId));
		}
		categoryId = retrieveCategory(retriveCellData(row, headerTable, "GRUPO 2"));
		subCategoryId = retrieveSubCategory(retriveCellData(row, headerTable, "SUBGRUPO 2"),categoryId);
		if (categoryId!=null)
			categories.add(createCategory(categoryId));
		if (subCategoryId!=null)
			categories.add(createCategory(subCategoryId));
		
		return categories;
	}
	
	private Contact processRow(HSSFRow row, Map headerTable) {
		Contact contact = null;
		String name = retriveCellData(row, headerTable, "NOME");
		List categories = retrieveCategories(row, headerTable);
		Companie companie = retrieveCompany(row, headerTable, categories);
		if (!name.equals("")) {
			contact = new Contact();
			contact.setName(retriveCellData(row, headerTable, "NOME"));
			contact.setSex(retriveCellData(row, headerTable, "SEXO"));
			contact.setStreetAddress(retriveCellData(row, headerTable, "ENDEREÇO"));
			contact.setPostalCode(retriveCellData(row, headerTable, "CEP"));
			contact.setCity(retriveCellData(row, headerTable, "CIDADE"));
			contact.setState(retriveCellData(row, headerTable, "ESTADO"));
			contact.setCountry("BR");
			contact.setPhone(processFoneNumber(row, headerTable, "TEL RESIDENCIAL"));
			contact.setCellular(processFoneNumber(row, headerTable, "CELULAR"));
			contact.setEmail(retriveCellData(row, headerTable, "E-MAIL 1"));
			contact.setEmail2(retriveCellData(row, headerTable, "E-MAIL 2"));
			contact.setUrl(retriveCellData(row, headerTable, "SITE"));
			contact.setDepartment(retriveCellData(row, headerTable, "ÁREA"));
			contact.setFunction(retriveCellData(row, headerTable, "CARGO"));
			contact.setPhoneWork(processFoneNumber(row, headerTable, "TEL COMERCIAL"));
			contact.setFax(processFoneNumber(row, headerTable, "FAX"));
			contact.setComments(retriveCellData(row, headerTable, "OBSERVAÇÃO"));
			contact.setIndication(retriveCellData(row, headerTable, "INDICACAO"));
			contact.setCompany(companie);
			//contact.setCategory(categoryId);
			contact.setCategories(categories);
			contact.setUsername(ETEAM_USER);
		}		
		return contact;
	}	
	
	/**
	 * This method is used to display the Excel content to command line.
	 * 
	 * @param xlsPath
	 */
	@SuppressWarnings("unchecked")
	public void displayFromExcel(InputStream inputStream) {		

		POIFSFileSystem fileSystem = null;

		try {
			fileSystem = new POIFSFileSystem(inputStream);

			Map headerTable = null;
			HSSFWorkbook workBook = new HSSFWorkbook(fileSystem);
			HSSFSheet sheet = workBook.getSheetAt(0);
			System.out.println("LastRowNum:"+sheet.getLastRowNum());
			
			Iterator<HSSFRow> rows = sheet.rowIterator();

			while (rows.hasNext()) {
				HSSFRow row = rows.next();

				// display row number in the console.
				System.out.println("Row No.: " + row.getRowNum());

				Contact contact = null;
				if (row.getRowNum()==0) {
					headerTable= headerTable(row);
				} else {
					 contact = processRow(row, headerTable);
					 if (contact!=null)
						 contactManager.saveContact(contact);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
}
