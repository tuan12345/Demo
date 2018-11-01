package controller;

import entity.Favorite;
import entity.User;
import entity.UserSignup;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.UserModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    private UserModel userModel;

    public UserController() {
        userModel = new UserModel();
    }

    @RequestMapping(value = "/backend/getAllUser")
    public ModelAndView getAllUser() {
        ModelAndView model = new ModelAndView("backend/user_GetAll");
        List<User> listUser = userModel.getAllUser();
        model.addObject("users", listUser);
        return model;
    }

    @RequestMapping(value = "/backend/initInsertUser")
    public ModelAndView initInsertUser() {
        ModelAndView model = new ModelAndView("backend/user_Insert");
        User newUser = new User();
        model.getModelMap().put("newUser", newUser);
        return model;
    }

    @RequestMapping(value = "/backend/insertUser")
    public String insertUser(@ModelAttribute("newUser") User user) {
        boolean check = userModel.insertUser(user);
        if (check) {
            return "redirect:getAllUser.htm";
        } else {
            return "newUser";
        }
    }

    @RequestMapping(value = "/backend/initUpdateUser")
    public ModelAndView initUpdateUser(@RequestParam("userID") int userID) {
        ModelAndView model = new ModelAndView("backend/user_Update");
        User updateUser = userModel.getUserByID(userID);
        model.addObject("updateUser", updateUser);
        return model;
    }

    @RequestMapping(value = "/backend/updateUser")
    public String updateCatalog(@ModelAttribute("updateUser") User user) {
        boolean check = userModel.updateUser(user);
        if (check) {
            return "redirect:getAllUser.htm";
        } else {
            return "updateUser";
        }
    }

    @RequestMapping(value = "/backend/initFavorite")
    public ModelAndView initFavorite(@RequestParam("userID") int userID) {
        ModelAndView model = new ModelAndView("backend/user_Favorite");
        List<Favorite> listFa = userModel.getFavoriteByID(userID);
        model.addObject("favorites", listFa);
        return model;
    }

    @RequestMapping(value = "/backend/deleteUser")
    public String deleteCatalog(@RequestParam("userID") int userID) {
        boolean check = userModel.deleteUser(userID);
        if (check) {
            return "redirect:getAllUser.htm";
        } else {
            return "error";
        }
    }

    @RequestMapping(value = "/FrontEnd/InitLogin", method = RequestMethod.GET)
    public String login(ModelMap mm) {
        mm.put("user", new User());
        return "/FrontEnd/Login";
    }

    @RequestMapping(value = "/FrontEnd/Login")
    public String login(@ModelAttribute("user") User user, ModelMap mm, HttpSession session, HttpServletRequest request) {
        String link = null;
        UserModel userModel = new UserModel();
        User u = null;
        boolean check = userModel.checkLogin(user.getUserName(), user.getPassword());
        CartController cart = new CartController();
        if (check) {
            u = userModel.getUserByName(user.getUserName());
            //Them hoa don vao bang Order
            boolean checkOrder = cart.addOrder(u.getUserID(), u.getPhone(), u.getEmail(), u.getAddress(),session);
            if (checkOrder) {
                //Them hoa don vao bang OrderDetail
                boolean checkOrderDetail = cart.addOrderDetail(session);
                if (checkOrderDetail) {
                    mm.put("message3", "Them hoa don thanh cong<br>");
                    //Reset listCart
                    cart.resetListcard(session);
                }
            }
            
            mm.put("message1", "Dang nhap thanh cong<br>");
            link = "redirect: Home.htm";
        } else {
            mm.put("message2", "Tai khoan ko hop le<br>");
            link = "redirect: InitLogin.htm";
        }
        return link;
    }

    @RequestMapping(value = "/FrontEnd/Logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("userName");
        return "redirect: InitLogin.htm";

    }

    @RequestMapping(value = "/FrontEnd/InitSignup", method = RequestMethod.GET)
    public ModelAndView initSignup() {
        ModelAndView model = new ModelAndView("FrontEnd/signup");
        UserSignup user = new UserSignup();
        model.getModelMap().put("user", user);
        return model;
    }
    @RequestMapping(value = "/backend/initLogin")
    public ModelAndView initLogin() {
        ModelAndView model = new ModelAndView("backend/login");
        return model;
    }
    
    @RequestMapping(value = "/backend/TaiKhoan",method = RequestMethod.GET)
    public String login(@RequestParam(value="username") String userName,@RequestParam(value="password") String password) {
         boolean check = userModel.checkLoginAdmin(userName,password);
        if (check) {
            return "redirect:getAllProduct.htm";
        } else {
            return "redirect:initLogin.htm";
        }
    }

    @RequestMapping(value = "/FrontEnd/Signup")
    public String signup(@ModelAttribute("user") UserSignup u, ModelMap mm, HttpSession session) {
        String link = null;
        UserModel userModel = new UserModel();
        UserSignup user = null;
        boolean check = userModel.checkSignup(u.getUserName(), u.getEmail());

        if (check) {
            user = new UserSignup();
            boolean checkSignup = userModel.insertUser(u.getUserName(), u.getPassword(), u.getPhone(), u.getEmail(), u.getAddress(), u.isGender(), u.getBirthday());
//            session.setAttribute(u.getUserName(), user.getUserName());
            if (checkSignup) {
                link = "redirect: InitLogin.htm";
            } else {
                mm.put("message", "Dang ky ko thanh cong<br>");
                link = "redirect: InitSignup.htm";
            }
        } else {
            mm.put("message", "Dang ky ko thanh cong<br>");
            link = "redirect: InitSignup.htm";
        }
        return link;
    }
    
    
}
