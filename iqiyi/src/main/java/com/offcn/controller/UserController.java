package com.offcn.controller;

import com.offcn.bean.TblUser;
import com.offcn.service.UserService;
import com.offcn.util.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("show-login")
    public String showLogin(){
        return "login";
    }

    @RequestMapping("show-register")
    public String showRegist(Model model){
        model.addAttribute("user",new TblUser());
        return "register";
    }
    /*注册*/
    @RequestMapping("save-register")
    public String register(TblUser user){

        BaseResult result=userService.regist(user);
        if (result.isSuccess()){
            /*注册成功*/
            return "login";
        }else {
            /*注册失败*/
            return "forward:register";
        }
    }
    /*登录校验*/
    @RequestMapping("login")
    public String login(TblUser user){
        BaseResult result = userService.loginCheck(user);
        if (result.isSuccess()){
            //登陆成功
            return "redirect:/main/show-main";
        }else {
            //登陆失败
            return "forward:/login.jsp";
        }
    }
}























