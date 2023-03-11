package com.offcn.service;


import com.offcn.bean.Categroymovietable;
import com.offcn.dao.CategroymovietableMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService{
    @Autowired
    private CategroymovietableMapper categroymovietableMapper;

    @Override
    public List<Categroymovietable> findCategroyMovies() {
        List<Categroymovietable> categroymovietableList = categroymovietableMapper.selectByExample(null);
        return categroymovietableList;
    }

}
