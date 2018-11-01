/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.PaymentBank;
import entity.PaymentVisa;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author neo
 */
@Controller
@RequestMapping(value = "/show", method = RequestMethod.GET)
public class PaymentController {

    @RequestMapping(value = "/initPayment", method = RequestMethod.GET)
    public ModelAndView initPayment() {
        ModelAndView model = new ModelAndView("/payment/Payment");
        PaymentVisa visa = new PaymentVisa();
        model.getModelMap().addAttribute("visa", visa);
        PaymentBank bank = new PaymentBank();
        model.getModelMap().addAttribute("bank", bank);
        return model;
    }

    @RequestMapping(value = "/PaymentVisa", method = RequestMethod.GET)
    public ModelAndView paymentVisa(@ModelAttribute("visa") PaymentVisa visa) {
        String merchantName = "Weboto";
        ModelAndView model;
        String returnSt = checkVisa(merchantName, visa.getAccNo(), visa.getAccName(), visa.getPaymentAmount());
        String arraySt[] = returnSt.split("#");
        String returnCode = arraySt[0];
        int transactionId = Integer.parseInt(arraySt[1]);
        if (returnCode.equals("00")) {
            String returnCodeFinish = finishVisa(transactionId, merchantName);
            if (returnCodeFinish.equals("00")) {
                model = new ModelAndView("/payment/SmsEmail");
            } else {
                model = new ModelAndView("/payment/PaymentFail");
            }
        } else {
            if (returnCode.equals("03")) {
                model = new ModelAndView("/payment/Charge");
            } else {
                model = new ModelAndView("/payment/PaymentFail");
            }
        }
        return model;
    }

    @RequestMapping(value = "/PaymentBank", method = RequestMethod.GET)
    public ModelAndView paymentBank(@ModelAttribute("bank") PaymentBank bank) {
        String merchantName = "Weboto";
        ModelAndView model;
        String returnSt = checkOrder(merchantName, bank.getAccNo(), bank.getAccName(), bank.getPaymentAmount());
        String arraySt[] = returnSt.split("#");
        String returnCode = arraySt[0];
        int transactionId = Integer.parseInt(arraySt[1]);
        if (returnCode.equals("00")) {
            String returnCodeFinish = finishOrder(transactionId, merchantName);
            if (returnCodeFinish.equals("00")) {
                model = new ModelAndView("/payment/SmsEmail");
            } else {
                model = new ModelAndView("/payment/PaymentFail");
            }
        } else {
            if (returnCode.equals("03")) {
                model = new ModelAndView("/payment/Charge");
            } else {
                model = new ModelAndView("/payment/PaymentFail");
            }
        }
        return model;
    }

    @RequestMapping(value = "/PaymentMoney", method = RequestMethod.GET)
    public ModelAndView paymentMoney() {
        ModelAndView model = new ModelAndView("/payment/Result");
        return model;
    }

    private static String checkVisa(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, float arg3) {
        ws.NetBankingWS_Service service = new ws.NetBankingWS_Service();
        ws.NetBankingWS port = service.getNetBankingWSPort();
        return port.checkVisa(arg0, arg1, arg2, arg3);
    }

    private static String finishVisa(int arg0, java.lang.String arg1) {
        ws.NetBankingWS_Service service = new ws.NetBankingWS_Service();
        ws.NetBankingWS port = service.getNetBankingWSPort();
        return port.finishVisa(arg0, arg1);
    }

    private static String checkOrder(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, float arg3) {
        ws.NetBankingWS_Service service = new ws.NetBankingWS_Service();
        ws.NetBankingWS port = service.getNetBankingWSPort();
        return port.checkOrder(arg0, arg1, arg2, arg3);
    }

    private static String finishOrder(int arg0, java.lang.String arg1) {
        ws.NetBankingWS_Service service = new ws.NetBankingWS_Service();
        ws.NetBankingWS port = service.getNetBankingWSPort();
        return port.finishOrder(arg0, arg1);
    }
}
