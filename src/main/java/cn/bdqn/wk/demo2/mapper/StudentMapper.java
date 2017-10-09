package cn.bdqn.wk.demo2.mapper;

import cn.bdqn.wk.demo2.entity.Student;

import java.util.List;

/**
 * Created by Administrator on 2017/9/2/002.
 */
public interface StudentMapper {
    Integer addStudent(Student student);

    List<Student> queryAllStudent();

    Integer deleteStudents(List<Integer> list);
}
