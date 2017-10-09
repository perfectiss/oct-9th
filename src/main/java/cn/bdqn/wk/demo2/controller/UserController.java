package cn.bdqn.wk.demo2.controller;

import cn.bdqn.wk.demo2.entity.Tbuser;
import cn.bdqn.wk.demo2.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/8/27/027.
 */
@Controller
@RequestMapping(value = "user")
public class UserController {

    @Resource
    private UserService userService;

    @PostMapping(value = "doLogin")
    public String doLogin(Tbuser tbuser, Model model) {
        if (userService.queryUserByUserNameAndPassword(tbuser) != null) {
            return "main/main";
        }else{
            model.addAttribute("msg","对不起,用户名或者密码错误!");
            return "redirect:index.jsp";
        }
    }

    @GetMapping(value = "toLeft")
    public String left() {
        return "main/left";
    }

    @GetMapping(value = "toRight")
    public String right() {
        return "main/right";
    }

    @GetMapping(value = "toTop")
    public String top() {
        return "main/top";
    }
}

