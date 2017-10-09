package cn.bdqn.wk.demo2.util;

/**
 * Created by Administrator on 2017/8/29/029.
 */
public class Message {

    private String code,msg;

    public static Message success() {
        return new Message("0000", "操作成功!");
    }

    public static Message failed() {
        return new Message("0001", "操作失败!");
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Message(String code, String msg) {

        this.code = code;
        this.msg = msg;
    }

    public Message() {

    }
}
