/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Function;
import entity.Group;
import entity.Group_Function;
import java.util.List;
import model.GroupModel;
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
@RequestMapping(value = "/backend", method = RequestMethod.GET) //@@
public class GroupController {

    private GroupModel groupModel;

    public GroupController() {
        groupModel = new GroupModel();
    }

    @RequestMapping(value = "/getAllGroup")
    public ModelAndView getAllGroup() {
        ModelAndView model = new ModelAndView("backend/group_GetAll");
        List<Group> listGr = groupModel.getAllGroup();
        model.addObject("groups", listGr);
        return model;
    }

    @RequestMapping(value = "/initInsertGroup")
    public ModelAndView initInsertGroup() {
        ModelAndView model = new ModelAndView("backend/group_Insert");
        Group newGroup = new Group();
        model.getModelMap().put("newGroup", newGroup);
        return model;
    }

    @RequestMapping(value = "/insertGroup")
    public String insertCatalog(@ModelAttribute("newGroup") Group group) {
        boolean check =  groupModel.insertGroup(group);
        if (check) {
            return "redirect:getAllGroup.htm";
        } else {
            return "newGroup";
        }
    }

    @RequestMapping(value = "/initUpdateGroup")
    public ModelAndView initUpdateGroup(@RequestParam("groupID") int groupID) {
        ModelAndView model = new ModelAndView("backend/group_Update");
        Group updateGroup = groupModel.getGroupByID(groupID);
        model.addObject("updateGroup", updateGroup);
        return model;
    }

    @RequestMapping(value = "/updateGroup")
    public String updateGroup(@ModelAttribute("updateGroup") Group group) {
        boolean check = groupModel.updateGroup(group);
        if (check) {
            return "redirect:getAllGroup.htm";
        } else {
            return "updateGroup";
        }
    }

    @RequestMapping(value = "/deleteGroup")
    public String deleteGroup(@RequestParam("groupID") int groupID) {
        boolean check = groupModel.deleteGroup(groupID);
        if (check) {
            return "redirect:getAllGroup.htm";
        } else {
            return "error";
        }
    }
    
    @RequestMapping(value = "/initGetFunctionByGroupID")
    public ModelAndView initGetFunctionByGroupID(@RequestParam("groupID") int groupID) {
        ModelAndView model = new ModelAndView("backend/group_Detail");
        List<Group_Function> listGf = groupModel.getFunctionByGroupID(groupID);
        model.addObject("Functions", listGf);
        return model;
    }
    
   @RequestMapping(value = "/deleteFunctionInGroup")
    public String deleteFunctionInGroup(@RequestParam("groupID") int groupID,@RequestParam("functionID") int functionID) {
        boolean check = groupModel.deleteFunctionInGroup(groupID,functionID);
        if (check) {
            return "redirect:initGetFunctionByGroupID.htm?groupID="+groupID;
        } else {
            return "error";
        }
    }
    
    @RequestMapping(value = "/initInsertFunctionGroup")
    public ModelAndView initInsertFunctionGroup(@RequestParam("groupID") int groupID){
        ModelAndView model = new ModelAndView("backend/group_Detail_Insert");
        Group_Function gr = new Group_Function();
        gr.setGroupID(groupID);
        model.addObject("addFunction", gr);
        return model;
    }
    @RequestMapping(value = "/insertFunctionGroup")
    public String insertFunctionGroup(@ModelAttribute("newGroupFunction") Group_Function gf){
        boolean check = groupModel.insertFunctionInGroup(gf);
        if (check) {
            return "redirect:initGetFunctionByGroupID.htm";
        }
        else
            return "insertFunctionGroup";
    }
}
