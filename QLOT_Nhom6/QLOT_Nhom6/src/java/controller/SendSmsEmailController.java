/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import util.EmailUtil;
import util.SMSUtil;

/**
 *
 * @author neo
 */
@Controller
@RequestMapping(value = "/show")
public class SendSmsEmailController {

    @RequestMapping(value = "/sendSms", method = RequestMethod.POST)
    public ModelAndView doSendEmail(HttpServletRequest request) throws IOException {
        ModelAndView model = new ModelAndView("/Result");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");
        SMSUtil.sendSMS(phone, message);

        return model;
    }

    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
    public ModelAndView doSendEmail(@ModelAttribute("email") EmailUtil email, HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
        ModelAndView model = new ModelAndView("/Result");
        request.setCharacterEncoding("UTF-8");
        // Lay dia chi nguoi nhan
        String recipientAddress = request.getParameter("recipient");
        //Lay subject cua mail
        String subject = request.getParameter("subject");
        //Lay noi dung message cua mail
        String message = request.getParameter("message");
        //Gui mail
        EmailUtil.sendEmail(recipientAddress, subject, message);

        return model;
    }
}
