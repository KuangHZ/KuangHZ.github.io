package com.offcn.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.bean.ConditionBean;
import com.offcn.bean.Moviedetailtable;
import com.offcn.bean.Movietable;
import com.offcn.dao.MoviedetailtableMapper;
import com.offcn.dao.MovietableMapper;
import com.offcn.util.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;


@Service
public class MovieServiceImpl implements MovieService{
    @Autowired
    private MovietableMapper movietableMapper;
    @Autowired
    private MoviedetailtableMapper moviedetailtableMapper;
    @Override
    public PageInfo<Movietable> findByPage(Movietable movietable){
        if (movietable.getPage()>0&&movietable.getPageSize()>0){
            PageHelper.startPage(movietable.getPage(),movietable.getPageSize());
        }
        List<Movietable> movietables = movietableMapper.selectByExample(null);
        PageInfo<Movietable> pageInfo = new PageInfo<>(movietables);
        return pageInfo;
    }

    @Override
    public PageInfo<Movietable> findMoviesByConditionBean(ConditionBean conditionBean) {
        PageHelper.startPage(conditionBean.getPage(),conditionBean.getPageSize());
        List<Movietable> movieList = movietableMapper.findMoviesByCondtionBean(conditionBean);
        PageInfo<Movietable> pageInfo = new PageInfo<>(movieList);
        return pageInfo;
    }

    @Override
    @Transactional
    public BaseResult addMovie(Movietable movietable, Moviedetailtable moviedetailtable) {
        BaseResult result = new BaseResult();
        try {
            movietableMapper.insert(movietable);
            moviedetailtable.setId(movietable.getId());
            moviedetailtableMapper.insert(moviedetailtable);
            result.setSuccess(true);
        } catch (Exception e) {
            e.printStackTrace();
            result.setSuccess(false);
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        return result;
    }
}















