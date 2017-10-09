package cn.bdqn.wk.demo2.services.impl;

import cn.bdqn.wk.demo2.entity.Tbuser;
import cn.bdqn.wk.demo2.mapper.UserMapper;
import cn.bdqn.wk.demo2.services.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/8/27/027.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;


    @Override
    public Tbuser queryUserByUserNameAndPassword(Tbuser tbuser) {
        return userMapper.queryUserByUserNameAndPassword(tbuser);
    }
}
