package controller;

import entity.Order;
import entity.Order_Detail;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.OrderModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController {
    private OrderModel orderModel;

    public OrderController() {
    orderModel = new OrderModel();
    }
    
    @RequestMapping(value = "/backend/getAllOrder")
    public ModelAndView getAllUser() {
        ModelAndView model = new ModelAndView("backend/order_GetAll");
        List<Order> listOrder = orderModel.getAllOrder();
        model.addObject("orders", listOrder);
        return model;
    }
    
    @RequestMapping(value = "/backend/getDetailOrderByID")
    public ModelAndView getDetailOrderByID(@RequestParam("orderID") int orderID) {
        ModelAndView model = new ModelAndView("backend/order_Detail");
        List<Order_Detail> listOd_Dt = orderModel.getAllOrder_Detail(orderID);
        model.addObject("order_details", listOd_Dt);
        return model;
    }
    
    @RequestMapping(value = "/backend/updateOrder")
    public String deleteCatalog(@RequestParam("orderID") int orderID) {
        boolean check = orderModel.updateOrder(orderID);
        if (check) {
            return "redirect:getAllOrder.htm";
        } else {
            return "error";
        }
    }
    
    
    
}
