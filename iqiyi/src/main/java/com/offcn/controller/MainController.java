package com.offcn.controller;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.Movietable;
import com.offcn.bean.Performerdetailtable;
import com.offcn.service.MovieService;
import com.offcn.service.PerformerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main")
public class MainController {
    @Autowired
    private MovieService movieService;
    @Autowired
    private PerformerService performerService;
    /*展示后台首页信息*/
    @RequestMapping("show-main")
    public String showMain(Model model){
        //获取电影列表
        Movietable movietable = new Movietable();
        movietable.setPage(1);
        movietable.setPageSize(9);
        PageInfo<Movietable> pageInfo = movieService.findByPage(movietable);
        model.addAttribute("movies",pageInfo.getList());
        //获取演员列表
        Performerdetailtable performerdetailtable = new Performerdetailtable();
        performerdetailtable.setPage(1);
        performerdetailtable.setPageSize(9);
        PageInfo<Performerdetailtable> page = performerService.findByPage(performerdetailtable);
        model.addAttribute("performers",page.getList());
        return "WEB-INF/jsp/main/main";
    }
}
