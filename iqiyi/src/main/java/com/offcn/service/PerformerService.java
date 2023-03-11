package com.offcn.service;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.Performerdetailtable;

public interface PerformerService {
    public PageInfo<Performerdetailtable> findByPage(Performerdetailtable performerdetailtable);
}
