package cn.wxz1997.controller;

import cn.wxz1997.entity.User;
import cn.wxz1997.service.HomeworkService;
import cn.wxz1997.util.Constants;
import cn.wxz1997.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.Session;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private HomeworkService homeworkService;

    @RequestMapping("/login")
    public ModelAndView login(@RequestParam("username")String username,
                              @RequestParam("password")String password,
                              ModelAndView mv,
                              HttpSession session){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        System.out.println(user);
        User user1 = homeworkService.login(user);
        System.out.println(user1);
        if(user1 == null){
            mv.addObject("message", "用户名或密码错误");
            mv.setViewName("login");
        }else{
            // 将用户保存到HttpSession当中
            session.setAttribute("user_session", user1);
            mv.setViewName("main");
        }

        return mv;
    }

    @RequestMapping("/register")
    public String register(User user){
        homeworkService.register(user);
        return "login";
    }

    @RequestMapping("/userinfo")
    public ModelAndView userinfo(ModelAndView mv, HttpSession session){
        User user = homeworkService.userinfo(((User)session.getAttribute("user_session")).getUserId());
        mv.addObject("user", user);
        System.out.println(user);
        mv.setViewName("userinfo");
        return mv;
    }

    @RequestMapping("/allUser")
    public ModelAndView allUser(ModelAndView mv, User user, Integer pageIndex){
        // 创建分页对象
        PageModel pageModel = new PageModel();
        // 如果参数pageIndex不为null，设置pageIndex，即显示第几页
        if(pageIndex != null){
            pageModel.setPageIndex(pageIndex);
        }
        List<User> allUser = homeworkService.allUser(user, pageModel);
        mv.addObject("pageModel", pageModel);
        mv.addObject("allUser", allUser);
        mv.setViewName("allUser");
        return mv;
    }
}
