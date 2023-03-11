package com.offcn.service;

import com.offcn.bean.CategroyTop;
import com.offcn.bean.DataBean;
import com.offcn.dao.CategroymovietableMapper;
import com.offcn.dao.MovietableMapper;
import com.offcn.dao.PerformerdetailtableMapper;
import com.offcn.dao.TblUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataServiceImpl implements DataService{
    @Autowired
    private MovietableMapper movietableMapper;
    @Autowired
    private PerformerdetailtableMapper performerdetailtableMapper;
    @Autowired
    private TblUserMapper tblUserMapper;
    @Autowired
    private CategroymovietableMapper categroymovietableMapper;
    @Override
    public DataBean queryData() {
        //电影总数
        long moviesnum=movietableMapper.countByExample(null);
        //演员总数
        long performersnum=performerdetailtableMapper.countByExample(null);
        //用户数目
        long usernum=tblUserMapper.countByExample(null);
        //分类总数
        long categorynum=categroymovietableMapper.countByExample(null);
        //电影分类统计信息
        List<CategroyTop> categroyTops=movietableMapper.findCatagroyTop();
        DataBean dataBean=new DataBean();
        dataBean.setUsernum(usernum);
        dataBean.setMovienum(moviesnum);
        dataBean.setCategroynum(moviesnum);
        dataBean.setPerfomernum(categorynum);
        dataBean.setPerfomernum(performersnum);
        dataBean.setTops(categroyTops);
        return dataBean;
    }
}