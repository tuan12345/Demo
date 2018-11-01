
package controller;

import entity.Cart;
import entity.Product;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.ProductModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import util.ConnectionDB;

@Controller
public class CartController {
    private ProductModel productModel;

    public CartController() {
        productModel = new ProductModel();
    }
    
    /*
    - Thuc hien them san pham vao danh sach san pham cua khach hang
    - Danh sach san pham duoc luu trong session cua khach hang
    - Co kiem tra xem san pham khach hang chon co trong danh sach chua?
    - Thuc hien goi trang cart.jsp
    - @ModelAttribute: Thong tin Cart duoc chon tren form.jsp
    - HttpSession: session cua User
    */    
    @RequestMapping(value = "/FrontEnd/addCart",method = RequestMethod.GET)
    public ModelAndView addCart(@RequestParam("productID") String productID, HttpSession session){
        //Khoi tao ModelAndView dieu huong sang trang cart.jsp
        ModelAndView model = new ModelAndView("/FrontEnd/Cart");
        //Lay du lieu cho cart khach hang vua chon
        Product pro = productModel.getProductByID(productID);
        Cart cart = new Cart(pro, 1);
        //Lay danh sach san pham cua User co trong session
        List<Cart> listCart = (List<Cart>)session.getAttribute("listCart");        
        if (listCart==null) {
            //Truong hop danh sach chua co Cart nao thuc hien add luon Cart duoc chon
            listCart = new ArrayList<>();
            listCart.add(cart);
            
        } else{
            //Truong hop danh sach mua da co du lieu
            //Dat co danh dau xem san pham mua da co trong danh sach san pham chua
            boolean flag = false;
            for (Cart c : listCart) {
                
                //Kiem tra neu san pham da co trong gio hang thi cong so luong muon mua len
                if (c.getProduct().getProductID().equals(cart.getProduct().getProductID())) {
                    int a = c.getQuantity();
                    c.setQuantity(c.getQuantity()+cart.getQuantity());
                    flag = true;
                    break;                            
                }
            }
            //Neu san pham chua co trong danh sach san pham thi them vao danh sach
            if (!flag) {
                listCart.add(cart);
            }            
        }
        //Luu danh sach san pham va tong tien cua khach hang vao session
        session.setAttribute("listCart", listCart);
        session.setAttribute("total", (long)getTotal(listCart));
        return model;
    }
    
    //Phuong thuc tinh tong tien cua gio hang
    public double getTotal(List<Cart> listCart){
        double total = 0;
        for (Cart cart : listCart) {
            total+=cart.getQuantity()*cart.getProduct().getPriceExport();
        }
        return total;
    }
    /*
    - Thuc hien xoa san pham vao danh sach san pham cua khach hang
    - Danh sach san pham duoc luu lai trong session cua khach hang
    - Thuc hien goi trang cart.jsp
    */
    @RequestMapping(value = "/FrontEnd/remove",method = RequestMethod.GET)
    public ModelAndView remove(@RequestParam("productID") String productID,HttpSession session){
        //Khoi tao doi tuong ModelAndView chuyen huong trang cart.jsp
        ModelAndView model = new ModelAndView("/FrontEnd/Cart");
        //Lay danh sach san pham trong session khach hang
        List<Cart> listCart = (List<Cart>)session.getAttribute("listCart");
        if (listCart!=null) {
            //Duyet sanh sach san pham
            for (Cart cart : listCart) {
                if (cart.getProduct().getProductID().trim().equals(productID)) {
                    //Neu san pham ton tai trong danh sach thi thuc hien xoa
                    listCart.remove(cart);
                    break;
                }
            }
        }
        //Luu danh sach san pham va tong tien cua khach hang vao session
        session.setAttribute("listCart", listCart);
        session.setAttribute("total", (long) getTotal(listCart));
        return model;
    }
    /*
    - Thuc hien cap nhat so luong san pham khach hang muon mua
    - Danh sach san pham duoc luu lai trong session cua khach hang
    - Thuc hien goi trang cart.jsp
    */
    @RequestMapping(value = "/FrontEnd/update",method = RequestMethod.POST)
    public ModelAndView update(HttpServletRequest request, HttpSession session){
        //Khoi tao doi tuong ModelAndView chuyen huong sang trang cart.jsp
        ModelAndView model = new ModelAndView("/FrontEnd/Cart");
        //Lay danh sach san pham trong session khach hang
        List<Cart> listCart = (List<Cart>)session.getAttribute("listCart");
        //Lay danh sach so luong san pham khach hang muon mua
        String[] arrQuantity = request.getParameterValues("quantity");
        for (int i = 0; i < listCart.size(); i++) {
            //Cap nhat so luong san pham muon mua vao danh sach san pham
            listCart.get(i).setQuantity(Integer.parseInt(arrQuantity[i]));
        }
        //Luu danh sach san pham va tong tien cua khach hang vao session
        session.setAttribute("listCart", listCart);
        session.setAttribute("total", (long) getTotal(listCart));
        return model;
    }
    
        
        public boolean addOrder(int userID, String phone, String email, String address, HttpSession session) {
        Connection conn = null;
        CallableStatement call = null;
        boolean check = false;
        //Lay danh sach san pham trong session khach hang
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        try {
            conn = ConnectionDB.openConnection();
            call = conn.prepareCall("{call Order_Insert(?,?,?,?,?)}");
            call.setFloat(1, (float) getTotal(listCart));
            call.setInt(2, userID);
            call.setString(3, phone);
            call.setString(4, email);
            call.setString(5, address);
            call.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            ConnectionDB.closeConnection(conn, call);
        }
        return check;
    }

    public boolean addOrderDetail(HttpSession session) {
        Connection conn = null;
        CallableStatement call = null;
        boolean check = false;
        //Lay danh sach san pham trong session khach hang
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        try {
            conn = ConnectionDB.openConnection();
            for (Cart c : listCart) {
                call = conn.prepareCall("{call OrderDetail_Insert(?,?,?,?)}");
                call.setString(1, c.getProduct().getProductID());
                call.setFloat(2, c.getProduct().getPriceImport());
                call.setFloat(3, c.getProduct().getPriceImport() * c.getQuantity());
                call.setInt(4, c.getQuantity());
                call.executeUpdate();
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            ConnectionDB.closeConnection(conn, call);
        }
        return check;
    }

    public void resetListcard(HttpSession session){
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        listCart = null;
        session.setAttribute("listCart", listCart);
    }
}
