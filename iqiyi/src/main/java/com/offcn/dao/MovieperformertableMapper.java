package com.offcn.dao;

import com.offcn.bean.Movieperformertable;
import com.offcn.bean.MovieperformertableExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MovieperformertableMapper {
    long countByExample(MovieperformertableExample example);

    int deleteByExample(MovieperformertableExample example);

    int insert(Movieperformertable record);

    int insertSelective(Movieperformertable record);

    List<Movieperformertable> selectByExample(MovieperformertableExample example);

    int updateByExampleSelective(@Param("record") Movieperformertable record, @Param("example") MovieperformertableExample example);

    int updateByExample(@Param("record") Movieperformertable record, @Param("example") MovieperformertableExample example);
}