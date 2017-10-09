package cn.bdqn.wk.demo2.mapper;

import cn.bdqn.wk.demo2.entity.Tbuser;

/**
 * Created by Administrator on 2017/8/27/027.
 */
public interface UserMapper {

    Tbuser queryUserByUserNameAndPassword(Tbuser tbuser);
}
