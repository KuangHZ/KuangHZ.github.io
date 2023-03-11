package com.offcn.dao;

import com.offcn.bean.CategroyTop;
import com.offcn.bean.ConditionBean;
import com.offcn.bean.Movietable;
import com.offcn.bean.MovietableExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MovietableMapper {
    long countByExample(MovietableExample example);

    int deleteByExample(MovietableExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Movietable record);

    int insertSelective(Movietable record);

    List<Movietable> selectByExample(MovietableExample example);

    Movietable selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Movietable record, @Param("example") MovietableExample example);

    int updateByExample(@Param("record") Movietable record, @Param("example") MovietableExample example);

    int updateByPrimaryKeySelective(Movietable record);

    int updateByPrimaryKey(Movietable record);

    public List<CategroyTop> findCatagroyTop();

    public List<Movietable> findMoviesByCondtionBean(ConditionBean conditionBean);
}