package cn.bdqn.wk.demo2.mapper;

import cn.bdqn.wk.demo2.entity.Grade;

import java.util.List;

/**
 * Created by Administrator on 2017/8/28/028.
 */
public interface GradeMapper {

    List<Grade> queryAllGrade();

    Grade queryGradeById(Integer id);

    Integer addGrade(Grade grade);

    Integer updateGrade(Grade grade);

    Integer deleteGrade(Integer id);

}
