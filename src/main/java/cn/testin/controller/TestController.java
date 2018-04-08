package cn.testin.controller;

import cn.testin.bean.LocalUser;
import cn.testin.service.LocalUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * **************************************************
 *
 * @author 甘海
 * @Description: <p/>
 * @FileName: TestController
 * @Created on 18/4/6
 * @Company: Testin
 * <p/>
 * ***************************************************
 */

@Controller
@RequestMapping(value = "/user")
public class TestController {

    @Resource
    private LocalUserService test;

    @RequestMapping(value = "/test")
    public String test(HttpServletRequest request, HttpServletResponse response, Model model) {
        //model.addAttribute("name", "甘海");

        LocalUser user = test.findUserById(1l);
        model.addAttribute("name", user.getRealName());
        return "user/test";
    }
}
