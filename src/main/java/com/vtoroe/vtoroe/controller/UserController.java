package com.vtoroe.vtoroe.controller;

import com.vtoroe.vtoroe.domain.Rol;
import com.vtoroe.vtoroe.domain.Summ;
import com.vtoroe.vtoroe.domain.User;
import com.vtoroe.vtoroe.repos.UserRepo;
import com.vtoroe.vtoroe.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRepo userRepo;

    @GetMapping
    public String userList(
            Model model) {

        model.addAttribute("users", userService.findAll());

        return "userList";
    }



    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, ModelMap model) {
        if (user==null){
            return "redirect:/user";
        }
         model.addAttribute("user", user);
        model.addAttribute("roles", Rol.values());
        return "userEdit";
    }
    @PostMapping
    public String userSave(
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        userService.saveUser(user,form);
        return "redirect:/user";
    }
    @GetMapping("/User/{user}")
    public String userForm(@PathVariable User user, Model model) {
        if (user==null){
            return "redirect:/user";
        }
        List<Summ> summs=userRepo.getOne(user.getId()).getSumm();
        model.addAttribute("summs", summs);
        model.addAttribute("user", user);
        return "User";
    }
}