package com.axsos.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.axsos.login.model.LoginUser;
import com.axsos.login.model.User;
import com.axsos.login.service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.*;

@Controller
public class MainController {
@Autowired
UserService userService;
@RequestMapping("/")
public String index(Model model){
    model.addAttribute("newUser", new User());
    model.addAttribute("loginUser", new LoginUser());
    return "index.jsp";
}
@RequestMapping("/home")
public String home(Model model,HttpSession session){
    if(session.getAttribute("loggedUser") !=null)
    {
    return "home.jsp";}
    else{
        return "redirect:/";
    }
}


@PostMapping("/adduser")
public String register(@Valid @ModelAttribute("newUser")User newUser,BindingResult result,Model model,HttpSession session){
    User loggedUser = userService.register(newUser,result);
    if(result.hasErrors()){
        model.addAttribute("loginUser", new LoginUser());
        return "index.jsp";
    }
    else{
        session.setAttribute("loggedUser", loggedUser);
        return "redirect:/";
    }
}
@PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginUser") LoginUser loguser,
    BindingResult result,
    HttpSession session,
    Model model

    ){
    User loggedUser=userService.login(loguser, result);
    if(result.hasErrors()){
        model.addAttribute("newUser", new User());
        return "index.jsp";
    }
    else{
        session.setAttribute("loggedUser", loggedUser);
        return "redirect:/dashboard";
    }
}
@GetMapping("/logout")
public String logout(HttpSession session){
    session.invalidate();
    return "redirect:/";
}
}
