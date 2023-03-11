package com.offcn.bean;

import java.util.List;

public class DataBean {
    private Long movienum;
    private Long perfomernum;
    private Long usernum;
    private Long categroynum;
    private List<CategroyTop> tops;

    public Long getMovienum() {
        return movienum;
    }

    public void setMovienum(Long movienum) {
        this.movienum = movienum;
    }

    public Long getPerfomernum() {
        return perfomernum;
    }

    public void setPerfomernum(Long perfomernum) {
        this.perfomernum = perfomernum;
    }

    public Long getUsernum() {
        return usernum;
    }

    public void setUsernum(Long usernum) {
        this.usernum = usernum;
    }

    public Long getCategroynum() {
        return categroynum;
    }

    public void setCategroynum(Long categroynum) {
        this.categroynum = categroynum;
    }

    public List<CategroyTop> getTops() {
        return tops;
    }

    public void setTops(List<CategroyTop> tops) {
        this.tops = tops;
    }

    @Override
    public String toString() {
        return "DataBean{" +
                "movienum=" + movienum +
                ", perfomernum=" + perfomernum +
                ", usernum=" + usernum +
                ", categroynum=" + categroynum +
                ", tops=" + tops +
                '}';
    }
}
