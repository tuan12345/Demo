
package controller;

import entity.Catalog;
import entity.ImageLink;
import entity.Product;
import java.io.File;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import model.CatalogModel;
import model.ImageLinkModel;
import model.ProductModel;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ProductController {
    private CatalogModel catalogModel;
    private ProductModel productModel;
    private ImageLinkModel iml;

    public ProductController() {
        productModel = new ProductModel();
        catalogModel = new CatalogModel();
        iml = new  ImageLinkModel();
    }
    
    @RequestMapping(value = "/backend/getAllProduct", method = RequestMethod.GET)
    public ModelAndView getAllProduct(){
        ModelAndView model = new ModelAndView("backend/product_GetAll");
        List<Product> listPro = productModel.getAllProduct();
        model.addObject("products", listPro);
        return model;
    }
    
    @RequestMapping(value = "/backend/initInsertProduct", method = RequestMethod.GET)
    public ModelAndView initInsertProduct(){
        ModelAndView model = new ModelAndView("backend/product_Insert");
        Product pro = new Product();
        List<Catalog> listCt = catalogModel.getAllCatalog();
        model.addObject("catalogs", listCt);
        model.getModelMap().put("newProduct",pro);
        return model;
    }
    
    @RequestMapping(value = "/backend/insertProduct", method = RequestMethod.POST)
    public String insertProduct(@ModelAttribute("newProduct") Product pro,HttpServletRequest request){
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
                    pro.setImage(fileItem.getName());
                    //upload to folder
                    fileItem.write(new File(path + "/" + fileItem.getName()));
                }else{
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    if (name.equals("productID")) {
                        pro.setProductID(value);
                    } else if(name.equals("productName")) {
                        pro.setProductName(value);
                    } else if(name.equals("contentDetail")){
                        pro.setContentDetail(value);
                    } else if (name.equals("priceImport")){
                        pro.setPriceImport(Float.parseFloat(value));
                    }else if (name.equals("priceExport")){
                        pro.setPriceExport(Float.parseFloat(value));
                    }else if(name.equals("discount")){
                        pro.setDiscount(Integer.parseInt(value));
                    } else if (name.equals("fromDate")){
                        pro.setFromDate(java.sql.Date.valueOf(value));
                    } else if (name.equals("toDate")){
                        pro.setToDate(java.sql.Date.valueOf(value));
                    }else if(name.equals("quantity")){
                        pro.setQuantity(Integer.parseInt(value));
                    } else if (name.equals("status")){
                        pro.setStatus(Boolean.parseBoolean(value));
                    }else if (name.equals("catalogID")){
                        pro.setCatalogID(Integer.parseInt(value));
                    } else if (name.equals("numberView")){
                        pro.setNumberView(Integer.parseInt(value));
                    }else if(name.equals("numberOfSeat")){
                        pro.setNumberOfSeat(Integer.parseInt(value));
                    } else if (name.equals("yearOfManufacture")){
                        pro.setYearOfManufacture(Integer.parseInt(value));
                    }else if (name.equals("petrolTankCapacity")){
                        pro.setPetrolTankCapacity(Float.parseFloat(value));
                    }else if (name.equals("timeSpeed100")){
                        pro.setTimeSpeed100(Float.parseFloat(value));
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        boolean check = productModel.insertProduct(pro);
        if(check)
            return "redirect:getAllProduct.htm";
        else
            return "newProduct";
    }
    
    @RequestMapping(value = "/backend/initUpdateProduct", method = RequestMethod.GET)
    public ModelAndView initUpdateProduct(@RequestParam("productID") String productID ){
        ModelAndView model = new ModelAndView("backend/product_Update");
        Product pro = productModel.getProductByID(productID);
        List<Catalog> listCt = catalogModel.getAllCatalog();
        model.addObject("catalogs", listCt);
        model.getModelMap().put("updateProduct",pro);
        return model;
    }
    
    @RequestMapping(value = "/backend/updateProduct", method = RequestMethod.GET)
    public String updateProduct(@ModelAttribute("updateProduct") Product pro,HttpServletRequest request){
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
                    pro.setImage(fileItem.getName());
                    //upload to folder
                    fileItem.write(new File(path + "/" + fileItem.getName()));
                }else{
                    String name = fileItem.getFieldName();
                    String value = fileItem.getString();
                    if (name.equals("productID")) {
                        pro.setProductID(value);
                    } else if(name.equals("productName")) {
                        pro.setProductName(value);
                    } else if(name.equals("contentDetail")){
                        pro.setContentDetail(value);
                    } else if (name.equals("priceImport")){
                        pro.setPriceImport(Float.parseFloat(value));
                    }else if (name.equals("priceExport")){
                        pro.setPriceExport(Float.parseFloat(value));
                    }else if(name.equals("discount")){
                        pro.setDiscount(Integer.parseInt(value));
                    } else if (name.equals("fromDate")){
                        pro.setFromDate(java.sql.Date.valueOf(value));
                    } else if (name.equals("toDate")){
                        pro.setToDate(java.sql.Date.valueOf(value));
                    }else if(name.equals("quantity")){
                        pro.setQuantity(Integer.parseInt(value));
                    } else if (name.equals("status")){
                        pro.setStatus(Boolean.parseBoolean(value));
                    }else if (name.equals("catalogID")){
                        pro.setCatalogID(Integer.parseInt(value));
                    } else if (name.equals("numberView")){
                        pro.setNumberView(Integer.parseInt(value));
                    }else if(name.equals("numberOfSeat")){
                        pro.setNumberOfSeat(Integer.parseInt(value));
                    } else if (name.equals("yearOfManufacture")){
                        pro.setYearOfManufacture(Integer.parseInt(value));
                    }else if (name.equals("petrolTankCapacity")){
                        pro.setPetrolTankCapacity(Float.parseFloat(value));
                    }else if (name.equals("timeSpeed100")){
                        pro.setTimeSpeed100(Float.parseFloat(value));
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        boolean check = productModel.updateProduct(pro);
        if(check)
            return "redirect:getAllProduct.htm";
        else
            return "updateProduct";
    }

    @RequestMapping(value = "/backend/deleteProduct", method = RequestMethod.GET)
    public String deleteProduct(@RequestParam("productID") String productID){
        boolean check = productModel.deleteProduct(productID);
        if(check)
            return "redirect:getAllProduct.htm";
        else
            return "error";
    }
    
    @RequestMapping(value="/FrontEnd/getAllProduct")
    public ModelAndView GetAllProduct(){
        ModelAndView model = new ModelAndView("/FrontEnd/product");
        List<Product> listAllProduct = productModel.getAllProduct();
        model.addObject("listAllProduct", listAllProduct);
        return model;
        
    }
    
    @RequestMapping(value = "/FrontEnd/productdetails", method = RequestMethod.GET)
    public ModelAndView DetailProduct(@RequestParam("IdProduct") String IdProduct){
        ModelAndView model = new ModelAndView("/FrontEnd/productdetails");
        Product product = productModel.getProductByID(IdProduct);
        ImageLink imagelink = iml.getImageByID(IdProduct);
        productModel.updateView(IdProduct);
        model.addObject("product", product);
        model.addObject("iml", imagelink);
        return model;
    }
    
    @RequestMapping(value = "/FrontEnd/Home")
    public ModelAndView getViewProduct(){
        ModelAndView model = new ModelAndView("/FrontEnd/Home");
        List<Product> listViewProduct = productModel.TopViewProduct();
        model.addObject("listViewProduct", listViewProduct);
        List<Product> listNewProduct = productModel.TopNewProduct();
        model.addObject("listNewProduct", listNewProduct);
        return model;
    }
    
    @RequestMapping(value = "/FrontEnd/InitSearch", method = RequestMethod.GET)
     public ModelAndView search(){
         ModelAndView model = new ModelAndView("/FrontEnd/search");
         Product product = new Product();
         model.addObject("pro", product);
         return model; 
     }
     
     @RequestMapping(value = "/FrontEnd/byName")
    public ModelAndView DetailProduct(@ModelAttribute("pro") Product product){
        ModelAndView model = new ModelAndView("/FrontEnd/search");
        List<Product> listProductSearch = new ArrayList<>();
        listProductSearch = productModel.searchProduct(product.getProductName());
        model.addObject("listProductSearch", listProductSearch);
        return model;
    }
     
}
