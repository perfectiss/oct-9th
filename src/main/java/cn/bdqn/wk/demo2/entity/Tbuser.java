package cn.bdqn.wk.demo2.entity;

/**
 * Created by Administrator on 2017/8/27/027.
 */
public class Tbuser {

    private int id;
    private String userName,password,nickName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Tbuser() {

    }

    public Tbuser(int id, String userName, String password, String nickName) {

        this.id = id;
        this.userName = userName;
        this.password = password;
        this.nickName = nickName;
    }

    @Override
    public String toString() {
        return "Tbuser{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", nickName='" + nickName + '\'' +
                '}';
    }
}
