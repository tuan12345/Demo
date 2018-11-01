/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Comment;
import java.util.List;
import model.CommentModel;
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
@RequestMapping(value = "/backend", method = RequestMethod.GET)
public class CommentController {

    private CommentModel commentModel;

    public CommentController() {
        commentModel = new CommentModel();
    }

     @RequestMapping(value = "/getAllComment")
    public ModelAndView getAllComment() {
        ModelAndView model = new ModelAndView("backend/comment_GetAll");
        List<Comment> listCm = commentModel.getAllComment();
        model.addObject("comments", listCm);
        return model;
    }
    @RequestMapping(value = "/updateComment")
    public String updateComment(@RequestParam("userID") int userID, @RequestParam("productID") String orderID) {
        boolean check = commentModel.updateComment(userID,orderID);
        if (check) {
            return "redirect:getAllComment.htm";
        } else {
            return "error";
        }
    }
    @RequestMapping(value = "/deleteComment")
    public String deleteComment(@RequestParam("userID") int userID, @RequestParam("productID") String orderID) {
        boolean check = commentModel.deleteComment(userID,orderID);
        if (check) {
            return "redirect:getAllComment.htm";
        } else {
            return "error";
        }
    }
    
}
