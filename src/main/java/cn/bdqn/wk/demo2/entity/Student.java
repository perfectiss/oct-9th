package cn.bdqn.wk.demo2.entity;

/**
 * Created by Administrator on 2017/9/2/002.
 */
public class Student {
    private Integer id,age;
    private String stuName,stuNum,gender;
    private Grade grade;

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", age=" + age +
                ", stuName='" + stuName + '\'' +
                ", stuNum='" + stuNum + '\'' +
                ", gender='" + gender + '\'' +
                ", grade=" + grade +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuNum() {
        return stuNum;
    }

    public void setStuNum(String stuNum) {
        this.stuNum = stuNum;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public Student(Integer id, Integer age, String stuName, String stuNum, String gender, Grade grade) {

        this.id = id;
        this.age = age;
        this.stuName = stuName;
        this.stuNum = stuNum;
        this.gender = gender;
        this.grade = grade;
    }

    public Student() {

    }
}
