package cn.bdqn.wk.demo2.entity;

/**
 * Created by Administrator on 2017/9/2/002.
 */
public class StuNum {


    private Integer id,gradeId,maxNum;

    @Override
    public String toString() {
        return "StuNum{" +
                "id=" + id +
                ", gradeId=" + gradeId +
                ", maxNum=" + maxNum +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGradeId() {
        return gradeId;
    }

    public void setGradeId(Integer gradeId) {
        this.gradeId = gradeId;
    }

    public Integer getMaxNum() {
        return maxNum;
    }

    public void setMaxNum(Integer maxNum) {
        this.maxNum = maxNum;
    }

    public StuNum(Integer id, Integer gradeId, Integer maxNum) {

        this.id = id;
        this.gradeId = gradeId;
        this.maxNum = maxNum;
    }

    public StuNum() {

    }
}
