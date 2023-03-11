package com.offcn.dao;

import com.offcn.bean.Performerdetailtable;
import com.offcn.bean.PerformerdetailtableExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PerformerdetailtableMapper {
    long countByExample(PerformerdetailtableExample example);

    int deleteByExample(PerformerdetailtableExample example);

    int insert(Performerdetailtable record);

    int insertSelective(Performerdetailtable record);

    List<Performerdetailtable> selectByExample(PerformerdetailtableExample example);

    int updateByExampleSelective(@Param("record") Performerdetailtable record, @Param("example") PerformerdetailtableExample example);

    int updateByExample(@Param("record") Performerdetailtable record, @Param("example") PerformerdetailtableExample example);
}