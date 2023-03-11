package com.offcn.controller;


import com.github.pagehelper.PageInfo;
import com.offcn.bean.Categroymovietable;
import com.offcn.bean.ConditionBean;
import com.offcn.bean.Moviedetailtable;
import com.offcn.bean.Movietable;
import com.offcn.service.CategoryService;
import com.offcn.service.MovieService;
import com.offcn.util.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("movie")
public class MovieController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private MovieService movieService;
    @RequestMapping("show-movie")
    public String showMovieList(Model model, ConditionBean conditionBean, @RequestParam(defaultValue = "1")int currentPage){
        //获取所有的电影类型
        List<Categroymovietable> categroyMovies = categoryService.findCategroyMovies();
        List<String> categroyNames = new ArrayList<>();
        for (Categroymovietable categroymovietable:categroyMovies){
            categroyNames.add(categroymovietable.getTitle());
        }
        model.addAttribute("searchS",categroyNames);
        conditionBean.setPage(currentPage);
        conditionBean.setPageSize(9);
        PageInfo<Movietable> pageInfo=movieService.findMoviesByConditionBean(conditionBean);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("conditionBean",conditionBean);
        return "WEB-INF/jsp/movie/movielist";
    }
    /*展示新增电影*/
    @RequestMapping("show-add-movie")
    public String showAddMovie(){
        return "WEB-INF/jsp/movie/movieadd";
    }
    /*新增电影*/
    @RequestMapping("add-movie")
    public String addMovie(Movietable movietable, Moviedetailtable moviedetailtable,
                           @RequestParam("files")MultipartFile files, HttpServletRequest request) throws IOException {
        movietable.setStatus(1);
        movietable.setSource("iqiyi");
        //上传图片
        String oldFileName = files.getOriginalFilename();
        int index = oldFileName.lastIndexOf(".");
        String suffix = oldFileName.substring(index);
        String newFileName = UUID.randomUUID().toString()+suffix;
        File path = new File(request.getSession().getServletContext().getRealPath("photo"),newFileName);
        try{
            files.transferTo(path);
            movietable.setSaveimagepath("/photo/"+newFileName);
        }catch (IOException e){
            e.printStackTrace();
        }
        BaseResult result = movieService.addMovie(movietable,moviedetailtable);
        if (result.isSuccess()){
            return "redirect:/movie/show-movie";
        }else {
            return "forward:/movie/show-add-movie";
        }
    }
}















