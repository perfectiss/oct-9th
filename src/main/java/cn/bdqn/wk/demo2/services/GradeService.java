package cn.bdqn.wk.demo2.services;

import cn.bdqn.wk.demo2.entity.Grade;
import com.github.pagehelper.PageInfo;

/**
 * Created by Administrator on 2017/8/28/028.
 */
public interface GradeService {


    PageInfo<Grade> queryAllGrade(Integer pageNum, Integer pageSize);

    Grade queryGradeById(Integer id);

    Integer addGrade(Grade grade);

    Integer updateGrade(Grade grade);

    Integer deleteGrade(Integer id);
}
