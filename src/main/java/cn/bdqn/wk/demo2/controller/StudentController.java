package cn.bdqn.wk.demo2.controller;

import cn.bdqn.wk.demo2.entity.Student;
import cn.bdqn.wk.demo2.services.StudentService;
import cn.bdqn.wk.demo2.util.Message;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/9/2/002.
 */
@Controller
@RequestMapping(value = "student")
public class StudentController {

    @Resource
    private StudentService studentService;

    @GetMapping(value = "doListStudent")
    public String doListStudent(Integer pageNum,Integer pageSize,Model model) {
        if (pageNum == null) {
            pageNum=1;
        }
        if (pageSize == null) {
            pageSize=5;
        }
        model.addAttribute("pageInfo", studentService.queryAllStudent(pageNum, pageSize));
        return "main/student";
    }

    @GetMapping(value = "doAddStudent", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String doAddStudent(Student student) {
        if (studentService.addStudent(student)>0) {
            return JSON.toJSONString(Message.success());
        }else{
            return JSON.toJSONString(Message.failed());

        }
    }

    @GetMapping(value = "doDeleteStudents", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String doDeleteStudents(String stuIds) {
        String[] stuArray = stuIds.split(",");
        List<Integer> list = new ArrayList<>();
        for (String s : stuArray) {
            list.add(Integer.parseInt(s));
        }
        if (studentService.deleteStudents(list)>0) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.failed());

    }

   /* @PostMapping(value = "doAddStudent", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String doAddStudent(Student student) {

    }
*/

}