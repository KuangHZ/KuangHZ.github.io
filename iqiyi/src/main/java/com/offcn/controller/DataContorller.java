package com.offcn.controller;


import com.offcn.bean.DataBean;
import com.offcn.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("data")
public class DataContorller {
    @Autowired
    private DataService dataService;
    @RequestMapping("show-data")
    public String showData(Model model){
        //获取统计数据
        DataBean dataBean = dataService.queryData();
        model.addAttribute("data",dataBean);
        return "/WEB-INF/jsp/main/data";
    }
}
