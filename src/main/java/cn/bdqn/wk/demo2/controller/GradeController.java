package cn.bdqn.wk.demo2.controller;

import cn.bdqn.wk.demo2.entity.Grade;
import cn.bdqn.wk.demo2.services.GradeService;
import cn.bdqn.wk.demo2.util.Message;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/8/28/028.
 */
@Controller
@RequestMapping(value = "grade")
public class GradeController {

    @Resource
    private GradeService gradeService;

    @GetMapping(value = "doListGrade")
    public String doListGrade(Integer pageNum, Integer pageSize, Model model) {
        model.addAttribute("pageInfo", gradeService.queryAllGrade(pageNum, pageSize));
        return "main/grade";
    }

    @GetMapping(value = "queryGrade", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String queryGrade(Integer id) {
        return JSON.toJSONString(gradeService.queryGradeById(id));
    }

    @GetMapping(value = "deleteGrade",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String deleteGrade(Integer id) {
        if (gradeService.deleteGrade(id)>0) {
        return JSON.toJSONString(Message.success());

        }else{
            return JSON.toJSONString(Message.failed());
        }
    }

    @GetMapping(value = "updateGrade",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String updateGrade(Grade grade) {
        if (gradeService.updateGrade(grade)>0) {
            return JSON.toJSONString(Message.success());

        }else{
            return JSON.toJSONString(Message.failed());
        }
    }

    @GetMapping(value = "addGrade",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String addGrade(Grade grade) {
        if (gradeService.addGrade(grade)>0) {
            return JSON.toJSONString(Message.success());

        }else{
            return JSON.toJSONString(Message.failed());
        }
    }
}
