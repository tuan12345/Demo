/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.PaymentType;
import java.util.List;
import model.PaymentTypeModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author neo
 */
@Controller
@RequestMapping(value = "/backend", method = RequestMethod.GET)
public class PaymentTypeController {

    private PaymentTypeModel pmTypeModel;

    public PaymentTypeController() {
        pmTypeModel = new PaymentTypeModel();
    }

    @RequestMapping(value = "/getAllPaymentType")
    public ModelAndView getAllPaymentType() {
        ModelAndView model = new ModelAndView("backend/paymentType_GetAll");
        List<PaymentType> listPm = pmTypeModel.getAllPaymentType();
        model.addObject("paymentTypes", listPm);
        return model;
    }
    
    @RequestMapping(value = "/initInsertPaymentType")
    public ModelAndView initInsertPaymentType(){
        ModelAndView model = new ModelAndView("backend/paymentType_Insert");
        PaymentType pm = new PaymentType();
        model.getModelMap().put("newPaymentType", pm);
        return model;
    }
    
    @RequestMapping(value = "/insertPaymentType")
    public String insertPaymentType(@ModelAttribute("newPaymentType") PaymentType pm){
        boolean check = pmTypeModel.insertPaymentType(pm);
        if (check) {
            return "redirect:getAllPaymentType.htm";
        } else {
            return "newPaymentType";
        }
    }
    
    @RequestMapping(value = "/initUpdatePaymentType")
    public ModelAndView initUpdatePaymentType(@RequestParam("paymentTypeID") int paymenID){
        ModelAndView model = new ModelAndView("backend/paymentType_Update");
        PaymentType pm = pmTypeModel.getPaymentTypeByID(paymenID);
        model.addObject("updatePaymentType", pm);
        return model;
    }
    
    @RequestMapping(value = "/updatePaymentType")
    public String updatePaymentType(@ModelAttribute("newPaymentType") PaymentType pm){
        boolean check = pmTypeModel.updatePaymentType(pm);
        if (check) {
            return "redirect:getAllPaymentType.htm";
        } else {
            return "updatePaymentType";
        }
    }
    @RequestMapping(value = "/deletePaymentType")
    public String updatePaymentType(@RequestParam("paymentTypeID") int paymentTypeID){
        boolean check = pmTypeModel.deletePaymentType(paymentTypeID);
        if (check) {
            return "redirect:getAllPaymentType.htm";
        } else {
            return "error";
        }
    }
    
}
