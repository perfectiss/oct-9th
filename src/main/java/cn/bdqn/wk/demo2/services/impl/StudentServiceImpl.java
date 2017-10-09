package cn.bdqn.wk.demo2.services.impl;

import cn.bdqn.wk.demo2.entity.Student;
import cn.bdqn.wk.demo2.mapper.StudentMapper;
import cn.bdqn.wk.demo2.services.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/9/2/002.
 */
@Service
public class StudentServiceImpl implements StudentService {

    private StudentMapper studentMapper;

    @Override
    public Integer addStudent(Student student) {
        return null;
    }

    @Override
    public Integer deleteStudents(List<Integer> list) {
        return studentMapper.deleteStudents(list);
    }

    @Override
    public PageInfo<Student> queryAllStudent(Integer pageNum, Integer PageSize) {
        PageHelper.startPage(pageNum,PageSize);
        List<Student> list = studentMapper.queryAllStudent();
        return new PageInfo<>(list);
    }
}
