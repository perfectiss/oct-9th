package cn.bdqn.wk.demo2.services;

import cn.bdqn.wk.demo2.entity.Tbuser;

/**
 * Created by Administrator on 2017/8/27/027.
 */

public interface UserService {

    Tbuser queryUserByUserNameAndPassword(Tbuser tbuser);
}
