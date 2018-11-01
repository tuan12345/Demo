/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.ImageLink;
import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.ImageLinkModel;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author neo
 */
@Controller
@RequestMapping(value = "/backend")
public class ImageLinkController {

    private ImageLinkModel imageLinkModel;

    public ImageLinkController() {
        imageLinkModel = new ImageLinkModel();
    }

    @RequestMapping(value = "/getAllImageLink", method = RequestMethod.GET)
    public ModelAndView getAllUser() {
        ModelAndView model = new ModelAndView("backend/imagelink_GetAll");
        List<ImageLink> listIl = imageLinkModel.getAllImageLink();
        model.addObject("imagelinks", listIl);
        return model;
    }

    @RequestMapping(value = "/initInsertImageLink", method = RequestMethod.GET)
    public ModelAndView initInsertImageLink() {
        ModelAndView model = new ModelAndView("backend/imagelink_Insert");
        ImageLink newImageLink = new ImageLink();
        model.getModelMap().put("newImageLink", newImageLink);
        return model;
    }

    @RequestMapping(value = "/insertImageLink", method = RequestMethod.POST)
    public String insertImageLink(@ModelAttribute("newImageLink") ImageLink imageLink, HttpServletRequest request) {

        String path = request.getRealPath("/images");
        path = path.substring(0, path.indexOf("\\build"));
        path = path + "\\web\\images";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload uploader = new ServletFileUpload(factory);
        try {
            List<FileItem> lst = uploader.parseRequest(request);
            for (FileItem fileItem : lst) {
                if (fileItem.isFormField() == false && fileItem.getName() != "") {
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    if (name.equals("url_before")) {
                        //path
                        imageLink.setUrl_before(fileItem.getName());
                        //upload to folder
                        fileItem.write(new File(path + "/" + fileItem.getName()));
                    } else if (name.equals("url_behind")) {
                        imageLink.setUrl_behind(fileItem.getName());
                        //upload to folder
                        fileItem.write(new File(path + "/" + fileItem.getName()));
                    } else if (name.equals("url_left")) {
                        imageLink.setUrl_left(fileItem.getName());
                        //upload to folder
                        fileItem.write(new File(path + "/" + fileItem.getName()));
                    } else if (name.equals("url_right")) {
                        imageLink.setUrl_right(fileItem.getName());
                        //upload to folder
                        fileItem.write(new File(path + "/" + fileItem.getName()));
                    }
                } else {
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    if (name.equals("imageLinkID")) {
                        imageLink.setImageLinkID(Integer.parseInt(value));
                    } else if (name.equals("productID")) {
                        imageLink.setProductID(value);
                    } else if (name.equals("status")) {
                        imageLink.setStatus(Boolean.parseBoolean(value));
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        boolean check = imageLinkModel.insertImageLink(imageLink);
        if (check) {
            return "redirect:getAllImageLink.htm";
        } else {
            return "newImageLink";
        }
    }
    
    @RequestMapping(value = "/initUpdateImageLink", method = RequestMethod.GET)
    public ModelAndView initUpdateImageLink(@RequestParam("imageLinkID") int imageLinkID) {
        ModelAndView model = new ModelAndView("backend/imagelink_Update");
        ImageLink updateImageLink = imageLinkModel.getImageLinkByID(imageLinkID);
        model.addObject("updateImageLink", updateImageLink);
        return model;
    }

    @RequestMapping(value = "/updateImageLink", method = RequestMethod.POST)
    public String updateImageLink(@ModelAttribute("updateImageLink") ImageLink imageLink, HttpServletRequest request) {

        String path = request.getRealPath("/images");
        path = path.substring(0, path.indexOf("\\build"));
        path = path + "\\web\\images";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload uploader = new ServletFileUpload(factory);
        try {
            List<FileItem> lst = uploader.parseRequest(request);
            for (FileItem fileItem : lst) {
                if (fileItem.isFormField() == false && fileItem.getName() != "") {
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    if (name.equals("url_before")) {
                        //path
                        imageLink.setUrl_before(fileItem.getName());
                        //upload to folder
                        fileItem.write(new File(path + "/" + fileItem.getName()));
                    } else if (name.equals("url_behind")) {
                        imageLink.setUrl_behind(fileItem.getName());
                        //upload to folder
                        fileItem.write(new File(path + "/" + fileItem.getName()));
                    } else if (name.equals("url_left")) {
                        imageLink.setUrl_left(fileItem.getName());
                        //upload to folder
                        fileItem.write(new File(path + "/" + fileItem.getName()));
                    } else if (name.equals("url_right")) {
                        imageLink.setUrl_right(fileItem.getName());
                        //upload to folder
                        fileItem.write(new File(path + "/" + fileItem.getName()));
                    }
                } else {
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    if (name.equals("imageLinkID")) {
                        imageLink.setImageLinkID(Integer.parseInt(value));
                    } else if (name.equals("productID")) {
                        imageLink.setProductID(value);
                    } else if (name.equals("status")) {
                        imageLink.setStatus(Boolean.parseBoolean(value));
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        boolean check = imageLinkModel.updateImageLink(imageLink);
        if (check) {
            return "redirect:getAllImageLink.htm";
        } else {
            return "updateImageLink";
        }
    }
    
    @RequestMapping(value = "/deleteImageLink")
    public String deleteCatalog(@RequestParam("imageLinkID") int imageLinkID) {
        boolean check = imageLinkModel.deleteImageLink(imageLinkID);
        if (check) {
            return "redirect:getAllImageLink.htm";
        } else {
            return "error";
        }
    }
    
}
