package com.offcn.service;


import com.offcn.bean.TblUser;
import com.offcn.util.BaseResult;
public interface UserService {
    public BaseResult regist(TblUser user);

    public BaseResult loginCheck(TblUser user);
}
