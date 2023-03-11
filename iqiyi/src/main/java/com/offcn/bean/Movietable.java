package com.offcn.bean;

import com.offcn.util.PageRequest;

public class Movietable extends PageRequest {
    private Integer id;

    private String moviename;

    private String time;

    private String url;

    private String imagepath;

    private String saveimagepath;

    private Float score;

    private Integer status;

    private String source;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMoviename() {
        return moviename;
    }

    public void setMoviename(String moviename) {
        this.moviename = moviename == null ? null : moviename.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath == null ? null : imagepath.trim();
    }

    public String getSaveimagepath() {
        return saveimagepath;
    }

    public void setSaveimagepath(String saveimagepath) {
        this.saveimagepath = saveimagepath == null ? null : saveimagepath.trim();
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    public void setPage(int i) {
    }

    public void setPageSize(int i) {
    }
}