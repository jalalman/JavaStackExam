package com.axsos.login.controller;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.axsos.login.model.LoginUser;
import com.axsos.login.model.Team;
import com.axsos.login.model.Student;
import com.axsos.login.model.User;
import com.axsos.login.service.TeamService;
import com.axsos.login.service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class TeamController {
    @Autowired
    TeamService teamService;
    @Autowired
    UserService userService;
    @RequestMapping("/dashboard")
    public String index(@ModelAttribute("student") Student student , @ModelAttribute("class") Team stuClass,HttpSession session,@ModelAttribute("newUser")User newUser,Model model, @ModelAttribute("loginUser") LoginUser loguser) {
        if(session.getAttribute("loggedUser") !=null){
        model.addAttribute("teams", teamService.allTeams());
        model.addAttribute("loggedUser", session.getAttribute("loggedUser"));
        
        return "dashboard.jsp";
        }
        else{
            return "redirect:/";
        }
        
    }
    
    @GetMapping("/teams/new")
    public String newTeam(@ModelAttribute("team") Team team,HttpSession session, BindingResult result,Model model) {
        if(session.getAttribute("loggedUser") !=null){
        return "addTeam.jsp";
        }
        else{
            return "redirect:/";
        }
    }

    @PostMapping("/teams/news")
    public String createClass(@Valid @ModelAttribute("team") Team team, BindingResult result,Model model) {
        if (result.hasErrors()) {
            
            return "redirect:/teams/new";
        } else {
           teamService.createTeam(team);
            return "redirect:/dashboard";
        }

    }
   
    @GetMapping("/teams/{teamId}")
    public String showTeam(@PathVariable("teamId")long teamId, @ModelAttribute("team") Team team,HttpSession session,Model model) {
        if(session.getAttribute("loggedUser") !=null){
        model.addAttribute("team", teamService.findTeam(teamId));
        User loggedUser = (User) session.getAttribute("loggedUser");
        model.addAttribute("loggedUser", loggedUser);
        return "teamProfile.jsp";}
        else{
            return "redirect:/";
        }
    }

    @RequestMapping("/teams/{teamId}/edit")
    public String editTeamView(@PathVariable("teamId")long teamId,@ModelAttribute("team") Team team,HttpSession session,Model model) {
        if(session.getAttribute("loggedUser") !=null){
        model.addAttribute("team", teamService.findTeam(teamId));
        return "editTeam.jsp";}
        else{
            return "redirect:/";
        }
    }
    @PostMapping("/teams/{teamId}/edit")
    public String editTeam(@PathVariable("teamId")long teamId,@Valid @ModelAttribute("team") Team team, BindingResult result,Model model) {
        if (result.hasErrors()) {
            model.addAttribute("team", teamService.findTeam(teamId));
            return "editTeam.jsp";
        } else {
            teamService.updateTeam(team);
            return "redirect:/dashboard";
        }

    
    }
    @RequestMapping("/teams/{teamId}/delete")
    public String deleteTeam(@PathVariable("teamId")long teamId,HttpSession session) {
        if(session.getAttribute("loggedUser") !=null){
            teamService.deleteTeam(teamId);
            return "redirect:/dashboard";
        }
        else{
            return "redirect:/";
        }

        
       
    }


}
