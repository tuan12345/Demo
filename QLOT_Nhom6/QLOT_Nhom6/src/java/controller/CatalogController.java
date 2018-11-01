/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Catalog;
import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.CatalogModel;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author neo
 */
@Controller
@RequestMapping(value = "/backend") //@@
public class CatalogController {

    private CatalogModel catalogModel;

    public CatalogController() {
        catalogModel = new CatalogModel();
    }

    @RequestMapping(value = "/getAllCatalog", method = RequestMethod.GET)
    public ModelAndView getAllCatalog() {
        ModelAndView model = new ModelAndView("backend/catalog_GetAll");
        List<Catalog> listCatalog = catalogModel.getAllCatalog();
        model.addObject("catalogs", listCatalog);
        return model;
    }
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public ModelAndView getAllCatalogByParentID(@RequestParam("parentID") int parentID) {
        ModelAndView model = new ModelAndView("searchCatalog");
        List<Catalog> listCatalog = catalogModel.getCatalogByParentID(parentID);
        model.addObject("catalogs", listCatalog);
        return model;
    }

    @RequestMapping(value = "/initInsertCatalog", method = RequestMethod.GET)
    public ModelAndView initInsertCatalog() {
        ModelAndView model = new ModelAndView("backend/catalog_Insert");
        Catalog newCatalog = new Catalog();
        model.getModelMap().put("newCatalog", newCatalog);
        return model;
    }

    @RequestMapping(value = "/insertCatalog", method = RequestMethod.POST)
    public String insertCatalog(@ModelAttribute("newCatalog") Catalog catalog,HttpServletRequest request) {
        String path = request.getRealPath("/images");
        path = path.substring(0, path.indexOf("\\build"));
        path = path + "\\web\\images";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload uploader = new ServletFileUpload(factory);
        try {
            List<FileItem> lst = uploader.parseRequest(request);
            for (FileItem fileItem : lst) {
                if (fileItem.isFormField() == false) {
                    //path
                    catalog.setImageLogo( fileItem.getName());
                    //upload to folder
                    fileItem.write(new File(path + "/" + fileItem.getName()));
                }else{
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    if (name.equals("catalogID")) {
                        catalog.setCatalogID(Integer.parseInt(value));
                    } else if(name.equals("catalogName")) {
                        catalog.setCatalogName(value);
                    } else if(name.equals("description")){
                        catalog.setDescription(value);
                    } else if (name.equals("status")){
                        catalog.setStatus(Boolean.parseBoolean(value));
                    } else if (name.equals("parentID")){
                        catalog.setParentID(Integer.parseInt(value));
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        boolean check = catalogModel.insertCatalog(catalog);
        if (check) {
            return "redirect:getAllCatalog.htm";
        } else {
            return "newCatalog";
        }
    }

    @RequestMapping(value = "/initUpdateCatalog", method = RequestMethod.GET)
    public ModelAndView initUpdateCatalog(@RequestParam("catalogID") int catalogID) {
        ModelAndView model = new ModelAndView("backend/catalog_Update");
        Catalog updateCatalog = catalogModel.getCatalogByID(catalogID);
        model.addObject("updateCatalog", updateCatalog);
        return model;
    }

    @RequestMapping(value = "/updateCatalog", method = RequestMethod.POST)
    public String updateCatalog(@ModelAttribute("updateCatalog") Catalog catalog,HttpServletRequest request) {
        String path = request.getRealPath("/images");
        path = path.substring(0, path.indexOf("\\build"));
        path = path + "\\web\\images";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload uploader = new ServletFileUpload(factory);
        try {
            List<FileItem> lst = uploader.parseRequest(request);
            for (FileItem fileItem : lst) {
                if (fileItem.isFormField() == false) {
                    //path
                    catalog.setImageLogo( fileItem.getName());
                    //upload to folder
                    fileItem.write(new File(path + "/" + fileItem.getName()));
                }else{
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    if (name.equals("catalogID")) {
                        catalog.setCatalogID(Integer.parseInt(value));
                    } else if(name.equals("catalogName")) {
                        catalog.setCatalogName(value);
                    } else if(name.equals("description")){
                        catalog.setDescription(value);
                    } else if (name.equals("status")){
                        catalog.setStatus(Boolean.parseBoolean(value));
                    } else if (name.equals("parentID")){
                        catalog.setParentID(Integer.parseInt(value));
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        boolean check = catalogModel.updateCatalog(catalog);
        if (check) {
            return "redirect:getAllCatalog.htm";
        } else {
            return "updateCatalog";
        }
    }

    @RequestMapping(value = "/deleteCatalog", method = RequestMethod.GET)
    public String deleteCatalog(@RequestParam("catalogID") int catalogID) {
        boolean check = catalogModel.deleteCatalog(catalogID);
        if (check) {
            return "redirect:getAllCatalog.htm";
        } else {
            return "redirect:getAllCatalog.htm";
        }
    }
}
