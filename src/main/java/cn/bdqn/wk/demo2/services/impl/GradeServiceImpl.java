package cn.bdqn.wk.demo2.services.impl;

import cn.bdqn.wk.demo2.entity.Grade;
import cn.bdqn.wk.demo2.mapper.GradeMapper;
import cn.bdqn.wk.demo2.services.GradeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/8/28/028.
 */
@Service
public class GradeServiceImpl implements GradeService {

    @Resource
    private GradeMapper gradeMapper;
    @Override
    public PageInfo<Grade> queryAllGrade(Integer pageNum, Integer pageSize) {

        if (pageNum == null) {
            pageNum=1;
        }

        if (pageSize == null) {
            pageSize = 5;
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Grade> list = gradeMapper.queryAllGrade();
        return new PageInfo<>(list);
    }

    @Override
    public Grade queryGradeById(Integer id) {
        return gradeMapper.queryGradeById(id);
    }

    @Override
    public Integer addGrade(Grade grade) {
        return gradeMapper.addGrade(grade);
    }

    @Override
    public Integer updateGrade(Grade grade) {
        return gradeMapper.updateGrade(grade);
    }

    @Override
    public Integer deleteGrade(Integer id) {
        return gradeMapper.deleteGrade(id);
    }
}
