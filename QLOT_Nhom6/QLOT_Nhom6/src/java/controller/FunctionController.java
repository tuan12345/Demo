/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Function;
import java.util.List;
import model.FunctionModel;
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
public class FunctionController {
    private FunctionModel functionModel;

    public FunctionController() {
        functionModel = new FunctionModel();
    }
    
    @RequestMapping(value = "/getAllFunction")
    public ModelAndView getAllFunction() {
        ModelAndView model = new ModelAndView("backend/function_GetAll");
        List<Function> listFc = functionModel.getAllFunction();
        model.addObject("functions", listFc);
        return model;
    }

    @RequestMapping(value = "/initInsertFunction")
    public ModelAndView initInsertFunction() {
        ModelAndView model = new ModelAndView("backend/function_Insert");
        Function fc = new Function();
        model.getModelMap().put("newFunction", fc);
        return model;
    }

    @RequestMapping(value = "/insertFunction")
    public String insertFunction(@ModelAttribute("newFunction") Function fc) {
        boolean check = functionModel.insertFunction(fc);
        if (check) {
            return "redirect:getAllFunction.htm";
                    
        } else {
            return "newFunction";
        }
    }
    
    @RequestMapping(value = "/initUpdateFunction")
    public ModelAndView initInsertFunction(@RequestParam("functionID") int functionID){
        ModelAndView model = new ModelAndView("backend/function_Update");
        Function cl = functionModel.getFunctionByID(functionID);
        model.addObject("updateFunction", cl);
        return model;
    }
    
    @RequestMapping(value = "/updateFunction")
    public String updateFunction(@ModelAttribute("updateFunction") Function fc) {
        boolean check = functionModel.updateFunction(fc);
        if (check) {
            return "redirect:getAllFunction.htm";
                    
        } else {
            return "updateFunction";
        }
    }
    @RequestMapping(value = "/deleteFunction")
    public String updateFunction(@RequestParam("functionID") int functionID) {
        boolean check = functionModel.deleteFunction(functionID);
        if (check) {
            return "redirect:getAllFunction.htm";
                    
        } else {
            return "error";
        }
    }
    
}
