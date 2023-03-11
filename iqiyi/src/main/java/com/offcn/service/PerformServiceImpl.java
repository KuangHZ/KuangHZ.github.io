package com.offcn.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.bean.Performerdetailtable;
import com.offcn.dao.PerformerdetailtableMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class PerformServiceImpl implements PerformerService {
    @Autowired
    private PerformerdetailtableMapper performerdetailtableMapper;
    @Override
    public PageInfo<Performerdetailtable> findByPage(Performerdetailtable performerdetailtable) {
        if (performerdetailtable.getPage() > 0 && performerdetailtable.getPageSize() > 0) {
            PageHelper.startPage(performerdetailtable.getPage(), performerdetailtable.getPageSize());
        }
        List<Performerdetailtable> performerdetailtables = performerdetailtableMapper.selectByExample(null);
        PageInfo<Performerdetailtable> pageInfo = new PageInfo<>(performerdetailtables);
        return pageInfo;
    }
}
