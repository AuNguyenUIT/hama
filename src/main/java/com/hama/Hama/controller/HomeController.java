package com.hama.Hama.controller;

import com.hama.Hama.entities.CategoryEntity;
import com.hama.Hama.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    CategoryService categoryService;

    @RequestMapping("/")
    public String hello(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            if (session.getAttribute("role") != null) {
                if (session.getAttribute("role").equals(UserRole.ADMIN)) {
                    return "redirect:/quan-tri";
                }
            }
            List<CategoryEntity> categoryList = categoryService.getCategories();
            model.addAttribute("categories", categoryList);
            return "client/index";
        }
        List<CategoryEntity> categoryList = categoryService.getCategories();
        model.addAttribute("categories", categoryList);
        return "client/index";

    }


}
