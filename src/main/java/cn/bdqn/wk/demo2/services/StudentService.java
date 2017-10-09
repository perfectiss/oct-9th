package cn.bdqn.wk.demo2.services;

import cn.bdqn.wk.demo2.entity.Student;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2017/9/2/002.
 */
public interface StudentService {

    Integer addStudent(Student student);

    Integer deleteStudents(List<Integer> list);

    PageInfo<Student> queryAllStudent(Integer pageNum, Integer PageSize);

}
