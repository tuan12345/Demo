/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Color;
import java.util.List;
import model.ColorModel;
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
public class ColorController {

    private ColorModel colorModel;

    public ColorController() {
        colorModel = new ColorModel();
    }

    @RequestMapping(value = "/getAllColor")
    public ModelAndView getAllColor() {
        ModelAndView model = new ModelAndView("backend/color_GetAll");
        List<Color> listCl = colorModel.getAllColor();
        model.addObject("colors", listCl);
        return model;
    }

    @RequestMapping(value = "/initInsertColor")
    public ModelAndView initInsertColor() {
        ModelAndView model = new ModelAndView("backend/color_Insert");
        Color cl = new Color();
        model.getModelMap().put("newColor", cl);
        return model;
    }

    @RequestMapping(value = "/insertColor")
    public String insertColor(@ModelAttribute("newColor") Color cl) {
        boolean check = colorModel.insertColor(cl);
        if (check) {
            return "redirect:getAllColor.htm";
                    
        } else {
            return "newColor";
        }
    }
    
    @RequestMapping(value = "/initUpdateColor")
    public ModelAndView initInsertColor(@RequestParam("colorID") int colorID){
        ModelAndView model = new ModelAndView("backend/color_Update");
        Color cl = colorModel.getColorByID(colorID);
        model.addObject("updateColor", cl);
        return model;
    }
    
    @RequestMapping(value = "/updateColor")
    public String updateColor(@ModelAttribute("updateColor") Color cl) {
        boolean check = colorModel.updateColor(cl);
        if (check) {
            return "redirect:getAllColor.htm";
                    
        } else {
            return "updateColor";
        }
    }
    @RequestMapping(value = "/deleteColor")
    public String updateColor(@RequestParam("colorID") int colorID) {
        boolean check = colorModel.deleteColor(colorID);
        if (check) {
            return "redirect:getAllColor.htm";
                    
        } else {
            return "error";
        }
    }

}
